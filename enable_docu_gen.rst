How to setup the workflow of documentation build for your project

** Setup you repository and then clone locally **

   ssh-add your-ssh-key
   git clone ssh://<username>@gerrit.opnfv.org:29418/<project>


** Inside the repository create the following structure: **
   gerrit.opnfv.org/<project> - docs/
                                               --- docs/main.rst
                                               --- docs/other-docus.rst
                                               --- docs/images/*.png|*.jpg


** In order to obtain a nice .html & .pdf at then end you must write you documentation using reSt markup **

  a quick guide: http://docutils.sourceforge.net/docs/user/rst/quickref.html


** Clone the releng repository so you can created jobs for JJB **

git clone ssh://<username>@gerrit.opnfv.org:29418/releng

cd releng/jjb/<project>/

Create build-docu.sh with the following content:
-------------------------------------------------

#!/bin/bash
set -xv
for file in $(find . -type f -iname '*.rst'); do
        file_cut="${{file%.*}}"
        html_file=$file_cut".html"
        pdf_file=$file_cut".pdf"
        rst2html $file > $html_file
        rst2pdf $file -o $pdf_file
done



Edit <project>.yml and make sure you have a job-template named <project>-docu-build
and you can use the example of opnfvdocs, pharos.



git add  build-docu.sh <project>.yml
git commit --signoff                              #add the proper message to commit
git review -v



** Create the documentation using the recommended structure in your repository and submit to gerrit for review **

** Jenkins will take over and produce artifacts in the form of .html & .pdf **
Jenkins has the proper packages installed in order to produce the artifacts.

** Artifacts are stored on Google Storage (still to decide where, structure and how to present them) **



** NOTE: ** In order to generate html & pdf documentation the needed packages are rst2pdf & python-docutils 
if the Jenkins is CentOS/RHEL; many variants have been tested but this is the cleanest as a solution.



** Other options: **

1. Doxygen plugin -> HTML published plugin (html)/ LaTeX (pdf)
-------------------------------------------------------------------------------------------

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

 Tested: roughly, functional tbeeingests only



2. Maven & clouddocs-maven-plugin (actually used to generate openstack-manuals)
-------------------------------------------------------------------------------------------------------------------------

 Description: It represents the standard tool to generate Openstack documentation manuals,
uses maven, maven plugins, clouddocs-maven-plugins; location of finally generated files is the object of a small
Bash script that will reside as Post-actions

 Input files: .xml

 Output: .html & .pdf

 Pros:
      - quite easy for initial setup
      - uses openstack documentation generation flows as for openstack-manuals (clouddocs-maven-plugin),
maven installs all you need generate the documentation

 Cons:
      - could be tricky to generate a custom layout, knowledge about Maven plugins required, .pom editing
      - dependent of multiple maven plugins
      - input files are .xml and xml editing knowledge is required

 Tested: roughly, functional tests only



3. Sphinx & LaTeX suite
--------------------------------

 Description: The easiest to install, the cleanest in matter of folder & files structure,
uses standard tools available in repositories; location of finally generated files is the object of a small
Bash script that will reside as Post-actions

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

