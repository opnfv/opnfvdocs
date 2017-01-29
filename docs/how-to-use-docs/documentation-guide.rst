=====================
Documentation Guide
=====================

This page intends to cover the documentation handling for OPNFV. OPNFV projects are expected to create a variety of document types, according to the nature of the project. Some of these are common to projects that develop/integrate features into the OPNFV platform, e.g. Installation Instructions and User/Configurations Guides. Other document types may be project-specific.

.. contents::
   :depth: 3
   :local:

Getting Started with Documentation for Your Project
----------------------------------------------------
OPNFV documentation is automated and integrated into our git & gerrit toolchains.

We use RST document templates in our repositories and automatically render to HTML and PDF versions of the documents in our artifact store, our WiKi is also able to integrate these rendered documents directly allowing projects to use the revision controlled documentation process for project information, content and deliverables.

Enabling the documentation toolchain in your project
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
There are some basic steps you will need to perform in order to get the toolchain working in your repository, this include setting up Jenkins jobs and establishing your project documentation structure. See the document toolchain instructions for more details on getting started in your project.
The linked page above is written completely in generated artifacts, check the source to see how to do it yourself!

Licencing your documentation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
All contributions to the OPNFV project are done in accordance with the OPNFV licensing requirements. Documentation in OPNFV is contributed in accordance with the `Creative Commons 4.0 <https://creativecommons.org/licenses/by/4.0/>`_ licence.
All documentation files need to be licensed using the creative commons licence. The following example may be applied in the first lines of all contributed RST files:

.. code-block:: bash

 .. This work is licensed under a Creative Commons Attribution 4.0 International License.
 .. http://creativecommons.org/licenses/by/4.0
 .. (c) <optionally add copywriters name>

These lines will not be rendered in the html and pdf files.

How and where to store the document content files in your repository
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
All documentation for your project should be structured and stored in the :code:`<repo>/docs/` directory. The documentation toolchain will look in these directories and be triggered on events in these directories when generating documents.

Document structure and contribution
-------------------------------------
A general structure is proposed for storing and handling documents that are common across many projects but also for documents that may be project specific. The documentation is divided into three areas Release, Development and Testing. Templates for these areas can be found under :code:`opnfvdocs/docs/templates/`.

Project teams are encouraged to use templates provided by the opnfvdocs project to ensure that there is consistency across the community. Following representation shows the expected structure:

::

	.
	├── developer
	│   ├── design
	│   ├── overview
	│   └── requirements
	├── release
	│   ├── configguide
	│   ├── installation
	│   ├── release-notes
	│   ├── scenarios
	│   │   └── scenario.name
	│   └── userguide
	└── testing


Release documentation
^^^^^^^^^^^^^^^^^^^^^^^^
Release documentation is the set of documents that are published for each OPNFV release. These documents are created and developed following the OPNFV release process and milestones and should reflect the content of the OPNFV release.
These documents have a master index.rst file in the <opnfvdocs> repository and extract content from other repositories. To provide content into these documents place your <content>.rst files in a directory in your repository that matches the master document and add a reference to that file in the correct place in the corresponding index.rst file in :code:`opnfvdocs/docs/release/`.

**Platform Overview**: :code:`opnfvdocs/docs/release/overview`

- Note this document is not a contribution driven document
- Content for this is prepared by the Marketing team together with the opnfvdocs team

**Installation Instruction**: :code:`<repo>/docs/release/installation`

- Folder for documents describing how to deploy each installer and scenario descriptions
- Release notes will be included here <To Confirm>
- Security related documents will be included here
- Note that this document will be compiled into 'OPNFV Installation Instruction'

**User Guide**: :code:`<repo>/docs/release/userguide`

- Folder for manuals to use specific features
- Folder for documents describing how to install/configure project specific components and features
- Can be the directory where API reference for project specific features are stored
- Note this document will be compiled into 'OPNFV userguide'
- **Configuration Guide**: <To Do>

**Release Notes**: :code:`<repo>/docs/release/release-notes`

- <To Do>

Testing documentation
^^^^^^^^^^^^^^^^^^^^^^^^
*Structure TBD together with test projects*

Development Documentation
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Documentation not aimed for any specific release such as design documentation, project overview or requirement documentation can be stored under /docs/development. Links to generated documents will be dislayed under Development Documentaiton section on docs.opnfv.org. You are encouraged to establish the following basic structure for your project as needed:

**Requirement Documentation**: :code:`<repo>/docs/development/requirements/`

- Folder for your requirement documentation
- For details on requirements projects' structures see the `Requirements Projects <https://wiki.opnfv.org/display/PROJ/Requirements+Projects>`_ page.

**Design Documentation**: :code:`<repo>/docs/development/design`

- Folder for your upstream design documents (blueprints, development proposals, etc..)

**Project overview**: :code:`<repo>/docs/development/overview`

- Folder for any project specific documentation.

