.. _opnfv-user-config:

.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. SPDX-License-Identifier: CC-BY-4.0
.. (c) Sofia Wallin (sofia.wallin@ericsson.com) and other contributors

================================
User Guide & Configuration Guide
================================

Abstract
========

OPNFV is a collaborative project aimed at providing a variety of virtualisation
deployments intended to host applications serving the networking and carrier
industries. This document provides guidance and instructions for using platform
features designed to support these applications that are made available in the OPNFV
Iruya release.

This document is not intended to replace or replicate documentation from other
upstream open source projects such as KVM, OpenDaylight, OpenStack, etc., but to highlight the
features and capabilities delivered through the OPNFV project.


Introduction
============

OPNFV provides a suite of scenarios, infrastructure deployment options, which
are able to be installed to host virtualised network functions (VNFs).
This document intends to help users of the platform leverage the features and
capabilities delivered by OPNFV.

OPNFVs' Continuous Integration builds, deploys and tests combinations of virtual
infrastructure components in what are defined as scenarios. A scenario may
include components such as KVM, OpenDaylight, OpenStack, OVS, etc., where each
scenario will include different source components or configurations. Scenarios
are designed to enable specific features and capabilities in the platform that
can be leveraged by the OPNFV user community.


Feature Overview
================

The following links outline the feature deliverables from participating OPNFV
projects in the Iruya release. Each of the participating projects provides
detailed descriptions about the delivered features including use cases,
implementation, and configuration specifics.

The following Configuration Guides and User Guides assume that the reader already has some
knowledge about a given project's specifics and deliverables. These Guides
are intended to be used following the installation with an OPNFV installer
to allow users to deploy and implement feature delivered by OPNFV.

If you are unsure about the specifics of a given project, please refer to the
OPNFV wiki page at http://wiki.opnfv.org for more details.


Feature Configuration Guides
============================

- :ref:`Barometer Configuration Guide <barometer-configguide>`
- :ref:`Doctor Configuration Guide <doctor-configguide>`

Feature User Guides
===================

- :ref:`Barometer User Guide <barometer-userguide>`
- :ref:`Doctor User Guide <doctor-userguide>`
- :ref:`SampleVNF User Guide <samplevnf-userguide>`
- :ref:`Stor4NFV User Guide <stor4nfv:stor4nfv-userguide>`
