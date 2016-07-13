.. This work is licensed under a Creative Commons Attribution 4.0 International
.. License. .. http://creativecommons.org/licenses/by/4.0 ..
.. (c) Christopher Price (Ericsson AB) and others

<template> software installation and deployment
===============================================

This section describes the installation of the OPNFV installation
server (jumphost) as well as the deployment of the <template> OPNFV
reference platform stack across a server cluster.

Install jumphost
----------------

If you have not already done so, prepare your jumphost according the instructions in _#ref_Preparation
this can be done using an ISO image with the following commands

#. Mount the <template> ISO file/media as a boot device to the jump host server.

#. Reboot the jump host to establish the jumphost server.

   - The system now boots from the ISO image.

   - Select "Fuel Install (Static IP)"

   - Press [Enter].

#. Wait until screen Fuel setup is shown (Note: This can take up to 30 minutes).

At this time you can continue with the installation according to the following instructions.

#. In the "Fuel User" section - Confirm/change the default password

   - Enter "admin" in the Fuel password input

   - Enter "admin" in the Confirm password input

   - Select "Check" and press [Enter]

#. In the "Network Setup" section - Configure DHCP/Static IP information for your FUEL node - For example, ETH0 is 10.20.0.2/24 for FUEL booting and ETH1 is DHCP in your corporate/lab network.

   - Configure eth1 or other network interfaces here as well (if you have them present on your FUEL server).

#. In the "PXE Setup" section - Change the following fields to appropriate values (example below):

   - DHCP Pool Start 10.20.0.3

   - DHCP Pool End 10.20.0.254

   - DHCP Pool Gateway  10.20.0.2 (IP address of Fuel node)

#. In the "DNS & Hostname" section - Change the following fields to appropriate values:

   - Hostname

   - Domain

   - Search Domain

   - External DNS

   - Hostname to test DNS

   - Select <Check> and press [Enter]


#. OPTION TO ENABLE PROXY SUPPORT - In the "Bootstrap Image" section, edit the following fields to define a proxy. (**NOTE:** cannot be used in tandem with local repository support)

   - Navigate to "HTTP proxy" and enter your http proxy address

   - Select <Check> and press [Enter]

#. In the "Time Sync" section - Change the following fields to appropriate values:

   - NTP Server 1 <Customer NTP server 1>

   - NTP Server 2 <Customer NTP server 2>

   - NTP Server 3 <Customer NTP server 3>

#. Start the installation.

   - Select Quit Setup and press Save and Quit.

   - Installation starts, wait until the login screen is shown.


Boot the Node Servers
---------------------

After the Fuel Master node has rebooted from the above steps and is at
the login prompt, you should boot the Node Servers (Your
Compute/Control/Storage blades (nested or real) with a PXE booting
scheme so that the FUEL Master can pick them up for control.

#. Enable PXE booting

   - For every controller and compute server: enable PXE Booting as the first boot device in the BIOS boot order menu and hard disk as the second boot device in the same menu.

#. Reboot all the control and compute blades.

#. Wait for the availability of nodes showing up in the Fuel GUI.

   - Connect to the FUEL UI via the URL provided in the Console (default: https://10.20.0.2:8443)

   - Wait until all nodes are displayed in top right corner of the Fuel GUI: Total nodes and Unallocated nodes.


Install additional Plugins/Features on the FUEL node
----------------------------------------------------

#. SSH to your FUEL node (e.g. root@10.20.0.2  pwd: r00tme)

#. Select wanted plugins/features from the /opt/opnfv/ directory.

#. Install the wanted plugin with the command "fuel plugins --install /opt/opnfv/<plugin-name>-<version>.<arch>.rpm"
   Expected output: "Plugin ....... was successfully installed."

Create an OpenStack Environment
-------------------------------

#. Connect to Fuel WEB UI with a browser (default: https://10.20.0.2:8443) (login admin/admin)

#. Create and name a new OpenStack environment, to be installed.

#. Select "<Liberty on Ubuntu 14.04>" and press <Next>

#. Select "compute virtulization method".

   - Select "QEMU-KVM as hypervisor" and press <Next>

#. Select "network mode".

   - Select "Neutron with ML2 plugin"

   - Select "Neutron with tunneling segmentation" (Required when using the ODL or ONOS plugins)

   - Press <Next>

#. Select "Storage Back-ends".

   - Select "Ceph for block storage" and press <Next>

#. Select "additional services" you wish to install.

   - Check option "Install Ceilometer (OpenStack Telemetry)" and press <Next>

#. Create the new environment.

   - Click <Create> Button

