How to setup the workflow of documentation build for your project
==================================================================

**Setup you repository and then clone locally**

   ssh-add your-ssh-key
   git clone ssh://<username>@gerrit.opnfv.org:29418/<project>


**Inside the repository create the following structure:**
   gerrit.opnfv.org/<project> - docs/
                                               --- docs/main.rst
                                               --- docs/other-docus.rst
                                               --- docs/images/*.png|*.jpg


**In order to obtain a nice .html & .pdf at then end you must write you documentation using reSt markup**

  a quick guide: http://docutils.sourceforge.net/docs/user/rst/quickref.html


**Clone the releng repository so you can created jobs for JJB**::

git clone ssh://<username>@gerrit.opnfv.org:29418/releng

Enter the project settings::

cd releng/jjb/<project>/


**Create build-docu.sh**

The script is the same for most of the projects and you can just copy it under your project in releng/jjb/<project>/

example: cp releng/jjb/opnfvdocs/build-docu.sh releng/jjb/<your-project>/::

#!/bin/bash
set -xv
for file in $(find . -type f -iname '*.rst'); do
        file_cut="${{file%.*}}"
        html_file=$file_cut".html"
        pdf_file=$file_cut".pdf"
        rst2html $file > $html_file
        rst2pdf $file -o $pdf_file
done



**Edit <your-project>.yml**::

vi releng/jjb/<your-project>/<your-project>.yml


Make sure you have the job-templates set right

example: less releng/jjb/opnfvdocs/opnfvdocs.yml (pay extra attention at the "builder" section)::

- job-template:
    name: 'opnfvdocs-daily-{stream}'

    # Job template for daily builders
    #
    # Required Variables:
    #     stream:    branch with - in place of / (eg. stable)
    #     branch:    branch (eg. stable)

    project-type: freestyle

    logrotate:
        daysToKeep: '{build-days-to-keep}'
        numToKeep: '{build-num-to-keep}'
        artifactDaysToKeep: '{build-artifact-days-to-keep}'
        artifactNumToKeep: '{build-artifact-num-to-keep}'

    parameters:
        - project-parameter:
            project: '{project}'

    scm:
        - git-scm:
            credentials-id: '{ssh-credentials}'
            refspec: ''
            branch: '{branch}'

    wrappers:
        - ssh-agent-credentials:
            user: '{ssh-credentials}'

    triggers:
        - timed: 'H H * * *'

    builders:
        - shell:
            !include-raw build-docu.sh
        - shell: |
            echo $PATH
            /usr/local/bin/gsutil cp docs/*.pdf gs://artifacts.opnfv.org/opnfvdocs/docs/
            /usr/local/bin/gsutil cp docs/*.html gs://artifacts.opnfv.org/opnfvdocs/docs/

- job-template:
    name: 'opnfvdocs-verify'

    project-type: freestyle

    logrotate:
        daysToKeep: 30
        numToKeep: 10
        artifactDaysToKeep: -1
        artifactNumToKeep: -1

    parameters:
        - project-parameter:
            project: '{project}'
        - gerrit-parameter:
            branch: 'master'
    scm:
        - gerrit-trigger-scm:
            credentials-id: '{ssh-credentials}'
            refspec: '$GERRIT_REFSPEC'
            choosing-strategy: 'gerrit'

    wrappers:
        - ssh-agent-credentials:
            user: '{ssh-credentials}'

    triggers:
        - gerrit:
            trigger-on:
                - patchset-created-event:
                    exclude-drafts: 'false'
                    exclude-trivial-rebase: 'false'
                    exclude-no-code-change: 'false'
                - draft-published-event
                - comment-added-contains-event:
                    comment-contains-value: 'recheck'
                - comment-added-contains-event:
                    comment-contains-value: 'reverify'
            projects:
              - project-compare-type: 'ANT'
                project-pattern: 'opnfvdocs'
                branches:
                  - branch-compare-type: 'ANT'
                    branch-pattern: '**/master'

    builders:
        - shell:
            !include-raw build-docu.sh

- job-template:
    name: 'opnfvdocs-merge'

    # builder-merge job to run JJB update
    #
    # This job's purpose is to update all the JJB

    project-type: freestyle

    logrotate:
        daysToKeep: 30
        numToKeep: 40
        artifactDaysToKeep: -1
        artifactNumToKeep: 5

    parameters:
        - project-parameter:
            project: '{project}'
        - gerrit-parameter:
            branch: 'master'

    scm:
        - gerrit-trigger-scm:
            credentials-id: '{ssh-credentials}'
            refspec: ''
            choosing-strategy: 'default'

    wrappers:
        - ssh-agent-credentials:
            user: '{ssh-credentials}'

    triggers:
        - gerrit:
            trigger-on:
                - change-merged-event
                - comment-added-contains-event:
                    comment-contains-value: 'remerge'
            projects:
              - project-compare-type: 'ANT'
                project-pattern: 'opnfvdocs'
                branches:
                    - branch-compare-type: 'ANT'
                      branch-pattern: '**/master'

    builders:
        - shell:
            !include-raw build-docu.sh
        - shell: |
           /usr/local/bin/gsutil cp docs/*.pdf gs://artifacts.opnfv.org/opnfvdocs/docs/
           /usr/local/bin/gsutil cp docs/*.html gs://artifacts.opnfv.org/opnfvdocs/docs/



Stage files::

 git add  build-docu.sh <project>.yml

Commit change with --signoff::

 git commit --signoff


Send code for review in Gerrit::

 git review -v




**Create the documentation using the recommended structure in your repository and submit to gerrit for review**

**Jenkins will take over and produce artifacts in the form of .html & .pdf**
Jenkins has the proper packages installed in order to produce the artifacts.

**Artifacts are stored on Google Storage (still to decide where, structure and how to present them)**



**NOTE:** In order to generate html & pdf documentation the needed packages are rst2pdf & python-docutils 
if the Jenkins is CentOS/RHEL; many variants have been tested but this is the cleanest as a solution.



**Other options:**


1. Doxygen plugin -> HTML published plugin (html)/ LaTeX (pdf)
---------------------------------------------------------------

 Description:

- html: using Doxygen plugin + HTML publisher
  It involves some customization at doxygen level + custom html header/footer

 - pdf: it generates a .pdf using latex

 Final destination of generated files needs to be discussed as it will be part of a Bash script in Post-actions.

 Input files: .md , .rst

 Output: .html & .pdf

 Pros:

      - standard tools: doxygen, html publisher, LaTeX suite
      - doxygen plugin available in Jenkins, you just need to install it; html publisher plugin available in Jenkins, you just need to install it
      - destination files are generated fast
      - standard reStructuredText or Markdown

 Cons:

      - takes some time to customize the output in matters of template, requires custom html header/footer
      - latex suite is quite substantial in amount of packages and consumed space (around 1.2 GB)

 Tested: roughly, functional tests only



2. Maven & clouddocs-maven-plugin (actually used to generate openstack-manuals)
--------------------------------------------------------------------------------

 Description: It represents the standard tool to generate Openstack documentation manuals, uses maven, maven plugins, clouddocs-maven-plugins; location of finally generated files is the object of a small Bash script that will reside as Post-actions

 Input files: .xml

 Output: .html & .pdf

 Pros:

      - quite easy for initial setup
      - uses openstack documentation generation flows as for openstack-manuals (clouddocs-maven-plugin), maven installs all you need generate the documentation

 Cons:

      - could be tricky to generate a custom layout, knowledge about Maven plugins required, .pom editing
      - dependent of multiple maven plugins
      - input files are .xml and xml editing knowledge is required

 Tested: roughly, functional tests only



3. Sphinx & LaTeX suite
------------------------

 Description: The easiest to install, the cleanest in matter of folder & files structure, uses standard tools available in repositories; location of finally generated files is the object of a small Bash script that will reside as Post-actions

 Input files: .rst as default

 Output: .html & .pdf

 Pros:

      - standard tools: Python Sphinx, LaTeX suite
      - destination files are generated fast
      - standard reStructuredText as default; other inputs can be configured
      - Sphinx's installation is very clean in matters of folder structure; the cleanest from all tested variants
      - latex suite is also easy to install via yum/apt and available in general repos
      - everyone is migration from other tools to Spinx lately; it provides more control and better looking documentation
      - can be used also for source-code documentation, specially if you use Python

 Cons:

      - takes some time to customize the output in matters of template, requires custom html header/footer
      - latex suite is quite substantial in amount of packages and consumed space (around 1.2 GB)

Tested: roughly, functional tests only


