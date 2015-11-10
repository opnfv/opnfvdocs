How to Contribute
-----------------

Anyone is welcome to make additions, raise bugs, and fix issues within this Documentation. To do so, you will however need to first get an enviroment set up.

Development Environment
#######################

All project data such as formatting guidelines, and upstream mapping is documented via sphinx which uses reStructuredText

It is recommended that you use a python virtualenv to keep things clean and contained. 

VirtualEnv
**********

Use of a virtual environment is recommended, as not only is it a quick easy form of getting the needed modules in place, it isolates the module versions to a project.

From within your inspector directory, set up a new virtualenv::

    virtualenv venv

Activate the new virtual environment::

    source venv/bin/activate

Install requirements::

    pip install -r requirements.txt

Sphinx Basics
*************

To get started with sphinx, visit the main tutorial which will provide a primer `http://sphinx-doc.org/tutorial.html`

Hack your changes into opnfv-security-guide/source

To compile changes:

    make html

From here you can run a basic python web server or just navigate to the file:///<repo>/opnfv-security-guide/build/html/index.html in your browser 