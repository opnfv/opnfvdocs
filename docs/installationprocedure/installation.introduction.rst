.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
   .. (c) Sofia Wallin Ericsson AB

========
Abstract
========

The following document provides an overview of the instructions required for the installation
of the Colorado release of OPNFV.

The Colorado release can be installed using a variety of technologies provided by the
integration projects participating in OPNFV: Apex, Compass4Nfv, Fuel and JOID.
Each installer provides the ability to install a common OPNFV platform as well as integrating
additional features delivered through a variety of scenarios by the OPNFV community.

============
Introduction
============

The OPNFV platform is comprised of a variety of upstream components that may be deployed on your physical
infrastructure.  A composition of components, tools and configurations is identified in OPNFV as a
deployment scenario.
The various OPNFV scenarios provide unique features and capabilities that you may want to leverage,
it is important to understand your required target platform capabilities before installing and
configuring your target scenario.

An OPNFV installation requires either a physical, or virtual, infrastructure environment as defined
in the `Pharos specification <http://artifacts.opnfv.org/pharos/colorado/docs/specification/index.html>`_.
When configuring a physical infrastructure it is strongly advised to follow the Pharos configuration guidelines.

=========
Scenarios
=========

OPNFV scenarios are designed to host virtualised network functions (VNF’s) in a variety of deployment
architectures and locations. Each scenario provides specific capabilities and/or components aimed to
solve specific problems for the deployment of VNF’s.
A scenario may, for instance, include components such as OpenStack, OpenDaylight, OVS, KVM etc...
where each scenario will include different source components or configurations.

To learn more about the scenarios supported in the Colorado release refer to the scenario
description documents provided:

- Accelerated OVS `os-nosdn-ovs <http://artifacts.opnfv.org/ovsnfv/colorado/docs/scenarios_os-nosdn-ovs/index.html>`_
- FD.io based forwarding `os-nosdn-fdio-noha <http://artifacts.opnfv.org/fds/docs/scenarios_os-nosdn-fdio-noha/index.html>`_
- Layer 3 overlay using opendaylight `os-odl-l2-bgpvpn <http://artifacts.opnfv.org/bgpvpn/colorado/docs/scenarios_os-odl_l2-bgpvpn/index.html>`_
- FD.io based forwarding using opendaylight SDN `os-odl-12-fdio-noha <http://artifacts.opnfv.org/fds/colorado/scenarios_os-odl_l2-fdio-noha/index.html>`_
- High availability service function chaining `os-odl-l2-sfc-ha <http://artifacts.opnfv.org/sfc/colorado/docs/scenarios_os-odl_l2-sfc-ha/index.html>`_
- Service function chaining `os-odl-l2-sfc-noha <http://artifacts.opnfv.org/sfc/colorado/docs/scenarios_os-odl_l2-sfc-noha/index.html>`_
- Moon security solution enabled `os-odl-l2-moon-ha <http://artifacts.opnfv.org/moon/colorado/docs/senarios/os-odl_l2-moon-ha/index.html>`_
- Accelerated KVM hypervisor `os-nosdn-kvm-ha <http://artifacts.opnfv.org/kvmfornfv/colorado/docs/scenarios_os-nosdn-kvm-ha-single/index.html>`_

======================
Installation Procedure
======================

Detailed step by step instructions for working with an installation toolchain and installing
the required scenario are provided by each installation project.  The four projects providing installation
support for the OPNFV Colorado release are; Apex, Compass4nfv, Fuel and Joid.

The instructions for each toolchain can be found in these links:

- `Apex installation instruction <http://artifacts.opnfv.org/apex/colorado/docs/installationprocedure/index.html>`_
- `Compass4nfv installation instruction <http://artifacts.opnfv.org/compass4nfv/colorado/docs/installationprocedure/index.html>`_
- `Fuel installation instruction <http://artifacts.opnfv.org/fuel/colorado/docs/installationprocedure/index.html>`_
- `Joid installation instruction <http://artifacts.opnfv.org/joid/colorado/docs/installationprocedure/index.html>`_

=====================
OPNFV Test Frameworks
=====================

If you have elected to install the OPNFV platform using the deployment toolchain provided by OPNFV
your system will have been validated once the installation is completed.
The basic deployment validation only addresses a small component of the capability provided in
the platform and you may desire to execute more exhaustive tests.  Some investigation is required to
select the right test suites to run on your platform from the available projects and suites.

Many of the OPNFV test project provide user-guide documentation and installation instructions as provided below:

- `Functest user guide <http://artifacts.opnfv.org/functest/colorado/docs/userguide/index.html>`_
- `Yardstick user guide <http://artifacts.opnfv.org/yardstick/colorado/docs/userguide/index.html>`_
- `vSwitchPerf user guide <http://artifacts.opnfv.org/vswitchperf/colorado/index.html>`_
- `Software Fastpath Service Quality Metrics (SFQM) user guide <http://artifacts.opnfv.org/fastpathmetrics/colorado/index.html>`_
- `Bottlenecks user guide <http://artifacts.opnfv.org/bottlenecks/colorado/docs/installationprocedure/index.html>`_
- `Storage Performance Benchmarking for NFVI (StorPerf) user guide <http://artifacts.opnfv.org/storperf/colorado/docs/userguide/index.html>`_

==============
Security Notes
==============

The following patches were applied to fix security issues discovered in opnfv
projects, during the c-release cycle.

- `Removal of private keys: <https://gerrit.opnfv.org/gerrit/#/c/21995/>`_
- `Fix security issues of eval-s in testapi: <https://gerrit.opnfv.org/gerrit/#/c/20751/>`_
- `Implements use of yaml.safe_load: <https://gerrit.opnfv.org/gerrit/#/c/20911/>`_
- `Fix security issues reported by the security audit: <https://gerrit.opnfv.org/gerrit/#/c/20693/>`_
- `Fix issues found in security review: <https://gerrit.opnfv.org/gerrit/#/c/21541/>`_
- `Removing OpenSteak Project: <https://gerrit.opnfv.org/gerrit/#/c/22139/>`_
- `Remove unsed files in open-contrail role: <https://gerrit.opnfv.org/gerrit/#/c/21997/>`_
- `Get rid of private key in repo: <https://gerrit.opnfv.org/gerrit/#/c/21985>`_
- `Handling file loads and tmp dirs differently <https://gerrit.opnfv.org/gerrit/#/c/21499>`_
- `Remove `Debug = True when run Flask and add logger <https://gerrit.opnfv.org/gerrit/#/c/21799/>`_

