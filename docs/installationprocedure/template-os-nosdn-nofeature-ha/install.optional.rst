.. This work is licensed under a Creative Commons Attribution 4.0 International
.. License. .. http://creativecommons.org/licenses/by/4.0 ..
.. (c) Christopher Price (Ericsson AB) and others


OPTIONAL - Set Local Mirror Repos
---------------------------------

The following steps can be executed if you are in an environment with
no connection to the Internet. The Fuel server delivers a local repo
that can be used for installation / deployment of openstack.

#. In the Fuel UI of your Environment, click the Settings Tab and select General from the left pane.

   - Replace the URI values for the "Name" values outlined below:

   - "ubuntu" URI="deb http://<ip-of-fuel-server>:8080/mirrors/ubuntu/ trusty main"

   - "ubuntu-security" URI="deb http://<ip-of-fuel-server>:8080/mirrors/ubuntu/ trusty-security main"

   - "ubuntu-updates" URI="deb http://<ip-of-fuel-server>:8080/mirrors/ubuntu/ trusty-updates main"

   - "mos" URI="deb http://<ip-of-fuel-server>::8080/liberty-8.0/ubuntu/x86_64 mos8.0 main restricted"

   - "Auxiliary" URI="deb http://<ip-of-fuel-server>:8080/liberty-8.0/ubuntu/auxiliary auxiliary main restricted"

   - Click <Save Settings> at the bottom to Save your changes

Target specific configuration
-----------------------------

#. Set up targets for provisioning with non-default "Offloading Modes"

   Some target nodes may require additional configuration after they are
   PXE booted (bootstrapped); the most frequent changes are in defaults
   for ethernet devices' "Offloading Modes" settings (e.g. some targets'
   ethernet drivers may strip VLAN traffic by default).

   If your target ethernet drivers have wrong "Offloading Modes" defaults,
   in "Configure interfaces" page (described above), expand affected
   interface's "Offloading Modes" and [un]check the relevant settings:

#. Set up targets for "Verify Networks" with non-default "Offloading Modes"

   **NOTE**: Check *Reference 15* for an updated and comprehensive list of
   known issues and/or limitations, including "Offloading Modes" not being
   applied during "Verify Networks" step.

   Setting custom "Offloading Modes" in Fuel GUI will only apply those settings
   during provisioning and **not** during "Verify Networks", so if your targets
   need this change, you have to apply "Offloading Modes" settings by hand
   to bootstrapped nodes.

   **E.g.**: Our driver has "rx-vlan-filter" default "on" (expected "off") on
   the openstack interface(s) "eth1", preventing VLAN traffic from passing
   during "Verify Networks".

   - From Fuel master console identify target nodes admin IPs:

     .. code-block:: bash

         $ fuel nodes


   - SSH into each of the target nodes and disable "rx-vlan-filter" on the
     affected physical interface(s) allocated for OpenStack traffic (eth1):

     .. code-block:: bash

         $ ssh root@10.20.0.6 ethtool -K eth1 rx-vlan-filter off

   - Repeat the step above for all affected nodes/interfaces in the POD.

