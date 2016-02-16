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


Apex
====

Apex is an OPNFV Installation tool based on RDO Manager that deploys OPNFV using the RDO Project
OpenStack Distribution.
RDO manager is a Triple-O based installation tool.
Triple-O is an image based life cycle deployment tool that is a member of the OpenStack Big Tent Governance.

Apex uses Centos on all target platforms and can deploy all SDN controllers.


Compass
=======

Compass is an installer project based on open source project Compass, which provides automated deployment
and management of OpenStack and other distributed systems.
It can be considered as what the LiveCD to a single box for a pool of servers – bootstrapping the server pool.

Compass is based on Ansible.
It can deploy Ubuntu or Centos as target operating system and ODL and ONOS as SDN controllers.


Fuel
====

Fuel is an installer project based on the Fuel OpenStack open source project providing automated deployment and management of OpenStack and other distributed systems. 
It is based on puppet and deploys the Ubuntu Linux operating system; the OpenStack virtual Infra-structure manager, and OpenDaylight or ONOS SDN controllers.


Joid
====

Editors note:
Just a high level intro and link to the main joid documents.
