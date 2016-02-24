.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) OPNFV, Huawei

===========================
OPNFV Platform Architecture
===========================

.. ==> Add reference links from https://wiki.opnfv.org/releases/brahmaputra/releasedocs

.. ==> All links should point to release docs, not to OPNFV-Wiki or artifacts.


OPNFV Lab Infrastructure
========================

The `Pharos Project <https://www.opnfv.org/developers/pharos>`_ provides a lab infrastructure
that is geographically and technically diverse.
Labs instantiate **bare-metal** and **virtual** environments that are accessed remotely by the
community and used for OPNFV platform and feature development, build, deploy and testing.
This helps in developing a highly robust and stable OPNFV platform
with well understood performance characteristics.

Community labs are hosted by OPNFV member companies on a voluntary basis.
The Linux Foundation also hosts an OPNFV lab that provides centralised CI
and other production resources which are linked to community labs.
Future lab capabilities will include the ability easily automate deploy and test of any
OPNFV install scenario in any lab environemnt as well as on a virtual infrastructure.

.. ==> I am not sure this is the best place to include this.


Software architecture
=====================

This section will provide information which upstream projects, versions and components are
integrated in the release to implement OPNFV requirement. You can find the list of common
requirements for deployment tools here:
http://artifacts.opnfv.org/genesisreq/brahmaputra/requirements/requirements.pdf.

OpenStack
---------

.. ==> didn't understand Chris' suggestion about reducing the heading level for these sub-topics

OPNFV uses OpenStack as cloud management system.
Brahmaputra is based on OpenStack Liberty Release.
The set of sub-projects varies slightly depending on the installer.

.. ==> If possible replace the list of OpenStack components here by a link to an
.. appropriate document
.. (http://artifacts.opnfv.org/genesisreq/review/10155/requirements/component-support.html
.. was suggested, but this is different infomation.)

The following table shows which components are deployed.

+------------+----------------+-----------+-----------+-----------+-----------+
| services   | type           | Apex      | Compass   | Fuel      | Joid      |
+============+================+===========+===========+===========+===========+
| ceilometer | metering       | Available | Available | Available | Available |
+------------+----------------+-----------+-----------+-----------+-----------+
| cinder     | volume         | Available | Available | Available | Available |
+------------+----------------+-----------+-----------+-----------+-----------+
| cloud      | cloudformation | ---       | Available | Available | Available |
+------------+----------------+-----------+-----------+-----------+-----------+
| glance     | image          | Available | Available | Available | Available |
+------------+----------------+-----------+-----------+-----------+-----------+
| heat       | orchestration  | Available | Available | Available | Available |
+------------+----------------+-----------+-----------+-----------+-----------+
| keystone   | identity       | Available | Available | Available | Available |
+------------+----------------+-----------+-----------+-----------+-----------+
| neutron    | network        | Available | Available | Available | Available |
+------------+----------------+-----------+-----------+-----------+-----------+
| nova       | compute        | Available | Available | Available | Available |
+------------+----------------+-----------+-----------+-----------+-----------+
| swift      | object-store   | Available | ---       | Available | Available |
+------------+----------------+-----------+-----------+-----------+-----------+

.. This table is created by outputs from jenkins functest log, components registering at keystone
.. would prefer a table per scenario.

Some of the sub-projects are not deployed in all scenarios.

.. end of the part to be replaced by link if possible.

Note that additional components of OpenStack are used as part of deployment tools and test frameworks
(Fuel, Tempest, Rally).

For more information about the OpenStack features and usage refer to the
`official OpenStack documentation page <http://docs.openstack.org/>`_.
Please ensure that you have the Liberty release selected at the
``More Releases & Languages`` drop down menu.

Operating System
----------------

OPNFV uses Linux on all target machines. Depending on the installers, different
distributions are supported.

Ubuntu 14 supported by Fuel, Compass and Joid installers
CentOS 7 supported by Apex and Compass


SDN Controllers
---------------

OPNFV Brahmaputra release supports different SDN controllers.
Some scenarios don't use an SDN controller but rely just on **Neutron** networking capabilities.

Depending on the SDN controller you are using, the featureset available will vary.  More
information on feature support and scenarios can be found in the Brahmaputra configuration and
user guides.  Brahmaputra also provides scenarios without an SDN controller, just using OpenStack Neutron.

**OpenDaylight** is an SDN controller aiming to accelerate
adoption of Software-Defined Networking (SDN) and Network Functions Virtualization
(NFV) with a transparent approach that fosters new innovation.
OpenDaylight runs within a JVM and is installed in OPNFV within a container and integrated with OpenStack
using the ODL device driver. The Brahmaputra release of OPNFV integrates the Beryllium release.
You can find more information about OpenDaylight among the release artifacts at the
`Downloads page <https://www.opendaylight.org/downloads>`_.
Please ensure you are using the Beryllium documentation.

**ONOS** is an SDN controller written in Java with a distributed architecture with special focus to
support scalability, fault tolerance and hardware and software upgrades without
interrupting network traffic.
More information on the internal design of ONOS may be found in
`User's Guide <https://wiki.onosproject.org/display/ONOS/User's+Guide>`_ and
`Architecture+Guide <https://wiki.onosproject.org/display/ONOS/Architecture+Guide>`_ on the
`wiki of the ONOS project <https://wiki.onosproject.org>`_.
ONOS is integrated to OPNFV using a framework ONOSFW and Neutron plugins. Details can be found in the
ONOS specific OPNFV documents,

`Design guide <http://artifacts.opnfv.org/onosfw/brahmaputra/design/design.pdf>`_,
`User guide <http://artifacts.opnfv.org/onosfw/brahmaputra/userguide/index.html>`_ and
`Config guide <http://artifacts.opnfv.org/onosfw/brahmaputra/configguide/index.html>`_.

.. **OpenContrail** SDN controller will be supported in the next drop of the Brahmaputra release.


Data Plane
----------

OPNFV extends Linux's virtual networking capabilies by using virtual switch
and router components including improving those components by requirements
specific to telco use cases.

For instance some scenarios use OpenVSwitch
to replace Linux bridges as it offers advantages in terms of mobility, hardware
integration and use by network controllers. OPNFV leverages these by upgrade
to a specific installation using user-space datapath. This includes changes to
other dataplane components, including libvirt, qemu, DPDK etc.
Please find more information in
`OVSNFV User's Guide <http://artifacts.opnfv.org/ovsnfv/docs/userguides/userguides.pdf>`_

.. ==> need input, if we mention other components

Other Components
----------------

**KVM**

NFV infrastructure has special requirements on hypervisors with respect of
interrupt latency (timing correctness and packet latency in data plane) and
live migration.

Besides additional software changes, this requires
some adjustments to system configuration
information, like hardware, BIOS, OS, etc.

.. KVM4NFV is one implementation, we have three implementations of the OS virtualization layer
.. to capture here.
.. ==> need more input

Please find more information at
`KVM4NFV project documentation <http://artifacts.opnfv.org/kvmfornfv/docs/all/all.pdf>`_

.. As it is a platform overview I think if we mention KVM as hypervisor we should focus on which version we are using and how as opposed to the OPNFV project that deals with KVM itself.



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
and other components on the controller nodes and compute nodes. See the
`OPNFV user guide <http://artifacts.opnfv.org/opnfvdocs/brahmaputra/docs/userguide/userguide.pdf>`_
for more details.

.. Editors note:
.. In a second level of detail, describe how software is distributed over the 3 controller
.. nodes, compute nodes and other hardware.


In Brahmaputra, different scenarios can be deployed to provide the different feature sets, e.g.
HA, IPV6, BGPVPN, KVM, or select the different implementations, e.g. SDN controllers.

.. ==> Is it described somewhere what we mean by scenarios? If yes, then the original text is better.
.. If not, I would give a brief overview here to describe the term.

The following scenarios are supported, some of them can be deployed using different installers.

* nosdn-nofeature
* odl_l2-ha
* odl_l3-ha
* odl_l2-bgpvpn-noha
* onos-ha
* nosdn-ovs-ha
* nosdn-kvm-ha
* nosdn-ovs_kvm-ha

Please find more information at:
http://artifacts.opnfv.org/opnfvdocs/brahmaputra/configguide/configoptions.html#opnfv-scenario-s.

