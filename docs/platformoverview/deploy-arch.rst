
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


