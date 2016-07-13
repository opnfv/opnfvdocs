.. This work is licensed under a Creative Commons Attribution 4.0 International
.. License. .. http://creativecommons.org/licenses/by/4.0 ..
.. (c) Christopher Price (Ericsson AB) and others

Preparation
===========
.. Not all of these options are relevant for all scenario's.  I advise following the
.. instructions applicable to the deploy tool used in the scenario.

Before starting the installation of the <template> scenario some preparation must
be done.  You may choose to install the <template> scenario using an ISO image, or
executing the installation from a prepared jumphost.

Preparing your jumphost to install by script
--------------------------------------------

To deploy the <template> scenario from a script you will need to prepare the jumphost
with a compatible operating system.  Prepare your jumphost running CentOS 7 with libvirt
running on it.  You may then install the RDO Release RPM:

``sudo yum install -y https://www.rdoproject.org/repos/rdo-release.rpm opnfv-apex-{version}.rpm``

The RDO Project release repository is needed to install OpenVSwitch, which is a dependency of
opnfv-apex. If you do not have external connectivity to use this repository you need to download
the OpenVSwitch RPM from the RDO Project repositories and install it with the opnfv-apex RPM.

Preparing your jumphost using an ISO image
------------------------------------------

An alternative to preparing your own jumphost id to use a <template> ISO image as a boot image.
Download or build the ISO image according to the following instructions.

Retrieving the ISO image
^^^^^^^^^^^^^^^^^^^^^^^^

If you choose to install the <template> scenario from an ISO image you must first
retrieve the <template-containing>.iso image of the Colorado release.  This can be
found  can be found at <hyperlink required>.

Building the ISO image
^^^^^^^^^^^^^^^^^^^^^^

Alternatively, you may choose to build the Fuel .iso from source by cloning the
opnfv/fuel git repository.  To retrieve the repository for the Brahmaputra release use the following command:

$ git clone https://gerrit.opnfv.org/gerrit/fuel

Check-out the Brahmaputra release tag to set the HEAD to the
baseline required to replicate the Brahmaputra release:

$ git checkout colorado.1.0

Go to the fuel directory and build the .iso:

$ cd fuel/build; make all

For more information on how to build, please see *Reference: 14*

Booting from the ISO image
^^^^^^^^^^^^^^^^^^^^^^^^^^

Mount the <template> ISO file/media as a boot device on the jump host server.  If all your hardware
preparation is complete at this time you should reboot the jumphost to establish the deployment server.


Additional preparations
-----------------------
.. Additional information should be provided here.  it should be relatively short and informative
.. and not drag attention away from the hardware preparation section.


Additionally, familiarize yourself with Fuel by reading the following documents:

- Fuel planning guide, please see *Reference: 8*

- Fuel user guide, please see *Reference: 9*

- Fuel operations guide, please see *Reference: 10*

- Fuel Plugin Developers Guide, please see *Reference: 11*

Prior to installation, a number of deployment specific parameters must be collected, those are:

#.     Provider sub-net and gateway information

#.     Provider VLAN information

#.     Provider DNS addresses

#.     Provider NTP addresses

#.     Network overlay you plan to deploy (VLAN, VXLAN, FLAT)

#.     How many nodes and what roles you want to deploy (Controllers, Storage, Computes)

#.     Monitoring options you want to deploy (Ceilometer, Syslog, etc.).

#.     Other options not covered in the document are available in the links above

This information will be needed for the configuration procedures
provided in this document.
