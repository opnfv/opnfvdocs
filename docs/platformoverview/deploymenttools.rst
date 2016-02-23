.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) OPNFV, Huawei

================
Deployment Tools
================

Brahmaputra provides 4 different installers.

The installers will deploy the target platform onto a set of virtual or bare metal servers according
to the configuration files. After the deployment, it doesn't matter which of the installers had been used
to deploy the target scenario.

**Apex** is an OPNFV Installation tool based on RDO Manager that deploys OPNFV using the RDO Project
OpenStack Distribution.
RDO manager is a Triple-O based installation tool.
Triple-O is an image based life cycle deployment tool that is a member of the OpenStack Big Tent Governance.
Apex uses Centos on all target platforms and can deploy all SDN controllers.
Find more information at
`OpenStack Wiki for Triple-O <https://wiki.openstack.org/wiki/Tripleo>`_ and the OPNFV user guide and
config guide.

**Compass** is an installer project based on open source project Compass, which provides automated deployment
and management of OpenStack and other distributed systems.
It can be considered as what the LiveCD to a single box for a pool of servers – bootstrapping the server pool.
Compass is based on Ansible.
It can deploy Ubuntu or Centos as target operating system and ODL and ONOS as SDN controllers.
Find more information at
`OpenStack Wiki for Compass <https://wiki.openstack.org/wiki/Complass>`_ and the OPNFV user guide and
config guide.

**Fuel** is an installer tool developed as an OpenStack community effort that focuses on
automating the deployment and testing of OpenStack and a range of third-party options.
Find more information at
`OpenStack Wiki for Fuel <https://wiki.openstack.org/wiki/Fuel>`_ and the OPNFV user guide and
config guide.

**Joid**

.. ==> Need to be added
.. Just a high level intro and link to the main joid documents.


