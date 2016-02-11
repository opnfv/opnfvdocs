.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) Christopher Price (Ericsson AB)

-----------------------
OpenDaylight User Guide
-----------------------

OpenDaylight is an SDN controller platform developed and released by the
`OpenDaylight project <https://www.opendaylight.org/>`_.
The OpenDaylight controller is installed and configured in OPNFV as the networking
component of a variety of OPNFV NVFi scenarios using the neutron ODL device driver
as an integration point toward OpenStack.

OpenDaylight runs within a JVM and is installed in OPNFV within a container and
integrated with OpenStack.  The OpenDaylight instance can be configured through the
OpenStack Horizon interface, or accessed directly from the OPNFV Jumphost.  The
Brahmaputra release of OPNFV integrates the latest
`Beryllium release <https://www.opendaylight.org/downloads/>`_.

OpenDaylight references
-----------------------

For an overview of the OpenDaylight controller a good reference is the
`Getting Started Guide <http://go.linuxfoundation.org/l/6342/2015-06-28/2l76qt/6342/128122/bk_getting_started_guide_20150629.pdf>`_.  For more detailed information
about using the platform the `OpenDaylight User Guide <http://go.linuxfoundation.org/l/6342/2015-06-28/2l76qw/6342/128126/bk_user_guide_20150629.pdf>`_
provides a good feature by feature reference.

It is important when working on your Brahmaputra deployment to be aware of the
configured state of the OpenDaylight controller in the scenario you have deployed,
installing an SFC scenario will for instance configure the OpenDaylight controller
with the required SFC Karaf features in the OpenDaylight controller.  Make sure you
read the installation and configuration guide carefully to understand the state
of the deployed system.

Connecting to the OpenDaylight instance
---------------------------------------

Once you are familiar with the OpenDaylight controller and its configuration
you will want to connect to the OpenDaylight instance from the Jumphost.
To do this you should open a browser on the JumpHost to the following address
and enter the username and password:

  http://{Controller-VIP}:8181/index.html>
  username: admin
  password: admin

Other methods of interacting with and configuring the controller, like the REST API
and CLI are also available in the Brahmaputra deployment, see the
`OpenDaylight User Guide <http://go.linuxfoundation.org/l/6342/2015-06-28/2l76qw/6342/128126/bk_user_guide_20150629.pdf>`_
for more information on using those interfaces.

It is important to be aware that when working directly on the OpenDaylight controller
the OpenStack instance will not always be aware of the changes you are making to the
networking controller.  This may result in unrecoverable inconsistencies in your deployment.
