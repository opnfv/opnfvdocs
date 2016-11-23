Each scenario provides a set of platform capabilities and features that it supports.  It is
possible to identify which features are provided by reviewing the scenario name, however
not all features and capabilities are discernible from the name itself.

Brahmaputra feature support matrix
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following table provides an overview of the available scenarios and supported features
in the Brahmaputra release of OPNFV.

.. image:: ../images/brahmaputrafeaturematrix.jpg
   :alt: OPNFV Brahmaputra Feature Matrix

The table above provides an overview of which scenarios will support certain feature capabilities.
The table does not indicate if the feature or scenario has limitations. Refer to the
`Configuration Guide <http://artifacts.opnfv.org/opnfvdocs/brahmaputra/docs/configguide/configoptions.html#opnfv-scenarios>`_
for details on the state of each scenario and further information.

Feature development in the Brahmaputra release often consisted of the development of specific
requirements and the further integration and validation of those requirements.  This results in some
features only being supported on the platform when a specific scenario, providing the
capabilities necessary to run the feature, is deployed.

Scenario Naming
^^^^^^^^^^^^^^^

In OPNFV, scenarios are identified by short scenario names.  These names follow a scheme that
identifies the key components and behaviours of the scenario, the rules for scenario naming are as follows:

  os-[controller]-[feature]-[mode]-[option]

For example: *os-nosdn-kvm-noha* provides an OpenStack based deployment using neutron including
the OPNFV enhanced KVM hypervisor.

The [feature] tag in the scenario name describes the main feature provided by the scenario.
This scenario may also provide support for features, such as advanced fault management, which are
not apparent in the scenario name.
The following section describes the features available in each scenario.

