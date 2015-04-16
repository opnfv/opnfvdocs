How to setup the workflow of automatic documentation build for your project
----------------------------------------------------------------------------


**Setup you repository and then clone locally**::

 ssh-add your-ssh.key

 git clone ssh://<username>@gerrit.opnfv.org:29418/<project>

 cd <project>


**Inside the repository create the following structure:**::

   gerrit.opnfv.org/<project> - docs/
                                    /main.rst
                                    /other-docus.rst
                                    /images/*.png|*.jpg


**In order to obtain a nice .html & .pdf at then end you must write you documentation using reSt markup**

quick guide: http://docutils.sourceforge.net/docs/user/rst/quickref.html


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

 
 #the double {{ in file_cut="${{file%.*}}" is to escape jjb's yaml



**Edit <your-project>.yml**::

 vi releng/jjb/<your-project>/<your-project>.yml


Make sure you have the job-templates set right

example: less releng/jjb/opnfvdocs/opnfvdocs.yml (pay extra attention at the "builder" sections)::

 - job-template:
    name: 'opnfvdocs-daily-{stream}'
    ...
    builders:
        - shell:
            !include-raw build-docu.sh
        - shell: |
            echo $PATH
            /usr/local/bin/gsutil cp docs/*.pdf gs://artifacts.opnfv.org/opnfvdocs/docs/
            /usr/local/bin/gsutil cp docs/*.html gs://artifacts.opnfv.org/opnfvdocs/docs/

 - job-template:
    name: 'opnfvdocs-verify'
    ...
    builders:
        - shell:
            !include-raw build-docu.sh

 - job-template:
    name: 'opnfvdocs-merge'
    ...
    builders:
        - shell:
            !include-raw build-docu.sh
        - shell: |
           /usr/local/bin/gsutil cp docs/*.pdf gs://artifacts.opnfv.org/opnfvdocs/docs/
           /usr/local/bin/gsutil cp docs/*.html gs://artifacts.opnfv.org/opnfvdocs/docs/


Please reffer to the releng repository for the correct indentation as JJB is very picky with those and also for the rest of the code that is missing in the example code and replaced by "...".
Also you must have your documentation under docs/ in the repository or gsutil will fail to copy them; for customizations you might need to addapt build-docu.sh as we did for genesis project as different documents need to go into different places.


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

http://artifacts.opnfv.org/

example: http://artifacts.opnfv.org/opnfvdocs/docs/enable_docu_gen.pdf


**Scrape content from html artifacts on wiki**

This section describes how the html build artifacts can be made visible on Wiki using he scrape method.
In order to have you documentation on Wiki you need to create a wiki page and include an adaption of the code below:

example::

 {{scrape>http://artifacts.opnfv.org/opnfvdocs/docs/enable_docu_gen.html}}


Please try to write documentation as accurate and clear as possible as once reviewed and merged it will be automatically built and displayed on Wiki and everyone would apreciate a good written/nice looking guide.


**Download the PDF version of this documentation**

`enable_docu_gen.pdf <http://artifacts.opnfv.org/opnfvdocs/docs/enable_docu_gen.pdf >`

NOTE:
------

In order to generate html & pdf documentation the needed packages are rst2pdf & python-docutils if the Jenkins is CentOS/RHEL; many variants have been tested but this is the cleanest solution found.
For html generation it also supports css styles if needed.



