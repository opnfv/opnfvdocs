.. This work is licensed under a Creative Commons Attribution 4.0 International
.. License. .. http://creativecommons.org/licenses/by/4.0 ..
.. (c) Christopher Price (Ericsson AB) and others

Configure the network environment
---------------------------------

#. Open the environment you previously created.

#. Open the networks tab and select the "default Node Networks group to" on the left pane.

#. Update the Public network configuration and change the following fields to appropriate values:

   - CIDR to <CIDR for Public IP Addresses>

   - IP Range Start to <Public IP Address start>

   - IP Range End to <Public IP Address end>

   - Gateway to <Gateway for Public IP Addresses>

   - Check <VLAN tagging>.

   - Set appropriate VLAN id.

#. Update the Storage Network Configuration

   - Set CIDR to appropriate value  (default 192.168.1.0/24)

   - Set IP Range Start to appropriate value (default 192.168.1.1)

   - Set IP Range End to appropriate value (default 192.168.1.254)

   - Set vlan to appropriate value  (default 102)

#. Update the Management network configuration.

   - Set CIDR to appropriate value (default 192.168.0.0/24)

   - Set IP Range Start to appropriate value (default 192.168.0.1)

   - Set IP Range End to appropriate value (default 192.168.0.254)

   - Check <VLAN tagging>.

   - Set appropriate VLAN id. (default 101)

#. Update the Private Network Information

   - Set CIDR to appropriate value (default 192.168.2.0/24

   - Set IP Range Start to appropriate value (default 192.168.2.1)

   - Set IP Range End to appropriate value (default 192.168.2.254)

   - Check <VLAN tagging>.

   - Set appropriate VLAN tag (default 103)

#. Select the "Neutron L3 Node Networks group" on the left pane.

#. Update the Floating Network configuration.

   - Set the Floating IP range start (default 172.16.0.130)

   - Set the Floating IP range end (default 172.16.0.254)

   - Set the Floating network name (default admin_floating_net)

#. Update the Internal Network configuration.

   - Set Internal network CIDR to an appropriate value (default 192.168.111.0/24)

   - Set Internal network gateway to an appropriate value

   - Set the Internal network name (default admin_internal_net)

#. Update the Guest OS DNS servers.

   - Set Guest OS DNS Server values appropriately

#. Save Settings.

#. Select the "Other Node Networks group" on the left pane.

#. Update the Public network assignment.

   - Check the box for "Assign public network to all nodes" (Required by OpenDaylight)

#. Update Host OS DNS Servers.

   - Provide the DNS server settings

#. Update Host OS NTP Servers.

   - Provide the NTP server settings

Select Hypervisor type
----------------------

#. In the FUEL UI of your Environment, click the "Settings" Tab

#. Select Compute on the left side pane

   - Check the KVM box and press "Save settings"

Enable Plugins
--------------

#. In the FUEL UI of your Environment, click the "Settings" Tab

#. Select Other on the left side pane

   - Enable and configure the plugins of your choice

Allocate nodes to environment and assign functional roles
---------------------------------------------------------

#. Click on the "Nodes" Tab in the FUEL WEB UI.

#. Assign roles.

    - Click on the <+Add Nodes> button

    - Check <Controller>, <Telemetry - MongoDB>  and optionally an SDN Controller role (OpenDaylight controller/ONOS) in the Assign Roles Section.

    - Check one node which you want to act as a Controller from the bottom half of the screen

    - Click <Apply Changes>.

    - Click on the <+Add Nodes> button

    - Check the <Controller> and <Storage - Ceph OSD> roles.

    - Check the two next nodes you want to act as Controllers from the bottom half of the screen

    - Click <Apply Changes>

    - Click on <+Add Nodes> button

    - Check the <Compute> and <Storage - Ceph OSD> roles.

    - Check the Nodes you want to act as Computes from the bottom half of the screen

    - Click <Apply Changes>.

#. Configure interfaces.

    - Check Select <All> to select all allocated nodes

    - Click <Configure Interfaces>

    - Assign interfaces (bonded) for mgmt-, admin-, private-, public-
      and storage networks

    - Click <Apply>
