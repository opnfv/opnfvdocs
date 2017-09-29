.. _overview:

.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. SPDX-License-Identifier: CC-BY-4.0
.. (c) Open Platform for NFV Project, Inc. and its contributors

=======================
Infrastructure Overview
=======================

OPNFV develops, operates, and maintains infrastructure which is used by the OPNFV
Community for development, integration, and testing purposes. `OPNFV
Infrastructure Working Group (Infra WG) <https://wiki.opnfv.org/display/INF>`_
oversees the OPNFV Infrastructure, ensures it is kept in a state which serves
the community in best possible way and always up to date.

Infra WG is working towards a model whereby we have a seamless pipeline
for handing resource requests from the OPNFV community for both development and
Continuous Integration perspectives. Automation of requests and integration to
existing automation tools is a primary driver in reaching this model. In the
Infra WG, we imagine a model where the Infrastructure Requirements that are
specified by a Feature, Installer or otherrelevant projects within OPNFV are
requested, provisioned, used, reported on and subsequently torn down with no (or
minimal) user intervention at the physical/infrastructure level.

The details of what is provided as part of the infrastructure can be seen in
following chapters.

Hardware Infrastructure
-----------------------

TBD

Software Infrastructure
-----------------------

.. toctree::
   :maxdepth: 1

   ../submodules/releng/docs/sofware-infrastructure-index

Continuous Integration (CI)
---------------------------

.. toctree::
   :maxdepth: 1

   ../submodules/releng/docs/ci-index

Cross Community Continuous Integration (XCI)
--------------------------------------------

.. toctree::
   :maxdepth: 1

   ../submodules/releng/docs/xci-index
