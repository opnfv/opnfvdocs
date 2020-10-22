===================
Documentation Guide
===================

This page intends to cover the documentation handling for OPNFV. OPNFV projects are expected to create a variety of document types.

.. contents::
   :depth: 3
   :local:

Getting Started with Documentation for Your Project
---------------------------------------------------
OPNFV documentation is automated and integrated into our git & gerrit toolchains.

We use RST document templates in our repositories and automatically render to HTML and PDF versions of the documents in our artifact
store.

The `LFN documenatation guide <https://docs.releng.linuxfoundation.org/en/latest/project-documentation.html>`_ explains how to enable
your documenation build.

Licencing your documentation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
All contributions to the OPNFV project are done in accordance with the OPNFV licensing requirements. Documentation in OPNFV is
contributed
in accordance with the `Creative Commons 4.0 <https://creativecommons.org/licenses/by/4.0/>`_  and the `SPDX <https://spdx.org/>`_
licence.
All documentation files need to be licensed using the text below. The license may be applied in the first lines of
all contributed RST files:

.. code-block:: bash

 .. This work is licensed under a Creative Commons Attribution 4.0 International License.
 .. SPDX-License-Identifier: CC-BY-4.0
 .. (c) <optionally add copywriters name>

 These lines will not be rendered in the html and pdf files.

How and where to store the document content files in your repository
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
All documentation for your project should be structured and stored in the :code:`<repo>/docs/` directory. The documentation toolchain will
look in these directories and be triggered on events in these directories when generating documents.

Document structure and contribution
-----------------------------------
A general structure is proposed for storing and handling documents that are common across many projects but also for documents that may be
project specific. The documentation is divided into three areas Release, Testing and Infrastructure. Templates for these areas can be found
under :code:`opnfvdocs/docs/templates/`.

Project teams are encouraged to use templates provided by the opnfvdocs project to ensure that there is consistency across the community.
Following representation shows the expected structure:

::

        docs/   
        ├── release
        │   ├── installation
        │   ├── user and configuration guide
        │   └── release notes
        ├── testing
        │   ├── user guide
        │   ├── developer guide
        ├── infrastructure
        │   ├── infrastructure overview
        │   ├── continuous integration (CI)
        │   ├── cross community continuous integration (XCI)
	   

Release documentation
^^^^^^^^^^^^^^^^^^^^^
Release documentation is the set of documents that are published for each OPNFV release. These documents are created and developed
following the OPNFV release process and milestones and should reflect the content of the OPNFV release.

**Installation Instruction**: :code:`<repo>/docs/release/installation`

- This document is shall describe how to get started and install OPNFV'

**User Guide**: :code:`<repo>/docs/release/userguide`

- This document shall describe the usage of a OPNFV component'

**Configuration Guide**: :code:`<repo>/docs/release/configguide`

- Brief introduction to configure a OPNFV component'

**Release Notes**: :code:`<repo>/docs/release/release-notes`

- Applicable for all projects participating in a release'

Testing documentation
^^^^^^^^^^^^^^^^^^^^^
Documentation created by test projects can be stored under two different sub directories /user or /developemnt.
Release notes will be stored under <repo>/docs/release/release-notes

**User documentation**: :code:`<repo>/testing/user/`
Will collect the documentation of the test projects allowing the end user to perform testing towards a OPNFV SUT
e.g. Functest/Yardstick/Vsperf/Storperf/Bottlenecks/Qtip installation/config & user guides.

**Development documentation**: :code:`<repo>/testing/developent/`
Will collect documentation to explain how to create your own test case and leverage existing testing frameworks e.g. developer guides.

Infrastructure Documentation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Infrastructure documentation can be stored under :code:`<repo>/docs/` folder of
corresponding infrastructure project.
