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

* Nova (Compute)
* Neutron (Network)
* Cinder (Block Storage)
* Swift (Object Storage)
* Ceilometer (Telemetry)
* Keystone (Identity)
* Glance (Image Service)
* Heat (Orchestration)
* etc.

Some of the sub-projects are not deployed in all scenarios.
Besides target software, also deployment and test framework use OpenStack components
(Fuel, Tempest, Rally)


Operating System
----------------

OPNFV uses Linux on all target machines. Depending on the installers, different
distributions are supported.

Ubuntu 14 supported by Fuel, Compass and Joid installers
CentOS 7 supported by Apex and Compass


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

Data Plane
----------

Other Components
----------------

Deployment Architecture
=======================

OPNFV starts with a typical configuration with 3 controller nodes running
OpenStack, SDN, etc. and a minimum of 2 compute nodes for deployment of VNFs.
A detailed description of this 5 node configuration can be found in pharos documentation.

The 3 controller nodes allow to provide an HA configuration. The number of compute
nodes can be increased dynamically after the initial deployment.

OPNFV can be deployed on bare metal or in a virtual environment, where each of the hosts
is a virtual machine and provides the virtual resources using nested virtualization.

The initial deployment is done using a so-called "jumphost". This server (either bare metal
or virtual) is first installed with the installer program that then installs OpenStack
and other components on the controller nodes and compute nodes. See the installer
documentation for more details.

Editors note:
In a second level of detail, describe how software is distributed over the 3 controller
nodes, compute nodes and other hardware.

In Brahmaputra, the following scenarios are supported:




Dynamic View
============

Editors note: we might skip this section completely for Brahmaputra.

Or we provide rather short statements. In later versions, we have to describe which
software is involved in which way during:

* VNF Life Cycle (onboarding, instantiate, scaling): we can reference to other documents
* Hardware Life Cycle (mainly how to add compute nodes, but also other cases)
* ...





