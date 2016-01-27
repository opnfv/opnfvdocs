Scenario's are implemented as deployable compositions through integration with an installation tool.
OPNFV supports multiple installation tools and for any given release not all tools will support all
scenario's.  While our target is to establish parity across the installation tools to ensure they
can provide all scenarios, the practical challenge of achieving that goal for any given feature and
release results in some disparity.

Scenario Naming

In OPNFV scenario's are identified by short scenario names, these names follow a scheme that
identifies the key components and behaviours of the scenario.  The rules for scenario naming are as follows:

  os-[controller]-[feature]-[mode]-[option]

Details of the fields are
  * os: mandatory
    * Refers to the platform type used
    * possible value: os (openstack)
  * [controller]: mandatory
    * Refers to the SDN controller integrated in the platform
    * example values: nosdn, ocl, odl, onos
  * [feature]: mandatory
    * Refers to the feature projects supported by the scenario
    * example values: nofeature, kvm, ovs
  * [mode]: mandatory
    * Refers to the deployment type, which may include for instance high availability
    * possible values: ha, noha
  * [option]: optional
    * Used for the scenarios those do not fit into naming scheme.
    * The optional field in the short scenario name should not be included if there is no optional scenario.

Some examples of suported scenario names are:

  * os-nosdn-kvm-noha
    * This is an openstack based deployment using neutron uncluding the OPNFV enhanced KVM hypervisor
  * os-odl_l2-nofeature-ha
    * This is an openstack deployment in high availablility mode including OpenDaylight layer2 networking
  * os-onos-kvm_ovs-noha
    * This is an openstack depoyment using ONOS including OPNFV enhanced KVM and OVS versions

..    Installing your scenario
..    ISO method
..    http://artifacts.opnfv.org/octopus/1463/docs/opnfv-jenkins-slave-connection.html

The following table provides an overview of the installation tools and available scenario's
in the Brahmaputra release of OPNFV.

.. image:: images/brahmaputrascenariomatrix.jpg
   :alt: OPNFV Brahmaputra Scenario Matrix

