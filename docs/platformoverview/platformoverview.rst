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

This overview document introduces these components on a high level and points you to more
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

OPNFV uses OpenStack as cloud management system.
Brahmaputra is based on OpenStack Liberty Release. It comprises the following sub-projects
and modules:

* Nova
* Neutron
* Cinder
* Ceilometer
* etc.

Operating System
----------------

OPNFV uses Linux on all target machines. Depending on the installers, different
distributions are supported.

Editors note:
Add a table showing which installer supports which operating system for controller nodes and for compute nodes.


SDN Controllers
---------------

OPNFV Brahmaputra release supports three different SDN controllers:

* OpenDaylight
* ONOS
* OpenContrail

Depending on the SDN controller you are using, the featureset will vary.

OpenDaylight
++++++++++++

Editor's note:
We need a high level paragraph here and a description of how we use ODL.

ONOS
++++

Editors note:
We need a high level paragraph here and a description of how we use ONOS, especially the
relation of ONOS and ONOSFW project's integration and features.

OpenContrail
++++++++++++

Editors note:
We need a high level paragraph here and a description of how we use OpenContrail, including
its vRouter capabilities.

Acceleration
------------

Other Components
----------------

Deployment Architecture
=======================

Editors note:
Short description that we use a typical configuration with 3 controller nodes running
OpenStack, SDN, etc. and a minimum of 2 compute nodes for deployment of the VNFs.
Also mention that we use a "jumphost" for the initial bring-up, and the deployment of the
test framework.

In a second level of detail, describe how software is distributed over the 3 controller
nodes, compute nodes and other hardware.

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

Brahmaputra provides 4 different installers

Editors note:
A table to summarize main characteristics would be nice

We also need to list restrictions or dependencies like which installer can install which SDN......

-----------------------
Testcases and Framework
-----------------------

Editors note:
Just a high level description about the different types of tests and the role of yardstick as central framework.




