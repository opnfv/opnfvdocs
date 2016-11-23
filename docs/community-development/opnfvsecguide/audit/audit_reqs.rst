Requirements references related to OPNFV Audit

------------------
Source information
------------------

http://www.etsi.org/deliver/etsi_gs/NFV-INF/001_099/003/01.01.01_60/gs_NFV-INF003v010101p.pdf
http://www.etsi.org/deliver/etsi_gs/NFV-INF/001_099/004/01.01.01_60/gs_NFV-INF004v010101p.pdf

* ETSI GS NFV-SEC 003 V1.1.1 (2014-12)

  - Network Functions Virtualisation NFV);
  - NFV Security; Security and Trust Guidance
  - NFV-SEC-003_.


.. _NFV-SEC-003: http://www.etsi.org/deliver/etsi_gs/NFV-SEC/001_099/003/01.01.01_60/gs_NFV-SEC003v010101p.pdf
* ETSI GS NFV 004 V1.1.1 (2013-10)

  - Network Functions Virtualisation (NFV);
  - Virtualisation Requirements
  - NFV-SEC-004_.

.. _NFV-SEC-004: http://www.etsi.org/deliver/etsi_gs/NFV/001_099/004/01.01.01_60/gs_NFV004v010101p.pdf

Requirements on Auditing framework
----------------------------------

Audit records shall be maintained within protected binary logs so that the record of
malicious actions cannot be deleted from the logs.

Necessary auditable events
--------------------------

* access control management

  - Adding a user account
  - Modifying user account
  - Deleting a user account
  - login event
  - logout event
  - IP whitelisting update
  - IP blacklisting update

* VNFC Creation

  - The instantiation of a newly-defined VNFC
  - The instantiation of a VNFC with pre-configured state
  - The cloning of an existing VNFC

* VNFC Deletion

  - The deletion of VNFC and of all of its instances (e.g. snapshots, backups, archives, cloned images)

* Software management

  - patching e.g. opreating system, drivers, VM components
  - dynamic updates to the configuration e.g. DNS, DHCP
  - application software updates
  - software component updates

* Data management

  - Root level access to NFVI file system
  - User level access to NFVI file system
  - Secured wipe, disk and memory
  - Verified destruction
  - Certificate revocation

* VNFC Migration

  - VNFC original host identity
  - VNFC target host identity
  - high availability
  - recovery
  - data-in-motion changes

* Other VNFC Operational State Changes

  - Hibernation, sleep, resumption, abort, restore, suspension
  - Power-on and power-off (either physical or virtual)
  - Integrity verification failure, crash and OS compromise

* VNFC Topology Changes

  - Network IP address and VLAN updates
  - Service chaining
  - Failover and disaster recovery

* traffic inspection

  - enabling virtual port mirroring
  - enabling hypervisor introspection
  - enabling in-line traffic inspection
  - application insertion

* initial provisioning of a public/private key pair

  - Self-generation of key pairs for later validation by an external party:

     - Certificate Authority
     - VNFM

  - Provision by trusted party

     - network
     - storage

  - Injection by hypervisor

