.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) Intel Corporation

Introduction
============
This scenario installs the latest DPDK-enabled Open vSwitch component,
version - 2.5.90 based on DPDK 16.07.

Scenario components and composition
===================================
This scenario is currently able to be installed using the Fuel and Apex installers.
For details on how to install the ovsnfv scenarion using these installer tools
please refer to the installation guides at:
  * Fuel installation guie: <link>
  * Apex installation guide: <link>

Scenario usage overview
=======================
After installation use of the scenario requires no further action by the user.
Traffic on the private network will automatically be processed by the upgraded
DPDK datapath.

Limitations, Issues and Workarounds
===================================
The same limitations that apply to using Fuel DPDK-enabled interfaces also apply
when using this scenario. Including:

* Fuel9 OVS-DPDK support works only for VLAN segmentation.
* Only interfaces running the private network (and no other network) can be
  supported so each node needs a separate interface dedicated to the private network.
* The nodes with dpdk enabled interfaces will need to have hugepages
  configured and some cores reserved for dpdk.


References
==========

For more information on the OPNFV Colorado release, please visit
http://www.opnfv.org/colorado

