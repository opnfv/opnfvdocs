------------------------
Introduction
------------------------

The OPNFV project provides different kinds of output to its users:

1. **Target Software Platform**

   This provides the software which will run as NFVI and VIM in an actual NFV deployment
   It is an integrated solution of several other open source projects, e.g. OpenStack,
   Linux, ODL.

2. **Deployment Tools**

   So called installers help the user deploy target software on his hardware.
   OPNFV provides multiple options to do this.

3. **Test Cases and Framework**

   The target software platform can be verified and evaluated using these testcases.
   Their goal is to show that the deployed platform is usable to run VNFs.

4. **Documentation**

   OPNFV provides the necessary documents describing target software platform, deployment
   tools, tests, etc. in their architecture and usage.

5. **Requirements**

   OPNFV community works on requirements of open source projects used in OPNFV to
   make these projects better suitable for NFV telco carrier use cases.
   These requirements are described in requirement documents and also forwarded
   to the "upstream" projects in the format required by these projects.

6. **Community Labs**

   OPNFV creates lab environments not only for development of OPNFV, but also to help
   build the NFV ecosystem. OPNFV labs follow a defined structure and configuration.
   Some of the labs have their dedicated tasks in the development environment, some of
   the labs will be provided for open use.

**OPNFV Releases**

OPNFV bundles the target software, installers, documentation, test cases and lab
description to releases and provides documentation describing the scope and features
provided.

Since OPNFV releases contain different options (e.g. for installers, SDN controllers, etc.)
We define a set of scenarios, that is a set of components, combinations 
and associated configuration.
This set of scenarios shows which combinations of components and features are tested as
part of the OPNFV release.

This overview document introduces these components and scenarios on a high level and 
points you to more
detailed documentation.
It describes the OPNFV Brahmaputra release.

OPNFV Requirement documents typically describe requirements that will be implemented in
later releases of OPNFV. Thus they are not part of a release package.

Also community labs are independent of releases. Only the lab description is included in
the release and describes the requirements of a lab to successfully run Brahmaputra
deployments.


------------------------
Target software platform
------------------------

Software architecture
=====================

This section will provide information which upstream projects, versions and components are
integrated in the Brahmaputra release

OpenStack
---------

.. include:: openstack.rst


Operating System
----------------

.. include:: linux.rst


SDN Controllers
---------------

OPNFV Brahmaputra release supports three different SDN controllers:

* OpenDaylight
* ONOS
* OpenContrail

Depending on the SDN controller you are using, the featureset will vary.

OpenDaylight
++++++++++++

.. include:: odl.rst

ONOS
++++

.. include:: onos.rst

OpenContrail
++++++++++++

.. include:: opencontrail.rst

Data Plane
----------

Other Components
----------------

Deployment Architecture
=======================

.. include:: deploy-arch.rst



Dynamic View
============

Editors note: we might skip this section completely for Brahmaputra.

Or we provide rather short statements. In later versions, we have to describe which
software is involved in which way during:

* VNF Life Cycle (onboarding, instantiate, scaling): we can reference to other documents
* Hardware Life Cycle (mainly how to add compute nodes, but also other cases)
* ...

----------------
Deployment Tools
----------------

Brahmaputra provides 4 different installers:

* Apex
* Compass
* Fuel
* Joid

Editors note:
A table to summarize main characteristics would be nice

Please find the information about combining installers, SDN controllers and other optional components
by visiting the scenario list.

Apex
====

.. include:: apex.rst

Compass
=======

.. include:: compass.rst

Fuel
====

.. include:: fuel.rst

Joid
====

.. include:: joid.rst


-----------------------
Testcases and Framework
-----------------------

.. include:: testframework.rst




