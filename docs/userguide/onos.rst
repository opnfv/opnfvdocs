.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) Christopher Price (Ericsson AB)

---------------
ONOS User Guide
---------------

ONOS is an SDN controller platform developed and released by the
`ONOS project <https://www.onosproject.org>`_.
The ONOS controller is installed and configured in OPNFV as the networking
component of a variety of OPNFV NFVI scenarios.

ONOS runs within a JVM instance and is integrated with OpenStack via a Neutron ML2 
plugin.  The ONOS instance can be configured through the OpenStack Neutron interface, 
or through native ONOS tools from the OPNFV jumphost.  The Brahmaputra release of 
OPNFV integrates the latest
`ONOS 1.4 (EMU) <https://wiki.onosproject.org/display/ONOS/Download+packages+and+tutorial+VMs>`_
release version.

ONOS references
---------------

For an overview of the ONOS controller, please see
`User Guide <https://wiki.onosproject.org/display/ONOS/User's+Guide>`_.  For more detailed information
about the EMU version of ONOS, documentation is available on the
`ONOS download page <https://wiki.onosproject.org/display/ONOS/Download+packages+and+tutorial+VMs>`_.

Connecting to the ONOS instance
-------------------------------

Once you are familiar with the ONOS controller and its configuration
you will want to connect to the ONOS instance from the Jumphost.
To do this you should open a browser on the JumpHost to the following address
and enter the username and password:

  http://{Controller-VIP}:8282/index.html>
  username: karaf
  password: karaf

Other methods of interacting with and configuring the controller, like the REST API
and CLI are also available in the Brahmaputra deployment, see the
`ONOS User Guide <https://wiki.onosproject.org/display/ONOS/User's+Guide>`_
for more information on using those interfaces.

It is important to be aware that when working directly on the ONOS controller
the OpenStack instance will not always be aware of the changes you are making to the
networking controller.  This may result in unrecoverable inconsistencies in your deployment.

If you have any questions or need further assistance, you may also direct your queries to 
`ONOSFW Forum <http://forum.onosfw.com>`
