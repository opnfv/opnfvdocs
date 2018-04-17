.. _opnfv-installation:

.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. SPDX-License-Identifier: CC-BY-4.0
.. (c) Sofia Wallin Ericsson AB and other contributors

============
Installation
============

Abstract
========

This an overview document for the installation of the Fraser release of OPNFV.

The Fraser release can be installed making use of any of the installer projects in OPNFV:
Apex, Compass4Nfv, Daisy4NFV, Fuel or JOID. Each installer provides the ability to install a common OPNFV
platform as well as integrating additional features delivered through a variety of scenarios by
the OPNFV community.


Introduction
============

The OPNFV platform is comprised of a variety of upstream components that may be deployed on your
infrastructure. A composition of components, tools and configurations is identified in OPNFV as a
deployment scenario.

The various OPNFV scenarios provide unique features and capabilities that you may want to leverage, and
it is important to understand your required target platform capabilities before installing and
configuring your scenarios.

An OPNFV installation requires either a physical infrastructure environment as defined
in the `Pharos specification <https://wiki.opnfv.org/display/pharos/Pharos+Specification>`_, or a virtual one.
When configuring a physical infrastructure it is strongly advised to follow the Pharos configuration guidelines.


Scenarios
=========

OPNFV scenarios are designed to host virtualised network functions (VNF’s) in a variety of deployment
architectures and locations. Each scenario provides specific capabilities and/or components aimed at
solving specific problems for the deployment of VNF’s.

A scenario may, for instance, include components such as OpenStack, OpenDaylight, OVS, KVM etc.,
where each scenario will include different source components or configurations.

To learn more about the scenarios supported in the Fraser release refer to the scenario
description documents provided:


- :ref:`os-nosdn-ovs_dpdk-ha <os-nosdn-ovs_dpdk-ha>`
- :ref:`os-nosdn-ovs_dpdk-noha <os-nosdn-ovs_dpdk-noha>`
- :ref:`k8-nosdn-lb-noha <k8-nosdn-lb-noha>`
- :ref:`k8-ovn-lb-noha <k8-ovn-lb-noha>`
- :ref:`k8-nosdn-lb_ceph-noha <k8-nosdn-lb_ceph-noha>`
- :ref:`k8-canal-lb-noha <k8-canal-lb-noha>`
- :ref:`os-nosdn-lxd-ha <os-nosdn-lxd-ha>`
- :ref:`os-nosdn-openbaton-ha <os-nosdn-openbaton-ha>`
- :ref:`k8-multus-lb-noha <k8-multus-lb-noha>`
- :ref:`os-nosdn-ovs-noha <os-nosdn-ovs-noha1>`
- :ref:`os-nosdn-ovs-ha <os-nosdn-ovs-ha1>`
- :ref:`os-nosdn-bar-ha <os-nosdn-bar-ha>`
- :ref:`os-nosdn-bar-noha <os-nosdn-bar-noha>`
- :ref:`k8-nosdn-stor4nfv-ha <k8-nosdn-stor4nfv-ha>`
- :ref:`os-nosdn-ovs_dpdk-noha <os-nosdn-ovs_dpdk-noha>`
- :ref:`os-nosdn-bar-ha <kvmfornfv-os-nosdn-bar-ha>`
- :ref:`os-nosdn-bar-noha <kvmfornfv-os-nosdn-bar-noha>`
- :ref:`os-nosdn-fdio-noha <os-nosdn-fdio-noha>`
- :ref:`os-nosdn-fdio-ha <os-nosdn-fdio-ha>`
- :ref:`os-nosdn-calipso-noha <os-nosdn-calipso-noha>`
- :ref:`os-nosdn-ovs-noha <os-nosdn-ovs-noha>`
- :ref:`os-nosdn-ovs-ha <os-nosdn-ovs-ha>`
- :ref:`os-odl-sfc-ha <os-odl-sfc-ha>`
- :ref:`os-odl-sfc-noha <os-odl-sfc-noha>`
- :ref:`os-odl-bgpvpn-noha <os-odl-bgpvpn-noha>`
- :ref:`os-odl-bgpvpn-ha <os-odl-bgpvpn-ha>`

Installation Procedure
======================

Detailed step by step instructions for working with an installation toolchain and installing
the required scenario are provided by the installation projects. The projects providing installation
support for the OPNFV Euphrates release are: Apex, Compass4nfv, Daisy4NFV, Fuel and JOID.

The instructions for each toolchain can be found in these links:

- :ref:`Apex installation instruction <apex-installation>`
- :ref:`Compass4nfv installation instruction <compass4nfv-installation>`
- :ref:`Daisy installation instruction <daisy-installation>`
- :ref:`Fuel installation instruction <fuel-installation>`
- :ref:`JOID installation instruction <joid-installation>`

OPNFV Test Frameworks
=====================

If you have elected to install the OPNFV platform using the deployment toolchain provided by OPNFV,
your system will have been validated once the installation is completed.
The basic deployment validation only addresses a small part of capabilities in
the platform and you may want to execute more exhaustive tests. Some investigation will be required to
select the right test suites to run on your platform.

Many of the OPNFV test project provide user-guide documentation and installation instructions in :ref:`this document <testing-userguide>`
