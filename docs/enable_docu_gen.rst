How to setup the workflow of automatic documentation build for your project
----------------------------------------------------------------------------

**Setup you repository and then clone locally**::

 ssh-add your-ssh.key

 git clone ssh://<username>@gerrit.opnfv.org:29418/<project>

 cd <project>


**Inside the repository create the following structure:**::

   gerrit.opnfv.org/<project>/docs/some-project-description.rst
                                  /other-doc-1.rst
                                  /images/*.png|*.jpg

                              docs/release/some-release-doc.rst

                              requirements/requirements.rst

                              design_docs/some-design-doc.rst


More details about the default structure you can find `here <https://wiki.opnfv.org/documentation>`_ at paragraph "How and where to store the document content files in your repository".

**In order to obtain a nice .html & .pdf at then end you must write you documentation using reSt markup**

quick guides:

* http://docutils.sourceforge.net/docs/user/rst/quickref.html
* http://rest-sphinx-memo.readthedocs.org/en/latest/ReST.html
* http://www.math.uiuc.edu/~gfrancis/illimath/windows/aszgard_mini/movpy-2.0.0-py2.4.4/manuals/docutils/ref/rst/directives.html

An `nice online editor <http://rst.ninjs.org/>`_ that will help you write reSt and see your changes live. After done editing you can copy the source document in the repository and follow the workflow.


**Clone the releng repository so you can created jobs for JJB**::

 git clone ssh://<username>@gerrit.opnfv.org:29418/releng


Enter the project settings::

 cd releng/jjb/<project>/


**Create the verify & build scripts**

The script is the same for most of the projects and you can just copy it under your project in releng/jjb/<project>/

example: cp releng/jjb/opnfvdocs/build-docu.sh releng/jjb/<your-project>/

**docu-build.sh**::

 #!/bin/bash
 set -e
 set -o pipefail

 project="$(git remote -v | head -n1 | awk '{{print $2}}' | sed -e 's,.*:\(.*/\)\?,,' -e 's/\.git$//')"
 export PATH=$PATH:/usr/local/bin/

 git_sha1="$(git rev-parse HEAD)"
 docu_build_date="$(date)"

 files=()
 while read -r -d ''; do
         files+=("$REPLY")
 done < <(find * -type f -iname '*.rst' -print0)

 for file in "${{files[@]}}"; do

         file_cut="${{file%.*}}"
         gs_cp_folder="${{file_cut}}"

         # sed part
         sed -i "s/_sha1_/$git_sha1/g" $file
         sed -i "s/_date_/$docu_build_date/g" $file

         # rst2html part
         echo "rst2html $file"
         rst2html $file | gsutil cp -L gsoutput.txt - \
         gs://artifacts.opnfv.org/"$project"/"$gs_cp_folder".html
         gsutil setmeta -h "Content-Type:text/html" \
                        -h "Cache-Control:private, max-age=0, no-transform" \
                        gs://artifacts.opnfv.org/"$project"/"$gs_cp_folder".html
         cat gsoutput.txt
         rm -f gsoutput.txt

         echo "rst2pdf $file"
         rst2pdf $file -o - | gsutil cp -L gsoutput.txt - \
         gs://artifacts.opnfv.org/"$project"/"$gs_cp_folder".pdf
         gsutil setmeta -h "Content-Type:application/pdf" \
                        -h "Cache-Control:private, max-age=0, no-transform" \
                        gs://artifacts.opnfv.org/"$project"/"$gs_cp_folder".pdf
         cat gsoutput.txt
         rm -f gsoutput.txt

 done

 images=()
 while read -r -d ''; do
         images+=("$REPLY")
 done < <(find * -type f \( -iname \*.jpg -o -iname \*.png \) -print0)

 for img in "${{images[@]}}"; do

         # uploading found images
         echo "uploading $img"
         cat "$img" | gsutil cp -L gsoutput.txt - \
         gs://artifacts.opnfv.org/"$project"/"$img"
         gsutil setmeta -h "Content-Type:image/jpeg" \
                         -h "Cache-Control:private, max-age=0, no-transform" \
                         gs://artifacts.opnfv.org/"$project"/"$img"
         cat gsoutput.txt
         rm -f gsoutput.txt

 done

 #the double {{ in file_cut="${{file%.*}}" is to escape jjb's yaml


**docu-verify.sh**::

 #!/bin/bash
 set -e
 set -o pipefail

 project="$(git remote -v | head -n1 | awk '{{print $2}}' | sed -e 's,.*:\(.*/\)\?,,' -e 's/\.git$//')"
 export PATH=$PATH:/usr/local/bin/

 git_sha1="$(git rev-parse HEAD)"
 docu_build_date="$(date)"

 files=()
 while read -r -d ''; do
         files+=("$REPLY")
 done < <(find * -type f -iname '*.rst' -print0)

 for file in "${{files[@]}}"; do

         file_cut="${{file%.*}}"
         gs_cp_folder="${{file_cut}}"

         # sed part
         sed -i "s/_sha1_/$git_sha1/g" $file
         sed -i "s/_date_/$docu_build_date/g" $file

         # rst2html part
         echo "rst2html $file"
         rst2html $file > $file_cut".html"

         echo "rst2pdf $file"
         rst2pdf $file -o $file_cut".pdf"

 done

 #the double {{ in file_cut="${{file%.*}}" is to escape jjb's yaml


**Edit <your-project>.yml**::

 vi releng/jjb/<your-project>/<your-project>.yml


Make sure you have the job-templates set correctly as below.

example: less releng/jjb/opnfvdocs/opnfvdocs.yml (pay extra attention at the "builder" sections)

**opnfvdocs.yml**::

 - job-template:
    name: 'opnfvdocs-daily-{stream}'

    node: master
    ...
    builders:
        - shell:
            !include-raw docu-build.sh

 - job-template:
    name: 'opnfvdocs-verify'

    node: master
    ...
    builders:
        - shell:
            !include-raw docu-verify.sh

 - job-template:
    name: 'opnfvdocs-merge'

    node: master
    ...
    builders:
        - shell:
            !include-raw docu-build.sh


"node: master" is important here as all documentations are built on Jenkins master node for now.

Please reffer to the releng repository for the correct indentation as JJB is very picky with those and also for the rest of the code that is missing in the example code and replaced by "...".
Also you must have your documentation under docs/ in the repository or gsutil will fail to copy them; for customizations you might need to addapt build-docu.sh as we did for genesis project as different documents need to go into different places.


Stage files::

 git add  build-docu.sh <project>.yml


Commit change with --signoff::

 git commit --signoff


Send code for review in Gerrit::

 git review -v


Create the documentation using the recommended structure in your repository and submit to gerrit for review


**Jenkins will take over and produce artifacts in the form of .html & .pdf**

Jenkins has the proper packages installed in order to produce the artifacts.


**Artifacts are stored on Google Storage (still to decide where, structure and how to present them)**

http://artifacts.opnfv.org/


`Here you can download the PDF version <http://artifacts.opnfv.org/opnfvdocs/docs/enable_docu_gen.pdf>`_ of this guide.


**Scrape content from html artifacts on wiki**

This section describes how the html build artifacts can be made visible on Wiki using he scrape method.
In order to have you documentation on Wiki you need to create a wiki page and include an adaption of the code below:

example::

 {{scrape>http://artifacts.opnfv.org/opnfvdocs/docs/enable_docu_gen.html}}


Please try to write documentation as accurate and clear as possible as once reviewed and merged it will be automatically built and displayed on Wiki and everyone would apreciate a good written/nice looking guide.

If you want to see on wiki what code is scraped from the built artifacts click "Show pagesource" in the right (it will appear if you hover over the magnifier icon); this way you know what is written straight on wiki and what is embedded with "scrape". By knowing these details you will be able to prevent damages by manually updating wiki.


**Wiki update - how it works**

Edit Wiki page https://wiki.opnfv.org/<page> and look for {{scrape>http://artifacts.opnfv.org/<project>/<folder>/<doc-file>.html}}
Click "Preview" and see if your submitted to Git change is present in the documentation (contains your added/changed text) and if you are sure that your approved/merged change is present add a short description in "Edit summary" field, then click "Save" to update the page. This extra step is needed as Wiki does not auto update content for now.


**How to track documentation**

You must include at the bottom of every document that you want to track the following::

 **Documentation tracking**

 Revision: _sha1

 Build date:  _date

 # add one "_" at the end of each trigger variable (they have also a prefix "_") when inserting them into documents to enable auto-replacement


**Image inclusion for artifacts**

Create a folder called images in the same folder where you documentation resides and copy .jpg or .png files there, according to the guide here: https://wiki.opnfv.org/documentation

Here is an example of what you need to include in the .rst files to include an image::

 .. image:: images/smiley.png
    :height: 200
    :width: 200
    :alt: Just a smiley face!
    :align: left

The image will be shown in both .html and .pdf resulting artifacts.


NOTE:
------

In order to generate html & pdf documentation the needed packages are rst2pdf & python-docutils if the Jenkins is CentOS/RHEL; many variants have been tested but this is the cleanest solution found.
For html generation it also supports css styles if needed.


**Documentation tracking**

Revision: _sha1_

Build date:  _date_


