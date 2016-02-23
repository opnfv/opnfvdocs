.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) OPNFV, Huawei

========================
Target software platform
========================

.. ==> Add reference links from https://wiki.opnfv.org/releases/brahmaputra/releasedocs

.. ==> All links should point to release docs, not to OPNFV-Wiki or artifacts.


Software architecture
=====================

This section will provide information which upstream projects, versions and components are
integrated in the release to implement OPNFV requirement. You can find a requirement view
at `Requirements and User Experience <http://artifacts.opnfv.org/genesisreq/review/10345/requirements/userexperience.html>`_

OpenStack
---------

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

Some of the sub-projects are not deployed in all scenarios.

.. end of the part to be replaced by link if possible.

Note that additional components of OpenStack are used for deployment and test framework
(Fuel, Tempest, Rally).

For more information about OpenStack refer to the OpenStack documents at
`OpenStack Wiki <https://wiki.openstack.org/wiki/Main_Page>`_ and
`OpenStack Documentation <https://wiki.onosproject.org/display/ONOS/User's+Guide>`_

More information about how OpenStack is used you find in the user guides and config guides.

Operating System
----------------

OPNFV uses Linux on all target machines. Depending on the installers, different
distributions are supported.

Ubuntu 14 supported by Fuel, Compass and Joid installers
CentOS 7 supported by Apex and Compass


SDN Controllers
---------------

OPNFV Brahmaputra release supports three different SDN controllers.

Depending on the SDN controller you are using, the featureset will vary.
Brahmaputra also provides scenarios without an SDN controller, just using OpenStack Neutron.

**OpenDaylight** SDN controller is used in several scenarios as the main networking component.
OpenDaylight runs within a JVM and is installed in OPNFV within a container and integrated with OpenStack
using the ODL device driver. The Brahmaputra release of OPNFV integrates the latest Beryllium release.
More information can be found at
`Getting Started Guide <http://go.linuxfoundation.org/l/6342/2015-06-28/2l76qt/6342/128122/bk_getting_started_guide_20150629.pdf>`_ or in the OPNFV user guide.

**ONOS** is an SDN controller written in Java with a distributed architecture with special focus to
support scalability, fault tolerance and hardware and software upgrades without
interrupting network traffic.
More information on the internal design of ONOS may be found in
`User's Guide <https://wiki.onosproject.org/display/ONOS/User's+Guide>`_ and
`Architecture+Guide <https://wiki.onosproject.org/display/ONOS/Architecture+Guide>`_ on the
`wiki of the ONOS project <https://wiki.onosproject.org>`_.
ONOS is integrated to OPNFV using a framework ONOSFW and Neutron plugins. Details can be found in the
ONOS specific OPNFV documents:

.. ==> Link to be added.

**OpenContrail** SDN controller will be supported in the next drop of the Brahmaputra release.

Some scenarios don't use an SDN controller but rely just on **Neutron** networking capabilities.

Data Plane
----------

OPNFV extends Linux' virtual networking capabilies by using virtual switch
and router components including improving those components by requirements
specific to telco use cases.

For instance **OpenVSwich** can be used
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

.. Editors note:
.. In a second level of detail, describe how software is distributed over the 3 controller
.. nodes, compute nodes and other hardware.


In Brahmaputra, different scenarios can be deployed to provide the different feature sets, e.g.
HA, IPV6, BGPVPN, KVM, or select the different implementations, e.g. SDN controllers.

The following scenarios are supported, some of them can be deployed using different installers.

* nosdn-nofeature
* odl_l2-ha
* odl_l3-ha
* odl_l2-bgpvpn-noha
* onos-ha
* nosdn-ovs-ha
* nosdn-kvm-ha
* nosdn-ovs_kvm-ha

Please find more information at
`<https://wiki.opnfv.org/functextnexttaks>`_

.. ==> As soon as better information is available, the list can be replaced by a link to e.g.
.. http://artifacts.opnfv.org/opnfvdocs/brahmaputra/docs/configguide/configoptions.html#opnfv-scenario-s.


.. Dynamic View
.. ============

.. Editors note: we might skip this section completely for Brahmaputra.

.. Or we provide rather short statements. In later versions, we have to describe which
.. software is involved in which way during:

.. * VNF Life Cycle (onboarding, instantiate, scaling): we can reference to other documents
.. * Hardware Life Cycle (mainly how to add compute nodes, but also other cases)
.. * ...





