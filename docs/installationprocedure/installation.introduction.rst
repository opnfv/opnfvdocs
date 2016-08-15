.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) Sofia Wallin Ericsson AB

******************************
OPNFV Installation Instruction
******************************

Abstract
--------

This document provides guidance and instructions for the installation of the OPNFV Colorado release.

The release includes four installer tools leveraging different technologies; Apex, Compass4nfv, Fuel
and JOID, which deploy components of the platform.

This document provides a guide for the selection of tools and components including guidelines for
how to deploy and configure the platform to an operational state.

============
Introduction
============

The OPNFV platform is comprised of a variety of upstream components that may be deployed on your
infrastructure using a variety of tools.  A composition of components, tools and configurations is
identified in OPNFV as a deployment scenario.
The various OPNFV scenarios provide unique features and capabilities that you may want to leverage,
it is important to understand your required target platform capabilities before installing and
configuring your target scenario.

An OPNFV installation requires either a physical, or virtual, infrastructure environment as defined
in the Pharos specification. When configuring a physical infrastructure it is strongly advised to
follow the Pharos configuration guidelines. 
<Pharosspec>
<Pharosvirtspec>

=========
Scenarios
=========

OPNFV scenarios are designed to host virtualised network functions (VNF’s) in a variety of deployment
architectures and locations. Each scenario provide specific capabilities and/or components aimed to
solve specific problems for the deployment of VNF’s.
A scenario may, for instance, include components such as OpenStack, OpenDaylight, OVS, KVM etc...
where each scenario will include different source components or configurations.

To learn more about the scenarios' supported in the Colorado release refer to the scenario
overview documents provided:
os-nosdn-ovs http://artifacts.opnfv.org/ovsnfv/colorado/docs/scenarios/index.htlm


======================
Installation procedure
======================

Installation of OPNFV requires a complex set of instructions and functions provided by a deployment toolchain.
In OPNFV Colorado the scenarios supported are able to be deployed by following the deployment toolchains
installation instructions. The scenario description document will provide a reference to the
correct installation guide, including helpful hints where necessary.

OPNFV supports four different deployment tools incuding Apex, Compass4nfv, Fuel and Joid.
* `Fuel installation instruction <http://artifacts.opnfv.org/fuel/colorado/docs/installationprocedure/index.html>`_
* `Apex installation instruction <http://artifacts.opnfv.org/apex/colorado/docs/installationprocedure/index.html>`_
* `Compass4nfv installation instruction http://artifacts.opnfv.org/compass4nfv/colorado/docs/installationprocedure/index.html>`_
* `Joid installation instruction http://artifacts.opnfv.org/joid/colorado/docs/installationprocedure/index.html>`_

====================
Platform verfication
====================

After installing your specific deployment please make sure that you run the relevant tests suites.

Functest user guide http://artifacts.opnfv.org/functest/colorado/docs/userguide/index.html
Yardstick user guide http://artifacts.opnfv.org/yardstick/colorado/docs/userguide/index.html
vSwitchPerf user guide http://artifacts.opnfv.org/vswitchperf/colorado/index.html
Software Fastpath Service Quality Metrics (SFQM) user guide http://artifacts.opnfv.org/fastpathmetrics/colorado/index.html
Bottlenecks user guide http://artifacts.opnfv.org/bottlenecks/colorado/docs/installationprocedure/index.html

