.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) Christopher Price (Ericsson AB)

Brahmaputra OpenStack User Guide
================================

OpenStack is a cloud operating system developed and released by the
`OpenStack project <https://www.openstack.org>`_.  OpenStack is used in OPNFV for
controlling pools of compute, storage, and networking resources in a Pharos
compliant infrastructure.

OpenStack is used in Brahmaputra to manage tenants (known in OpenStack as projects),
users, services, images, flavours, and quotas across the Pharos infrastructure.
The OpenStack interface provides the primary interface for an operational Brahmaputra
deployment and it is from the "horizon console" that an OPNFV user will perform the
majority of administrative and operational activities on the deployment.

OpenStack references
--------------------

The `OpenStack user guide <http://docs.openstack.org/user-guide>`_ provides details
and descriptions of how to configure and interact with the OpenStack deployment.  This
guide can be used by lab engineers and operators to tune the OpenStack deployment to
your liking.

Once you have configured OpenStack to your purposes, or the Brahmaputra deployment meets
your needs as deployed, an operator, or administrator, will find the best guidance for
working with OpenStack in the
`OpenStack administration guide <http://docs.openstack.org/user-guide-admin>`_.

Connecting to the OpenStack instance
------------------------------------

Once familiar with the basic of working with OpenStack you will want to connect to the
OpenStack instance via the Horizon Console.  The Horizon console provide a Web based GUI
that will allow you operate the deployment.
To do this you should open a browser on the JumpHost to the following address
and enter the username and password:


  http://{Controller-VIP}:80/index.html>
  username: admin
  passwordpassword: admin

Other methods of interacting with and configuring OpenStack,, like the REST API
and CLI are also available in the Brahmaputra deployment, see the
`OpenStack administration guide <http://docs.openstack.org/user-guide-admin>`_
for more information on using those interfaces.
