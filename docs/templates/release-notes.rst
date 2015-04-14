<<<<<<< HEAD
:Authors:
    Jonas Bjurel (Ericsson)
    :Version: 0.1

==================================================================
Release Note for OPNFV "Arno release" - < Component denomination >
==================================================================
=======
:Authors: Jonas Bjurel (Ericsson)
:Version: 0.1

======================================================================
OPNFV Release Note for "Arno-SRx release" - < Component denomination >
======================================================================
>>>>>>> 1212ba5... First version of release-notes template.rst

Abstract
========

<<<<<<< HEAD
This document describes delivery revision information from the CEE 15A
project.

Licence
=======
This document provides the release notes for <RELEASE> of <COMPONENT>.

License
>>>>>>> 1212ba5... First version of release-notes template.rst
=======
<WORK'S NAME> (c) by <AUTHOR'S NAME>

<WORK'S NAME> is licensed under a Creative Commons Attribution 4.0 Unported License. You should have received a copy of the license along with this. If not, see <http://creativecommons.org/licenses/by/4.0/>.


**Contents**

1  Version History

2  Important notes

3  Summary

4  Delivery Data

5 Known Limitations, Issues and Workarounds

6 Test Result

7 References

1   Version history
===================

+--------------------+--------------------+--------------------+--------------------+
| **Date**           | **Ver.**           | **Author**         | **Comment**        |
|                    |                    |                    |                    |
+--------------------+--------------------+--------------------+--------------------+
<<<<<<< HEAD
| 2015-04-14         | 0.1.0              | UABJONB            | First draft        |
=======
| 2015-04-14         | 0.1.0              | Jonas Bjurel       | First draft        |
>>>>>>> 1212ba5... First version of release-notes template.rst
|                    |                    |                    |                    |
+--------------------+--------------------+--------------------+--------------------+
|                    | 0.1.1              |                    |                    |
|                    |                    |                    |                    |
+--------------------+--------------------+--------------------+--------------------+
|                    | 1.0                |                    |                    |
|                    |                    |                    |                    |
<<<<<<< HEAD
|                    |                    |                    |                    |
=======
>>>>>>> 1212ba5... First version of release-notes template.rst
+--------------------+--------------------+--------------------+--------------------+

2   Important notes
===================

<<<<<<< HEAD
<STATE IMPORTANT NOTES/DEVIATIONS SINCE PREVIOUS ITTERATIVE RELEASE AND OTHER IMPORTANT NOTES FOR THIS RELEASE>
=======
<STATE IMPORTANT NOTES/DEVIATIONS SINCE PREVIOUS ITERATIVE RELEASE AND OTHER IMPORTANT NOTES FOR THIS RELEASE>
>>>>>>> 1212ba5... First version of release-notes template.rst

<EXAMPLE>:

**Attention:** Please be aware that since LSV3 a pre-deploy script must be ran on the Fuel master – see the OPNFV@Fuel SW installation instructions

3   Summary
===========

<SUMMARIZE THE RELEASE - THE CONTENT - AND OTHER IMPORTANT HIGH LEVEL PROPERTIES>

<EXAMPLE>:

<<<<<<< HEAD
Arno Fuel@OPNFV is based the OpenStack Fuel upstrem project version 6.0.1, but adds OPNFV unique components such as OpenDaylight version: Helium as well as other OPNFV unique configurations......

4   Release Data
================
<STATE RELEVANT RELEASE DATA/RECCORDS>
=======
Arno Fuel@OPNFV is based the OpenStack Fuel upstream project version 6.0.1, but adds OPNFV unique components such as OpenDaylight version: Helium as well as other OPNFV unique configurations......

4   Release Data
================
<STATE RELEVANT RELEASE DATA/RECORDS>
>>>>>>> 1212ba5... First version of release-notes template.rst

<EXAMPLE>:

+--------------------------------------+--------------------------------------+
| **Project**                          | E.g. Arno/genesis/fuel@opnfv         |
|                                      |                                      |
+--------------------------------------+--------------------------------------+
<<<<<<< HEAD
| **Repo/commitID**                    | E.g. genesis/adf634a0d4.....         |
=======
| **Repo/commit-ID**                    | E.g. genesis/adf634a0d4.....         |
>>>>>>> 1212ba5... First version of release-notes template.rst
|                                      |                                      |
+--------------------------------------+--------------------------------------+
| **Release designation**              | E.g. Arno RC2                        |
|                                      |                                      |
+--------------------------------------+--------------------------------------+
| **Release date**                     | E.g. 2015-04-16                      |
|                                      |                                      |
+--------------------------------------+--------------------------------------+
| **Purpose of the delivery**          | E.g. OPNFV Internal quality assurance|
|                                      |                                      |
+--------------------------------------+--------------------------------------+

4.1 Version change
------------------

4.1.1   Module version changes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<STATE WHAT UPSTREAM, - AS WELL AS OPNFV MODULE VERSIONS HAVE CHANGED>

<EXAMPLE>:

- Fuel have changed from 5.1 to 6.0.1

- OpenDaylight has changed from Helium-SR1 to Helium-SR2

4.1.2   Document version changes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<STATE WHAT RELATED DOCUMENTS THAT CHANGES WITH THIS RELEASE>

<EXAMPLE>:

<<<<<<< HEAD
- The Fuel@OPNFV installation guide version has cheanged from version 0.1 to to 0.2

=======
- The Fuel@OPNFV installation guide version has changed from version 0.1 to to 0.2
>>>>>>> 1212ba5... First version of release-notes template.rst

4.2 Reason for version
----------------------
4.2.1 Feature additions
~~~~~~~~~~~~~~~~~~~~~~~
<STATE ADDED FEATURES BY REFERENCE TO JIRA>

<EXAMPLE>:

**JIRA BACK-LOG:**

+--------------------------------------+--------------------------------------+
| **JIRA REFERENCE**                   | **SLOGAN**                           |
|                                      |                                      |
+--------------------------------------+--------------------------------------+
<<<<<<< HEAD
| BGS-123                              | ADD OpenDaylight ML2 integration     |
|                                      |                                      |
+--------------------------------------+--------------------------------------+
| BGS-456                              | Add autodeployment of Fuel@OPNFV     |
=======
| BGS-123                              | ADD OpenDaylight ml2 integration     |
|                                      |                                      |
+--------------------------------------+--------------------------------------+
| BGS-456                              | Add auto-deployment of Fuel@OPNFV    |
>>>>>>> 1212ba5... First version of release-notes template.rst
|                                      |                                      |
+--------------------------------------+--------------------------------------+

4.2.2 Bug corrections
~~~~~~~~~~~~~~~~~~~~~

**JIRA TICKETS:**

+--------------------------------------+--------------------------------------+
| **JIRA REFERENCE**                   | **SLOGAN**                           |
|                                      |                                      |
+--------------------------------------+--------------------------------------+
| BGS-888                              | Fuel doesn't deploy                  |
|                                      |                                      |
+--------------------------------------+--------------------------------------+
| BGS-999                              | Floating IP doesn't work             |
|                                      |                                      |
+--------------------------------------+--------------------------------------+

<<<<<<< HEAD

=======
>>>>>>> 1212ba5... First version of release-notes template.rst
4.3 Deliverables
----------------

4.3.1   Software deliverables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

<<<<<<< HEAD
<STATE WHAT SOFTWARE DELIVERABLES THAT ARE RELATED TO THIS VERSION, AND WHERE THOSE CAN BE RETREIVED>
=======
<STATE WHAT SOFTWARE DELIVERABLES THAT ARE RELATED TO THIS VERSION, AND WHERE THOSE CAN BE RETRIEVED>
>>>>>>> 1212ba5... First version of release-notes template.rst

<EXAMPLE>:

4.3.2   Documentation deliverables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

<<<<<<< HEAD
<STATE WHAT DOCUMENTATION DELIVERABLES THAT ARE RELATED TO THIS VERSION, AND WHERE THOSE CAN BE RETREIVED>
=======
<STATE WHAT DOCUMENTATION DELIVERABLES THAT ARE RELATED TO THIS VERSION, AND WHERE THOSE CAN BE RETRIEVED>
>>>>>>> 1212ba5... First version of release-notes template.rst

<EXAMPLE>:

5  Known Limitations, Issues and Workarounds
============================================

5.1    System Limitations
-------------------------
<<<<<<< HEAD
<STATE ALL RELLEVANT SYSTEM LIMITATIONS>
=======
<STATE ALL RELEVANT SYSTEM LIMITATIONS>
>>>>>>> 1212ba5... First version of release-notes template.rst

<EXAMPLE>:

**Max number of blades:**   1 Fuel master, 3 Controllers, 20 Compute blades

**Min number of blades:**   1 Fuel master, 1 Controller, 1 Compute blade

**Storage:**    Ceph is the only supported storage configuration.

<<<<<<< HEAD
**Max number of networks:**   3800 (Needs special switch config)
=======
**Max number of networks:**   3800 (Needs special switch config.)
>>>>>>> 1212ba5... First version of release-notes template.rst

**L3Agent:**   L3 agent and floating IPs is not supported.

5.2    Known issues
-------------------
<STATE ALL KNOWN ISSUES WITH JIRA REFERENCE>

<EXAMPLE>:

**JIRA TICKETS:**

+--------------------------------------+--------------------------------------+
| **JIRA REFERENCE**                   | **SLOGAN**                           |
|                                      |                                      |
+--------------------------------------+--------------------------------------+
| BGS-987                              | Nova-compute process does            |
|                                      | not re-spawn when killed             |
|                                      |                                      |
+--------------------------------------+--------------------------------------+
| BGS-654                              | MOS 5.1 : neutron net-list returns   |
|                                      | "400 Bad request"                    |
|                                      |                                      |
+--------------------------------------+--------------------------------------+

5.3    Workarounds
------------------

<STATE ALL KNOWN WORKAROUNDS TO THE ISSUES STATED ABOVE>

<EXAMPLE>:

- In case the contact with a compute is lost - restart the compute host
- In case the disk is full on a controller - delete all files in /tmp

6  Test Result
==============
<STATE THE QA COVERAGE AND RESULTS>

<EXAMPLE>:

Fuel@OPNFV Arno RC2 has undergone QA test runs with the following results:

+--------------------------------------+--------------------------------------+
| **TEST-SUITE**                       | **Results:**                         |
|                                      |                                      |
+--------------------------------------+--------------------------------------+
| Tempest test suite 123               | Following tests failed:              |
|                                      |                                      |
|                                      | 1. Image resizing....                |
|                                      |                                      |
|                                      | 2. Heat deploy....                   |
+--------------------------------------+--------------------------------------+
<<<<<<< HEAD
| Robot sest suite 456                 | Following tests failed:              |
=======
| Robot test suite 456                 | Following tests failed:              |
>>>>>>> 1212ba5... First version of release-notes template.rst
|                                      |                                      |
|                                      | 1.......                             |
|                                      |                                      |
|                                      | 2.......                             |
+--------------------------------------+--------------------------------------+

7  References
=============
<STATE RELEVANT REFERENCES FOR THIS RELEASE/VERSION>

<EXAMPLE>:

For more information on the OPNFV Arno release, please see:
<<<<<<< HEAD
http://wiki.opnfv.org/release/arno
=======
http://wiki.opnfv.org/release/arno
>>>>>>> 1212ba5... First version of release-notes template.rst
