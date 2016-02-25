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
`OpenStack Wiki for Triple-O <https://wiki.openstack.org/wiki/TripleO>`_ and `OPNFV Config Guide`_.

**Compass** is an installer project based on open source project Compass, which provides automated deployment
and management of OpenStack and other distributed systems.
It can be considered as what the LiveCD to a single box for a pool of servers – bootstrapping the server pool.
Compass is based on Ansible.
It can deploy Ubuntu or Centos as target operating system and ODL and ONOS as SDN controllers.
Find more information at
`OpenStack Wiki for Compass <https://wiki.openstack.org/wiki/Compass>`_ and `OPNFV Config Guide`_.

**Fuel** is an installer project based on the Fuel OpenStack open source project
providing automated deployment and management of OpenStack and other distributed systems.
Fuel is based on puppet and deploys the Ubuntu Linux operating system;
the OpenStack virtual Infra-structure manager, and OpenDaylight or ONOS SDN controllers.
Find more information at
`OpenStack Wiki for Fuel <https://wiki.openstack.org/wiki/Fuel>`_ and `OPNFV Config Guide`_.

**Joid** is an installer utilizes the technology developed in Juju and MAAS.
Juju allows you to deploy, configure, manage, maintain, and scale
cloud services quickly and efficiently on public clouds, as well as on physical servers,
OpenStack, and containers. Together with MAAS hardware usage can be optimized.
For more info on Juju and MAAS, please visit `<https://jujucharms.com/>`_,
`<http://maas.ubuntu.com>`_ and the
`Joid Userguide <http://artifacts.opnfv.org/joid/brahmaputra/docs/userguide/index.html>`_.

.. _`OPNFV Config Guide`: http://artifacts.opnfv.org/opnfvdocs/brahmaputra/docs/configguide
