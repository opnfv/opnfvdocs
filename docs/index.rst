.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. SPDX-License-Identifier: CC-BY-4.0

Anuket Documentation
====================

Mission and intro
-----------------

The mission of the Anuket project is to empower the global communications community by creating and developing reference
cloud infrastructure models, architectures, tools, and programs to deliver network services faster, more reliably, and
securely.

Anuket approaches its mission by providing a set of cloud infrastructure reference
specifications, reference implementations, conformance tests, testing tools, testing frameworks and implementation
projects.

.. image:: /images/Anuket-structure.png
   :alt: Project structure of Anuket


Participation is open to anyone, whether you are an employee of a member company or just passionate about network
transformation.

Documentation for Anuket users
------------------------------

These documents are targeted to the users of the different Anuket sub-projects and here they are organized by
sub-project categories.

Anuket specifications
~~~~~~~~~~~~~~~~~~~~~

:doc:`Anuket Specifications <cntt:index>` provide reference specifications for cloud infrastructures and their
workloads. The specifications are organized to the following documents:

* Reference Model (RM) - a technology independent specification of cloud infrastructures for telecom workloads
* Reference Architecture (RA1) for OpenStack based cloud infrastructure - a specification of an OpenStack cloud
  infrastructure based on the requirements of the Reference Model 
* Reference Conformance (RC1) for RA1 based Implementations - an automatic conformance testing framework to test RA1
  conformance of OpenStack cloud infrastrucutres and their workloads
* Reference Implementation based on RA1 specifications (RI1) - a blueprint to build an OpenStack cloud based on the
  requirements of the RA1 specifications
* Reference Architecture (RA2) for Kubernetes based cloud infrastructure - a specification of a Kubernetes container
  orchestration platform based on the requirements of the Reference Model
* Reference Conformance (RC2) for RA2 based Implementations - an automatic conformance testing framework to test RA2
  conformance of OpenStack cloud infrastrucutres and their workloads
* Reference Implementation based on RA2 specifications (RI2) - a blueprint to build a Kubernetes container orchestration
  platform based on the RA2 specificcations.

.. toctree::
   :maxdepth: 1
   :hidden:

   release/installation.introduction
   release/userguide.introduction
   release/release-notes

Implementation projects
~~~~~~~~~~~~~~~~~~~~~~~

Implementation projects address specific needs in the cloud technology relevant for the community and provide a
reuseable implementation. The implementation projects have their release notes, installation and user guides in the
aggregated documentation set referred here:

- :doc:`Installation Introduction<release/installation.introduction>`
- :doc:`User Guide and Configuration Guide<release/userguide.introduction>`
- :doc:`Release Notes<release/release-notes>`

Testing projects and frameworks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Testing projects, like ViNePERF provide testing tools to assess certain characteristics of cloud infrastructures while
the Functest testing framework provides an automatic test suite to test the cloud infrastructures. The testing projects
and frameworks have their release notes, installation and user guides in the aggregated documentation set referred here:

- :doc:`Installation Introduction<release/installation.introduction>`
- :doc:`User Guide and Configuration Guide<release/userguide.introduction>`
- :doc:`Release Notes<release/release-notes>`

Integration projects
~~~~~~~~~~~~~~~~~~~~

The integration projects integrate OpenStack and Kubernetes based cloud infrastructures based on the blueprints of RI1
and RI2. The integration projects have their release notes, installation and user guides in the aggregated documentation
set referred here:

- :doc:`Installation Introduction<release/installation.introduction>`
- :doc:`User Guide and Configuration Guide<release/userguide.introduction>`
- :doc:`Release Notes<release/release-notes>`

Documentation for Anuket contributors
-------------------------------------

Contribution guide for the documentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. toctree::
   :maxdepth: 1

   how-to-use-docs/index

Software and hardware infrastructure guide
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. toctree::
   :maxdepth: 1

   infrastructure/overview
   infrastructure/ci

Glossary
--------

.. toctree::
   :maxdepth: 1

   glossary/index

Found a typo or any other feedback? Send us an email_ or
talk to us on Slack_.

.. _email: mailto:users@opnfv.org
.. _Slack: https://anuketworkspace.slack.com/
