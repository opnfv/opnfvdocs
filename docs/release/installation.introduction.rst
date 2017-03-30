.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. SPDX-License-Identifier: CC-BY-4.0
.. (c) Sofia Wallin Ericsson AB

====================
OPNFV Installation
====================

Abstract
========

The following document provides an overview of the instructions required for the installation
of the Danube release of OPNFV.

The Danube release can be installed using a tool from the following integration projects in OPNFV:
Apex, Compass4Nfv, Fuel and JOID.  Each installer provides the ability to install a common OPNFV
platform as well as integrating additional features delivered through a variety of scenarios by
the OPNFV community.


Introduction
============

The OPNFV platform is comprised of a variety of upstream components that may be deployed on your physical
infrastructure.  A composition of components, tools and configurations is identified in OPNFV as a
deployment scenario.

The various OPNFV scenarios provide unique features and capabilities that you may want to leverage, and
it is important to understand your required target platform capabilities before installing and
configuring your scenarios.

An OPNFV installation requires either a physical, or virtual, infrastructure environment as defined
in the `Pharos specification <https://wiki.opnfv.org/display/pharos/Pharos+Specification>`.
When configuring a physical infrastructure it is strongly advised to follow the Pharos configuration guidelines.


Scenarios
=========

OPNFV scenarios are designed to host virtualised network functions (VNF’s) in a variety of deployment
architectures and locations. Each scenario provides specific capabilities and/or components aimed at
solving specific problems for the deployment of VNF’s.

A scenario may, for instance, include components such as OpenStack, OpenDaylight, OVS, KVM etc.,
where each scenario will include different source components or configurations.

To learn more about the scenarios supported in the Danube release refer to the scenario
description documents provided:

- :ref:`os-nosdn-kvm-ha <kvmfornfv-os-nosdn-kvm-ha>`
- :ref:`os-nosdn-kvm_ovs_dpdk-noha <kvmfornfv-os-nosdn-kvm_nfv_ovs_dpdk-noha>`
- :ref:`os-nosdn-kvm_ovs_dpdk_bar-noha <kvmfornfv-os-nosdn-kvm_nfv_ovs_dpdk_bar-noha>`
- :ref:`os-odl_l3-nofeature-ha <>`
- :ref:`os-odl_l3-fdio-noha <os-odl_l3-fdio-noha>`
- :ref:`os-odl_l2-fdio-ha <os-odl_l2-fdio-ha>`
- :ref:`os-odl_l2-fdio-noha <os-odl_l2-fdio-noha>`
- :ref:`os-nosdn-fdio-noha <os-nosdn-fdio-noha>`
- :ref:`os-nosdn-kvm-noha <>`
- :ref:`os-odl-gluon-noha <gluon-scenario>`
- :ref:`os-nosdn-nofeature-ha <>`
- :ref:`os-odl_l2-nofeature-ha <>`
- :ref:`os-odl_l3-nofeature-ha <>`
- :ref:`os-onos-nofeature-ha <>`
- :ref:`os-nosdn-openo-ha <>`
- :ref:`os-odl_l2-sfc-ha <os-odl_l2-sfc-ha>`
- :ref:`os-odl_l2-sfc-noha <os-odl_l2-sfc-noha>`
- :ref:`os-nosdn-nofeature-ha <>`
- :ref:`os-nosdn-nofeature-noha <>`
- :ref:`os-odl_l2-nofeature-ha <>`
- :ref:`os-odl_l2-nofeature-noha <>`
- :ref:`os-odl_l3-nofeature-ha <>`
- :ref:`os-odl_l3-nofeature-noha <>`
- :ref:`os-nosdn-nofeature-ha <>`
- :ref:`os-nosdn-nofeature-noha <>`
- :ref:`os-nosdn-lxd-ha <os-nosdn-lxd-ha>`
- :ref:`os-nosdn-lxd-noha <os-nosdn-lxd-noha>`
- :ref:`k8-nosdn-nofeature-noha <>`
- :ref:`k8-nosdn-lb-noha <>`


Installation Procedure
======================

Detailed step by step instructions for working with an installation toolchain and installing
the required scenario are provided by each installation project.  The four projects providing installation
support for the OPNFV Danube release are; Apex, Compass4nfv, Fuel and Joid.

The instructions for each toolchain can be found in these links:

- :ref:`Apex installation instruction <apex-installation>`
- :ref:`Compass4nfv installation instruction <compass4nfv-installation>`
- :ref:`Fuel installation instruction <fuel-installation>`
- :ref:`Joid installation instruction <joid-installation>`

OPNFV Test Frameworks
=====================

If you have elected to install the OPNFV platform using the deployment toolchain provided by OPNFV
your system will have been validated once the installation is completed.
The basic deployment validation only addresses a small part of capabilities provided in
the platform and you may want to execute more exhaustive tests.  Some investigation will be required to
select the right test suites to run on your platform.

Many of the OPNFV test project provide user-guide documentation and installation instructions in :ref:`this document <testing-userguide>`

Security Notes
==============

The following patches were applied to fix security issues discovered in OPNFV
projects, during the Danube release cycle.

- Links to security patches need to be added here.  (todo)
