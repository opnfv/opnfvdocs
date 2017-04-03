.. _opnfv-user-config:

.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. SPDX-License-Identifier: CC-BY-4.0
.. (c) Sofia Wallin (sofia.wallin@ericssion.com)

======================================
OPNFV User Guide & Configuration Guide
======================================

Abstract
========

OPNFV is a collaborative project aimed at providing a variety of virtualisation
deployments intended to host applications serving the networking and carrier
industries. This document provides guidance and instructions for using platform
features designed to support these applications, made available in the OPNFV
Danube release.

This document is not intended to replace or replicate documentation from other
upstream open source projects such as KVM, OpenDaylight, or OpenStack, but to highlight the
features and capabilities delivered through the OPNFV project.


Introduction
============

OPNFV provides a suite of scenarios, infrastructure deployment options, which
are able to be installed to host virtualised network functions (VNFs).
This Guide intends to help users of the platform leverage the features and
capabilities delivered by the OPNFV project.

OPNFVs' Continuous Integration builds, deploys and tests combinations of virtual
infrastructure components in what are defined as scenarios. A scenario may
include components such as KVM, OpenDaylight, OpenStack, OVS, etc., where each
scenario will include different source components or configurations. Scenarios
are designed to enable specific features and capabilities in the platform that
can be leveraged by the OPNFV User community.


Feature Overview
================

The following links outline the feature deliverables from participating OPNFV
projects in the Danube release. Each of the participating projects provides
detailed descriptions about the delivered features including use cases,
implementation and configuration specifics.

The following Configuration Guides and User Guides assume that the reader already has some
information about a given project's specifics and deliverables. These Guides
are intended to be used following the installation with an OPNFV installer
to allow users to deploy and implement feature delivered by OPNFV.

If you are unsure about the specifics of a given project, please refer to the
OPNFV wiki page at http://wiki.opnfv.org, for more details.


Feature Configuration Guides
============================

- :ref:`Copper Configuration Guide <copper-configguide>`
- :ref:`Doctor Configuration Guide <doctor-configguide>`
- :ref:`IPv6 Configuration Guide <ipv6-configguide>`
- :ref:`KVMforNFV Configuration Guide <kvmfornfv-configguide>`
- :ref:`Netready Configuration Guide <netready-configguide>`
- :ref:`Parser Configuration Guide <parser-configguide>`
- :ref:`Promise Configuration Guide <promise-configguide>`
- :ref:`SFC Configuration Guide <sfc-configguide>`


Feature User Guides
===================

- :ref:`Copper User Guide <copper-userguide>`
- :ref:`Doctor User Guide <doctor-userguide>`
- :ref:`Domino User Guide <domino-userguide>`
- :ref:`IPv6 User Guide <ipv6-userguide>`
- :ref:`KVMforNFV User Guide <kvmfornfv-userguide>`
- :ref:`Netready User Guide <netready-userguide>`
- :ref:`Parser User Guide <parser-userguide>`
- :ref:`Promise User Guide <promise-userguide>`
- :ref:`SFC User Guide <sfc-userguide>`

