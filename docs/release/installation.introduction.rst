.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) Sofia Wallin Ericsson AB

====================
OPNFV Installation
====================

Abstract
========

The following document provides an overview of the instructions required for the installation
of the Colorado release of OPNFV.

The Colorado release can be installed using a variety of technologies provided by the
integration projects participating in OPNFV: Apex, Compass4Nfv, Fuel and JOID.
Each installer provides the ability to install a common OPNFV platform as well as integrating
additional features delivered through a variety of scenarios by the OPNFV community.


Introduction
============

The OPNFV platform is comprised of a variety of upstream components that may be deployed on your physical
infrastructure.  A composition of components, tools and configurations is identified in OPNFV as a
deployment scenario.
The various OPNFV scenarios provide unique features and capabilities that you may want to leverage,
it is important to understand your required target platform capabilities before installing and
configuring your target scenario.

An OPNFV installation requires either a physical, or virtual, infrastructure environment as defined
in the `Pharos specification <http://artifacts.opnfv.org/pharos/colorado/2.0/docs/specification/index.html>`.
When configuring a physical infrastructure it is strongly advised to follow the Pharos configuration guidelines.


Scenarios
=========

OPNFV scenarios are designed to host virtualised network functions (VNF’s) in a variety of deployment
architectures and locations. Each scenario provides specific capabilities and/or components aimed to
solve specific problems for the deployment of VNF’s.
A scenario may, for instance, include components such as OpenStack, OpenDaylight, OVS, KVM etc...
where each scenario will include different source components or configurations.

To learn more about the scenarios supported in the Colorado release refer to the scenario
description documents provided:

- Accelerated OVS `os-nosdn-ovs <http://artifacts.opnfv.org/ovsnfv/colorado/2.0/docs/scenarios_os-nosdn-ovs/index.html>`
- Layer 3 overlay using opendaylight `os-odl-l2-bgpvpn <http://artifacts.opnfv.org/sdnvpn/colorado/2.0/docs/scenarios_os-odl_l2-bgpvpn/index.html>`
- FD.io based forwarding using opendaylight SDN `os-odl-12-fdio-noha <http://artifacts.opnfv.org/fds/colorado/2.0/scenarios_os-odl_l2-fdio-noha/index.html>`
- High availability service function chaining `os-odl-l2-sfc-ha <http://artifacts.opnfv.org/sfc/colorado/2.0/docs/scenarios_os-odl_l2-sfc-ha/index.html>`
- Service function chaining `os-odl-l2-sfc-noha <http://artifacts.opnfv.org/sfc/colorado/2.0/docs/scenarios_os-odl_l2-sfc-noha/index.html>`
- Accelerated KVM hypervisor `os-nosdn-kvm-ha <http://artifacts.opnfv.org/kvmfornfv/colorado/2.0/docs/scenarios_os-nosdn-kvm-ha/index.html>`
- LXD container hypervisor `os-nosdn-lxd-noha <http://artifacts.opnfv.org/joid/colorado/2.0/docs/scenarios_os-nosdn-lxd-noha/index.html>`
- High Availability LXD container hypervisor `os-nosdn-lxd-ha <http://artifacts.opnfv.org/joid/colorado/2.0/docs/scenarios_os-nosdn-lxd-ha/index.html>`


Installation Procedure
======================

Detailed step by step instructions for working with an installation toolchain and installing
the required scenario are provided by each installation project.  The four projects providing installation
support for the OPNFV Colorado release are; Apex, Compass4nfv, Fuel and Joid.

The instructions for each toolchain can be found in these links:

- :ref:`Apex installation instruction <apex-installation>`
- :ref:`Compass4nfv installation instruction <compass4nfv-installation>`
- :ref:`Fuel installation instruction <fuel-installation>`
- :ref:`Joid installation instruction <joid-installation>`


OPNFV Test Frameworks
=====================

If you have elected to install the OPNFV platform using the deployment toolchain provided by OPNFV
your system will have been validated once the installation is completed.
The basic deployment validation only addresses a small component of the capability provided in
the platform and you may desire to execute more exhaustive tests.  Some investigation is required to
select the right test suites to run on your platform from the available projects and suites.

Many of the OPNFV test project provide user-guide documentation and installation instructions as provided below:

- :ref:`Functest user guide <functest-userguide>`
- :ref:`Yardstick user guide <yardstick-userguidde>`
- :ref:`vSwitchPerf user guide <vswitchperf-userguide>`
- :ref:`Software Fastpath Service Quality Metrics (SFQM) user guide <fastpathmetrics-userguide>`
- :ref:`Bottlenecks user guide <bottlenecks-userguide>`
- :ref:`Storage Performance Benchmarking for NFVI (StorPerf) user guide <storperf-userguide>`


Security Notes
==============

The following patches were applied to fix security issues discovered in opnfv
projects, during the c-release cycle.

- :ref:`Removal of private keys <https://gerrit.opnfv.org/gerrit/#/c/21995/>`
- :ref:`Fix security issues of eval-s in testapi <https://gerrit.opnfv.org/gerrit/#/c/20751/>`
- :ref:`Implements use of yaml.safe_load <https://gerrit.opnfv.org/gerrit/#/c/20911/>`
- :ref:`Fix security issues reported by the security audit <https://gerrit.opnfv.org/gerrit/#/c/20693/>`
- :ref:`Fix issues found in security review <https://gerrit.opnfv.org/gerrit/#/c/21541/>`
- :ref:`Removing OpenSteak Project <https://gerrit.opnfv.org/gerrit/#/c/22139/>`
- :ref:`Remove unsed files in open-contrail role <https://gerrit.opnfv.org/gerrit/#/c/21997/>`
- :ref:`Get rid of private key in repo <https://gerrit.opnfv.org/gerrit/#/c/21985>`
- :ref:`Handling file loads and tmp dirs differently <https://gerrit.opnfv.org/gerrit/#/c/21499>`
- :ref:`Remove `Debug = True when run Flask and add logger <https://gerrit.opnfv.org/gerrit/#/c/21799/>`
