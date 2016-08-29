.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) Open Platform for NFV Project, Inc. and its contributors

===========================
The OPNFV Testing ecosystem
===========================

The OPNFV community has set out to address the needs of virtualisation in the carrier
network and as such platform validation and measurements are a cornerstone to our
iterative releases and objectives.

To simplify the complex task of feature, component and platform validation and characterisation
our testing community have established a fully automated method for addressing all key areas
of platform validation.  This has required the integration of a variety of testing frameworks
in our CI systems, real time and automated analysis of results, storage and publication of key
facts for each run.

Release verification
====================

The OPNFV community relies on it's testing community to establish our release criteria for
each OPNFV release.  Each release cycle the testing criteria becomes more stringent and
better representative of our feature and resiliency requirements.

As each OPNFV release establishes a set of deployment scenarios to validate, our testing
infrastructure and test suites need to be able to accomodate these features and capabilities.
It is not only in the validation of the scenarios themselves that complexity increases,
there are test cases that require mutiple datacenters to execute when evaluating features
including multisite and distributed datacenter solutions.

The release criteria as established by the testing teams includes passing a set of
test cases derived from our functional testing project 'functest', a set of test cases derived
from our platform system and performance test project 'yardstick', and a selection of test
cases for feature capabilities derived from other test projects such as bottlenecks,
vsperf, cperf and storperf.  The scenario needs to be able to be deployed, pass these tests
and be removed from the infrastructure iterarively (no less that 4 times) in order to
fulfill the release criteria.

Functest
--------

Functest provides a functional testing framework along with a set of test suites
and test cases that test and verify OPNFV platform functionality.
The scope of Functest and relevant test cases can be found in its
`user guide <http://artifacts.opnfv.org/functest/brahmaputra/docs/userguide/userguide.pdf>`_.

In Brahmaputra, Functest is focusing on OpenStack and SDN controllers deployment testing.
Its testing framework combines a number of testing tools
to verify the key components of the OPNFV platform are running successfully.
For example, Rally and Tempest are integrated for OpenStack basic functional testing and benchmark,
Robot is used for ODL testing, and Teston is integrated for ONOS testing.
Besides these, Functest also includes tests by deploying candidate VNFs such as vPing and vIMS, and testing their basic functionality.

Yardstick
---------

Yardstick is a testing project for verifying the infrastructure compliance when running VNF applications.
Yardstick can benchmark a number of characteristics/performance vectors about the infrastructure,
that makes it become a useful pre-deployment NFVI testing tools.

Yardstick is also a flexible testing framework supporting OPNFV feature testing by the various projects in OPNFV.
Projects can plug in their test cases for specific features easily.

The detail of Yardstick project can be found in the
`yardstick user guide <http://artifacts.opnfv.org/yardstick/brahmaputra/user_guides_framework/user_guides_framework.pdf>`_.

There are two types of test cases in Yardstick: Yardstick generic test cases and OPNFV feature test cases.
Yardstick generic test cases include basic characteristics benchmarking in compute/storage/network area.
OPNFV feature test cases include basic telecom feature testing from OPNFV projects,
for example nfv-kvm, sfc, ipv6, Parser, Availability and SDN VPN.

All of the Yardstick test cases are listed on
`<http://artifacts.opnfv.org/yardstick/brahmaputra/docs/configguide_yardstick_testcases/03-list-of-tcs.html>`_.


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



