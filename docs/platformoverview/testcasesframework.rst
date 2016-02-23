.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) OPNFV, Huawei

=================
Testing ecosystem
=================

Testing is a very important area and a key challenge for OPNFV platform.
Testing an OPNFV deployment from multiple scopes and different perspectives can
verify the real status of OPNFV platform. In OPNFV community
several testing projects exist that provide validation frameworks,
tools and test cases used in the Brahmaputra release.
These test projects each have individual focus areas such as component validation,
use case verification, and performance testing.

Summarizing we can say that OPNFV provides an open source automated testing ecosystem
for telecom cloud testing.

Release verification
====================

.. ==> start this section with a statement on our release criteria.
.. Then move to the specifics of deploy and test suite execution.

Before a new OPNFV platform version is released, a suite of test cases is executed
to verify major functions and capability of the platform.
These test cases are automatically executed as part of the CI/CD pipeline,
and passing these test cases at least 4 successful consecutive iterations in CI
demonstrates the platform is ready for being released.
In Brahmaputra, these test cases for verification are provided by two testing projects:
Functest and Yardstick.

Functest
--------

Functest tries to provide a functional testing framework along with a set of test suites
and test cases to test and verify OPNFV platform functionality that covers the VIM and NFVI components.
The scope of Functest and relevant test cases can be found at: https://wiki.opnfv.org/opnfv_functional_testing.

.. ==> need to replace wiki links by links to release documents.

In Brahmaputra, Functest is focusing on OpenStack and SDN controllers deployment testing.
Its testing framework combines a number of testing tools
to verify the key components of OPNFV platform running successfully.
For example, Rally and Tempest are integrated for OpenStack basic functional testing and benchmark,
Robot is used for ODL testing, and Teston is integrated for ONOS testing.
Besides these, Functest also includes candidate VNF functional testing, such as vPing and vIMS.

Yardstick
---------

Yardstick is a testing project for verifying the infrastructure compliance when running VNF applications.
Yardstick can benchmark a number of characteristics/performance vectors about the infrastructure,
that makes it become a useful pre-deployment NFVI testing tools.
Yardstick is also a flexible testing framework for a number of OPNFV feature testing.
The detail of Yardstick project can be found at: https://wiki.opnfv.org/yardstick.

.. ==> need to replace wiki links by links to release documents.

There are two types of test cases in Yardstick: Yardstick Generic test cases and OPNFV feature test cases.
Yardstick Generic test cases include basic characteristics benchmarking in compute/storage/network area.
OPNFV feature test cases include basic telecom feature testing form other OPNFV projects,
just like nfv-kvm, sfc, ipv6, Parser, Availability and SDN VPN.
All of the Yardstick test cases are listed on: https://wiki.opnfv.org/candidates_for_test_cases.

Additional Testing
==================

Besides the test suites and cases for release verification, there are some additional testing
for specific feature or characteristics on OPNFV platform.
These testing framework and test cases may include some specific needs,
such as extended measurements, or additional testing stimuli, or tests which cause disturbances on the environment.
These additional testing can provide a more complete evaluation about OPNFV platform deployment.

Qtip
----

Qtip is a performance benchmark testing project by using a "Bottom-Up" approach
in characterizing and benchmarking OPNFV platform.
Qtip aims to benchmark the performance of components for a quantitative analysis and doesn't deal with validation of the platform.

In Brahmaputra, Qtip develops a flexible framework,
adds a number of test cases covering compute/storage/network area,
and compares these benchmarks on a bare metal machine vs a VM.
These contrastive result can be used to evaluate the performance of these components on the OPNFV platform basically.

VSPERF
------

VSPERF will develop a generic and architecture agnostic vSwitch testing framework and associated tests,
that will serve as a basis for validating the suitability of different vSwitch implementations
in a Telco NFV deployment environment.
The output of this project will be utilized as part of OPNFV Platform and VNF level testing and validation.

Bottlenecks
-----------

Bottlenecks will provide a framework to find system bottlenecks
by testing and verifying OPNFV infrastructure in a staging environment before committing it to a production environment.
The Bottlenecks framework can not only find specific system limitations and bottlenecks,
but also the root cause of these bottlenecks.

In Brahmaputra, Bottlenecks includes two test cases:
rubbos and vstf. These test cases are executed on OPNFV community pods,
and test result report are visible on the community testing dashboard.



