
=============================================
OPNFV User guide documentation instruction
=============================================

Document Purpose
------------------
The user guide is an OPNFV release document that describes how to use and configure the system to use OPNFV features once the base platform installation and configuration is complete. The document describes the general usage of the system and the methods of leveraging OPNFV features for an operator of applicatons running on the OPNFV platform.
Working with the document

The document is structured around an index.rst file in the opnfvdocs repository. This file is used to construct and collate the various document elements both from the opnfvdocs repository and project specific user guide documentation.

If you intend to deliver features into the platform that provide specific behaviours with feature configurations you must provide input for this document. The document structure and methods of providing input are described below.
Document structure

The user guide is hosted in the opnfvdocs repository and consists of these global files:

User Guide directory:
	

opnfvdocs/docs/userguide/

Master index file for collating the document:
	

opnfvdocs/docs/userguide/index.rst

Abstract explaining the Document:
	

opnfvdocs/docs/userguide/abstract.rst

Introduction to installation and configuration:
	

opnfvdocs/docs/userguide/introduction.rst

The document is further compiled of project specific chapters, feature descriptions, and usage procedures. Every project providing features into the platform should provide a description in this document on how to use the features. The composite description content should be at a level that a user might understand how to use the features and capabilities and may also provide references to the projects own documentation for more detailed descriptions.

Project document content references are provided in the area staging files, there are three main sections to the user guide where you might provide content, the staging files are:

Common OPNFV component level user guides:
-------------------------------------------

/opnfvdocs/docs/userguide/general-system.rst

OPNFV test project user guides:
	

/opnfvdocs/docs/userguide/test-usage.rst

OPNFV Feature user guides:
	

/opnfvdocs/docs/userguide/feature-usage.rst

The project specific files to be compiled into the user guide must be stored in your projects userguide folder.

User Guide directory:
-----------------------

<repo>/docs/userguide/
	
Testing user guide:
	

<repo>/docs/userguide/testusage.rst
	

Feature user guide:
---------------------

<repo>/docs/userguide/featureusage.rst
	


Including your Documentation
------------------------------

Add your documentation to your repository in the folder structure and according to the template listed above. The documentation template you will require are available in the opnfvdocs repository, you should copy the relevant templates to the /docs/userguide directory in your repository. For instance if I wanted to document enabling my feature set in the platform I would follow an example like:

.. code-block:: bash
   mkdir <my_repo>/docs/userguide
   git clone ssh://<your_id>@gerrit.opnfv.org:29418/opnfvdocs.git
   cp opnfvdocs/docs/userguide/userguide.rst <my_repo>/docs/userguide


You should then add the relevant information to the template that will explain the usage of your feature and instructions for validating that the feature was used successfully like checking the results of specific test cases. Be sure to maintain the creative commons license from the template and ensure all your documentation files include the license information.

Once your documentation is ready you should ensure they are compiled into the staging files by adding them to the master <section>.rst file in the opnfvdocs repository. The staging files are structured in such a way that you should refer to your document in the correct section of the document structure.

An example of how to add your documentation to the relevant sections of the feature-usage.rst file might be:

.. code-block:: bash
   git clone ssh://<your_id>@gerrit.opnfv.org:29418/opnfvdocs.git
   cd opnfvdocs
   git review -s
   vim docs/userguide/feature-usage.rst '


At this point you should add the references to your files into the index.rst file, for instance in the feature description section you would add the line:
The following sections of the user guide provide feature specific usage guidelines and references.
Providing users the necessary information to leveraging the features in the platform,
some operation in this section may refer back to the guides in the general system usage section.

.. code-block:: bash
.. include:: ../projects/promise/userguide/userguide.rst
.. include:: ../projects/copper/userguide/userguide.rst  Using Brahmaputra Features
.. include:: ../projects/<my_repo>/userguide/userguide.rst''


If this is the first contribution from your project to the composite document files you will need to add your project to the build-composite.sh file in the opnfvdocs directory. This is done my editing the jsdgf file and adding your repository name to the get_repo_names() function of the script. Assuming you are still in the opnfvdocs directory edit the file with the following command:
' vim build-composite.sh '


Once you have the file open, add your projects repository to the get_repo_names() function:

.. code-block:: python
	get_repo_names() {
	  # NOTE: Not all repositories are ready for the composite docs,
	  #       so we have the repo name list here to add project docs
	  #       one by one. This will be replaced by the list in project.cfg .
	  # grep -v '^#' releng/jjb/opnfvdocs/project.cfg | sort
	  echo "sdnvpn"
	  echo "<my_repo>"


Once you have made these changes you need to push the patch back to the opnfvdocs team for review and integration.

.. code-block:: bash
	' git add . '
	' git commit --signoff --all '
	' git review '

 

Be sure to add the project leader of the opnfvdocs project as a reviewer of the change you just pushed in gerrit. Also be aware that once the text is available in the context of the broader release document it may require some revising and editorial work to prepare it for release.
