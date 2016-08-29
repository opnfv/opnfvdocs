.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) Open Platform for NFV Project, Inc. and its contributors

===========================
OPNFV Platform Architecture
===========================

The OPNFV project addresses a number of aspects in the development of a consistent virtualization
platform including common hardware requirements, software architecture, management & orchestration
and applications.
To address these areas effectively the platform architecture as the OPNFV project approaches it
can be decomposd into the basic building blocks:

* Hardware: with the Infra working group, Pharos project and associated activites
* Software Platform: through the deployment and platform projects
* Management and Orchestration: through the MANO WG and associated projects
* Applications: which affect all other areas and drive requirements for OPNFV

OPNFV Lab Infrastructure
========================

The infrastructure working group oversees such topics as lab management, workflow,
definitions, metrics and tools for OPNFV infrastructure.

Fundamental to the WG is the `Pharos Project <https://www.opnfv.org/developers/pharos>`_
which provides a set of defined lab infrastructures over a geographically and technically
diverse federated global OPNFV lab.

Labs may instantiate bare-metal and virtual environments that are accessed remotely by the
community and used for OPNFV platform and feature development, build, deploy and testing.
No two labs are the same and the hetrogeniety of the Pharos environment provides the ideal
platform for establishing hardware and software abstractions providing well understood
performance characteristics.

Community labs are hosted by OPNFV member companies on a voluntary basis.
The Linux Foundation also hosts an OPNFV lab that provides centralised CI
and other production resources which are linked to community labs.
Future lab capabilities will include the ability easily automate deploy and test of any
OPNFV install scenario in any lab environemnt as well as on a nested "Lab as a service"
virtual infrastructure.

OPNFV Software Platform architecture
====================================

The OPNFV software platform is comprised exclusively of open source implementations of
platform component pieces.  OPNFV is able to draw from the rich ecosystem of NFV related
technologies available in open source then integrate, test, measure and improve these
components in conjunction with our source communitites.

The following sections provide information on key upstream projects, versions and components
used and integrated in the release.

---------
OpenStack
---------

One of our largest upsteram ecosystems OpenStack provides a reference cloud management system
and associated technologies.  While the OpenStack community sustains a broad set of projects
not all technologies are relevant in an NFV domain, the OPNFV community consumes a
sub-set of openstack projects where the usage and composition may vary depending on the
installer and scenario.

For details on the scenario's available in OPNFV and the specific composition of components
refer to the OPNFV installation instruction:
https://artifacts.opnfv.org/colorado/opnfvdocs/installationprocedure/index.rst

OpenStack installation tools
----------------------------

There are a variety of methods available today to ease and facilitate the deployment
of an OpenStack environment.  As OPNFV specifically set out to evaluate and develop NFV
features on a variety of hardware solutions software installation is an important
part of our activity.

In the current OPNFV release we support the installation of our OpenStack based OPNFV clouds using:

* Apex; is an OPNFV Installation tool based on RDO Manager.
* Compass; which provides automated deployment and management of OpenStack and other distributed systems.
* Fuel; providing automated deployment and management of OpenStack and other distributed systems.
* JOID; is an installer utilizes the technology developed in Juju and MAAS.

OpenStack control plane projects
--------------------------------

The installation of an OPNFV platform utilises a number of projects from the OpenStack
community to compose our target scenarios.  These projects include:

* nova provides the core of the compute control plane including workload placement
* heat provides workload orchestration capabilities
* keystone provides identity management
* glance is used for the image store
* ceilometer established a metering solutions
* aodh extends celiometer to provide alarming

----------------
Operating System
----------------

OPNFV uses Linux on all target machines, this can include Ubuntu, Ceph or SuSe linux. The
specific version of Linux used for any deplouyment will be documented in the installation guide.

-------
Storage
-------

OPNFV uses OpenStack storage and provides room for any open source storage component
to be added using the well defined API's published by the OpenStack community.  The list of currently
supported storage projects is:

* cinder for block storage
* swift provides an object store
* ceph as an alternative object store

---------------------------
Software defined networking
---------------------------

OPNFV, as an NFV focused project, has a significant investment on networking technologies
and provides a broad variety of integrated open source reference solutions.  The diversity
of controllers able to be used in OPNFV is supported by a simillarly diverse set of
forwarding technologies.

SDN controllers
---------------

There are many SDN controllers available today that can be used in a virtual environment
where the OPNFV community supports and contributes to a number of these.  The controllers
being worked on by the community during this release of OPNFV includes; Neutron, OpenDaylight,
ONOS and OpenContrail.

Each scenario may integrate and leverage these components to expose specific platform behaviours
desirable in carrier network deployments.  For details on the controller technology used and
capabilities exposed in each scenario, please refer to the installation instruction document:
https://artifacts.opnfv.org/colorado/opnfvdocs/installationprocedure/index.rst

* Neutron - is an OpenStack project to provide “network connectivity as a service” between
  interface devices (e.g., vNICs) managed by other OpenStack services (e.g., nova).
* OpenDaylight - addresses multivendor, traditional and greenfield networks, establishing the
  industry’s de facto SDN platform and providing the foundation for networks of the future.
* ONOS - is a carrier-grade SDN network operating system designed for high availability,
  performance, scale-out.

.. OpenContrail SDN controller is planned to be supported in the next release.

Data Plane
----------

OPNFV extends the Linux virtual networking capabilies by using virtual switch
and router components, the OPNFV community proactively engages with these source
communities to address performance, scale and resiliency needs apparent in carrier
network requirements and use cases.

Again the use of virtual switching technoloiges can be dependant on the scenario and
desired capabilities of the deployment.  OPNFV scenarios support kernel and user space
switching and leverage such reference implementation as provided by the ovs.org and fd.io
communities.

* FD.io - (Fast data - Input/Output) is a collection of several projects and libraries to
  amplify the transformation that began with Data Plane Development Kit (DPDK) to support
  flexible, programmable and composable services on a generic hardware platform.
* Open vSwitch - is a production quality, multilayer virtual switch designed to enable
  massive network automation through programmatic extension, while still supporting standard
  management interfaces and protocols.

Deployment Architecture
=======================

A typical OPNFV deployment starts with 3 controller nodes running in a high availability
configuration including control plane components from OpenStack, SDN, etc. and a minimum
of 2 compute nodes for deployment of workloads (VNFs).
A detailed description of the hardware requirements required to support the 5 node configuration
can be found in pharos specification: https://artifacts.opnfv.org/colorado/pharos/spcification/index.rst

In addition to the deployment on a highly available physical infrastructure OPNFV can be
deployed, for development and lab purposes, in a virtual environment.  In this case each of the hosts
is provided by a virtual machine and allows control and workload placement using nested virtualization.

The initial deployment is done using a staging server, in OPNFV referred to as the "jumphost".
This server, either physical or virtual, is first installed with the installation program
that then installs OpenStack and other components on the controller nodes and compute nodes.
See the `OPNFV User Guide`_ for more details.

.. _`OPNFV Configuration Guide`: http://artifacts.opnfv.org/opnfvdocs/brahmaputra/docs/configguide
.. _`OPNFV User Guide`: http://artifacts.opnfv.org/opnfvdocs/brahmaputra/docs/userguide
