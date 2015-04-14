:Authors: Jonas Bjurel (Ericsson)
:Version: 0.1

================================================================
OPNFV Installation instructions for - < Component denomination >
================================================================

Abstract
========

This document describes how to install <Component>, it's dependencies and required system resources.

License
=======
<WORK'S NAME> (c) by <AUTHOR'S NAME>

<WORK'S NAME> is licensed under a Creative Commons Attribution 4.0 Unported License. You should have received a copy of the license along with this. If not, see <http://creativecommons.org/licenses/by/4.0/>.


**Contents**

1   Version history

2   Introduction

3   Preface

4   Hardware requirements

5   Top of the rack (TOR) Configuration requirements

6   OPNFV Software installation and deployment

7   Installation health-check

8   Post installation and deployment actions

9   References

1   Version history
===================

+--------------------+--------------------+--------------------+--------------------+
| **Date**           | **Ver.**           | **Author**         | **Comment**        |
|                    |                    |                    |                    |
+--------------------+--------------------+--------------------+--------------------+
| 2015-04-14         | 0.1.0              | Jonas Bjurel       | First draft        |
|                    |                    |                    |                    |
+--------------------+--------------------+--------------------+--------------------+
|                    | 0.1.1              |                    |                    |
|                    |                    |                    |                    |
+--------------------+--------------------+--------------------+--------------------+
|                    | 1.0                |                    |                    |
|                    |                    |                    |                    |
|                    |                    |                    |                    |
+--------------------+--------------------+--------------------+--------------------+

2   Introduction
================
<INTRODUCTION TO THE SCOPE AND INTENTION OF THIS DOCUMENT AS WELL AS TO THE SYSTEM TO BE INSTALLED>

<EXAMPLE>:

This document describes the supported software and hardware configurations for the Fuel OPNFV reference platform as well as providing guidelines on how to install and
configure such reference system.

Although the available installation options gives a high degree of freedom in how the system is set-up, with what architecture, services and features, etc., not nearly all of those permutations provides a OPNFV compliant reference architecture. Following the guidelines in this document ensures
a result that is OPNFV compliant.

The audience of this document is assumed to have good knowledge in network and Unix/Linux administration.

3   Preface
===========
<DESCRIBE NEEDED PREREQUISITES, PLANNING, ETC.>

<EXAMPLE>:

Before starting the installation of Fuel@OPNFV, some planning must preceed.

First of all, the Fuel@OPNFV .iso image needs to be retrieved, the Latest stable Arno release of Fuel@OPNFV can be found here: <www.opnfv.org/abc/def>

Alternatively, you may build the .iso from source by cloning the opnfv/genesis git repository:
<git clone https://<linux foundation uid>@gerrit.opnf.org/gerrit/genesis>
Check-out the Arno release:
<cd genesis; git checkout arno>
Goto the fuel directory and build the .iso
<cd fuel/build; make all>

Familiarize yourself with the Fuel 6.0.1 version by reading the following documents:
- abc <http://wiki.openstack.org/abc>
- def <http://wiki.openstack.org/def>
- ghi <http://wiki.openstack.org/ghi>

Secondly, a number of deployment specific parameters must be collected, those are:

1.     Provider sub-net and gateway information

2.     Provider VLAN information

3.     Provider DNS addresses

4.     Provider NTP addresses

This information will be needed for the configuration procedures provided in this document.

4   Hardware requirements
=========================
<PROVIDE A LIST OF MINIMUM HARDWARE REQUIREMENTS NEEDED FOR THE INSTALL>

<EXAMPLE>:

Following minimum hardware requirements must be met for installation of Fuel@OPNFV:

+--------------------+----------------------------------------------------+
| **HW Aspect**      | **Requirement**                                    |
|                    |                                                    |
+--------------------+----------------------------------------------------+
| **# of servers**   | Minimum 5 (3 for non redundant deployment)         |
|                    | 1 Fuel deployment master (may be virtualized)      |
|                    | 3(1) Controllers                                   |
|                    | 1 Compute                                          |
+--------------------+----------------------------------------------------+
| **CPU**            | Minimum 1 socket x86_AMD64 Ivy bridge 1.6 GHz      |
|                    |                                                    |
+--------------------+----------------------------------------------------+
| **RAM**            | Minimum 16GB/server (Depending on VNF work load)   |
|                    |                                                    |
+--------------------+----------------------------------------------------+
| **Disk**           | Minimum 256GB 10kRPM spinning disks                |
|                    |                                                    |
+--------------------+----------------------------------------------------+
| **NICs**           | 2(1)x10GE Niantec for Private/Public (Redundant)   |
|                    |                                                    |
|                    | 2(1)x10GE Niantec for SAN (Redundant)              |
|                    |                                                    |
|                    | 2(1)x1GE for admin (PXE) and control (RabitMQ,etc) |
|                    |                                                    |
+--------------------+----------------------------------------------------+

5   Top of the rack (TOR) Configuration requirements
====================================================
<DESCRIBE NEEDED NETWORK TOPOLOGY SETUP IN THE TORs>

<EXAMPLE>:

The switching infrastructure provides connectivity for the OPNFV infra-structure operations as well as for the tenant networks (East/West) and provider connectivity (North/South bound connectivity). The switching connectivity can (but does not need to) be fully redundant, in case it and comprises a redundant 10GE switch pair for “Traffic/Payload/SAN” purposes as well as a 1GE switch pair for “infrastructure control-, management and administration”

The switches are **not** automatically configured from the OPNFV reference platform. All the networks involved in the OPNFV infra-structure as well as the provider networks and the private tenant VLANs needs to be manually configured.

This following sections guides through required black-box switch configurations.

5.1 VLAN considerations and blue-print
--------------------------------------

5.2 IP Address plan considerations and blue-print
-------------------------------------------------

6   OPNFV Software installation and deployment
==============================================
<DESCRIBE THE FULL PROCEDURES FOR THE INSTALLATION OF THE OPNFV COMPONENT INSTALLATION AND DEPLOYMENT>

<EXAMPLE>:

This section describes the installation of the Fuel@OPNFV installation server (Fuel master) as well as the deployment of the full OPNFV reference platform stack across a server cluster.
Etc.

6.1 Install Fuel master
-----------------------

6.2 Create an OPNV (Fuel Environment)
-------------------------------------

6.3 Configure the OPNFV environment
-----------------------------------

6.4 Deploy the OPNFV environment
--------------------------------

7   Installation health-check
============================
<DESCRIBE ANY MEANS TO DO VERIFY THE INTEGRITY AND HEALTHYNESS OF THE INSTALL>

<EXAMPLE>:

Now that the OPNFV environment has been created, and before the post installation configurations is started, perform a system health check from the Fuel GUI:

- Select the “Health check” TAB.
- Select all test-cases
- And click “Run tests”

All test cases except the following should pass:

8  Post installation and deployment actions
============================================
<DESCRIBE ANY POST INSTALLATION ACTIONS/CONFIGURATIONS NEEDED>

<EXAMPLE>:
After the OPNFV deployment is completed, the following manual changes needs to be performed in order for the system to work according OPNFV standards.

**Change host OS password:**
Change the Host OS password by......

9  References
=============
<PROVIDE NEEDED/USEFUL REFERENCES>

<EXAMPLES>:

9.1    OPNFV
-------------

9.2    OpenStack
-----------------

9.3    OpenDaylight
--------------------

9.4    Fuel
------------