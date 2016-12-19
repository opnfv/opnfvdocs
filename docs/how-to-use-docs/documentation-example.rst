==================================================
How to create documentation for your OPNFV project
==================================================

.. comment1

Directory Structure
===================

This is the directory structure of the docs/ directory which have to be placed
in the root of your project directory.

.. code-block:: bash

    ./how-to-use-docs/documentation-example.rst
    ./how-to-use-docs/index.rst

To create your own document, create any number of directories (depending
on your need, e.g. manual) under the docs/ and place an index.rst in each
directories.
The depth of all directory should be one, so that you can make sure that
all directory names are unique. If you want to have set of all documents in
your repo, create new ``docs/all/index.rst`` and list document links in OPNFV
artifact server (artifact.opnfv.org) instead of including all other rst files
or having ``docs/index.rst``, in order to avoid having duplicated contents in
your documents.

Note:
You may have "docs/how-to-use-docs/" in you project repo. You can delete it,
since it is sample and master version is stored in opnfvdocs repo.

Note:
During the document build process, 'docs_build' and 'docs_output' will be
created in the project root directory. To avoid conflict, you should not
use those names and should add the following entries in '.gitignore' file
so that git can ignore built files.

.. code-block:: bash

    /docs_build/
    /docs_output/

Index File
==========

This index file must refence your other rst files in that directory.

Here is an example index.rst :

.. code-block:: bash

    *******************
    Documentation Title
    *******************

    .. toctree::
       :numbered:
       :maxdepth: 2

       documentation-example.rst

Source Files
============

Document source files have to be written in reStructuredText format (rst).
Each file would be build as an html page.

Here is an example source rst file :

.. code-block:: bash

    =============
    Chapter Title
    =============

    Section Title
    =============

    Hello!

Writing RST Markdown
====================

See http://sphinx-doc.org/rest.html .

**Hint:**
You can add dedicated contents by using 'only' directive with build type
('html' and 'singlehtml') for OPNFV document. But, this is not encouraged to
use since this may make different views.

.. code-block:: bash

    .. only:: html
        This line will be shown only in html version.

Configuration
=============

If you need to change the default configuration for document build, create
new conf.py in the document directory (e.g. 'docs/how-to-use-docs/conf.py')
that will be used in build process instead of default for OPNFV document
build.
During the build process, the following default parameters are automatically
added if they are not set in the ``conf.py``.

* **extensions** =
  ['sphinxcontrib.httpdomain',
  'sphinx.ext.autodoc',
  'sphinx.ext.viewcode',
  'sphinx.ext.napoleon']
* **needs_sphinx** = '1.3'
* **numfig** = True
* **master_doc** = 'index'
* **pygments_style** = 'sphinx'
* **html_use_index** = False
* **html_logo** = 'opnfv-logo.png'
* **html_sidebars** = {'**': ['globaltoc.html',
  '``path to opnfvdocs dir``/etc/pagemenu.html',
  'searchbox.html']}
* **release** = '``git last tag name`` (``git last commit hash``)'
* **version** = '``git last tag name`` (``git last commit hash``)'
* **project** = '``git repo name``'
* **copyright** = '``year``, OPNFV'
* **rst_epilog** = '    Revision:``git last commit hash``\n    Build date:``build date in year-month-date format``'

**Note:**
You can leave the file path for OPNFV logo image which will be prepared
before each document build.

Versioning
==========

The relevant release and version information will be added to your documents
by using tags from your project's git repository.
The tags will be applied by Releng Project.

Testing
=======

You can test document build in your laptop by using build script which is
also used in document build jobs below:

.. code-block:: bash

    $ sudo pip install virtualenv
    $ cd /local/repo/path/to/project
    $ git clone https://git.opnfv.org/opnfvdocs docs_build/_opnfvdocs
    $ ./docs_build/_opnfvdocs/scripts/docs-build.sh

Then, you can see the docs in 'docs_output' directory if build succeeded.

If you have a problem of missing python package, you can make sure all
necessary packages are installed as follows:

.. code-block:: bash

    $ sudo pip install Sphinx==1.3.1 doc8 sphinxcontrib-httpdomain

Note:
Developers are encouraged to use
"ssh://<username>@gerrit.opnfv.org:29418/opnfvdocs"
instead of "https://git.opnfv.org/opnfvdocs", so that you can quickly start
development in opnfvdocs.
See https://wiki.opnfv.org/display/DEV/Developer+Getting+Started for more detail.


Jenkins Jobs
============

Enabling Jenkins Jobs
---------------------

Jenkins in OPNFV infra performs the jobs to verify and update your documents.
To make your project repository watched by Jenkins to execute those jobs, you
have to add your project name in 'project-pattern' of the following jobs by
sending patch to update `jjb/opnfv/opnfv-docs.yml`_ on gerrit.

.. _jjb/opnfv/opnfv-docs.yml:
    https://gerrit.opnfv.org/gerrit/gitweb?p=releng.git;a=blob;f=jjb/opnfv/opnfv-docs.yml;

Verify Job
----------

The verify job name is **opnfv-docs-verify**.

When you send document changes to gerrit, jenkins will create your documents
in HTML formats (normal and single-page) to verify that new document can be
built successfully. Please check the jenkins log and artifact carefully.
You can improve your document even though if the build job succeeded.

Documents will be uploaded to
``http://artifacts.opnfv.org/review/<Change Number>/`` for review.
Those documents will be replaced if you update the change by sending new
patch set to gerrit, and deleted after the change is merged.
Document link(s) can be found in your change page on gerrit as a review
comment.

Merge Job
----------

The merge job name is **opnfv-docs-merge**.

Once you are happy with the look of your documentation, you can submit the
change. Then, the merge job will upload latest build documents to
``http://artifacts.opnfv.org/<Project Name>/docs/`` .
You can put links in your project wiki page, so that everyone can see the
latest document always.

Sphinx Extensions
=================

You can see available sphinx extension(s) in `opnfvdocs/etc/requirements.txt`_.

.. _opnfvdocs/etc/requirements.txt:
    https://gerrit.opnfv.org/gerrit/gitweb?p=opnfvdocs.git;a=blob;f=etc/requirements.txt;

You can use other sphinx extensions to improve your documents.
To share such improvements, we encourage you to enable the extension in OPNFV infra
by asking releng and opnfvdocs teams to add new sphinx extension via gerrit
(proposing change in `opnfvdocs/scripts/docs-build.sh`_ and `opnfvdocs/etc/requirements.txt`_).
After quick sanity checks, we'll merge the patch to make it available in OPNFV
document build.

.. _opnfvdocs/scripts/docs-build.sh:
    https://gerrit.opnfv.org/gerrit/gitweb?p=opnfvdocs.git;a=blob;f=scripts/docs-build.sh;

Hooks
=====

The document builder script supports pre-hook. If you need to execute some
commands before starting to build process (e.g. generate API rst from codes),
create '<your repo>/docs/pre-hook.sh' which will be executed (using 'source')
once before all document build start.
