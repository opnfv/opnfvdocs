Trusted Compute
---------------

Trusted compute is centered on insuring the complete lifecycle of a VM, and
the VM's underlying infrastructure is of a 'trustful' state.

**Trusted computing in a cloud environment**

To ensure overall security in an OPNFV deployment, both the launch and the
operation of virtualized resources need to be secure. To build a trusted
computing in a cloud environment the following core features are essential:

* boot integrity - the hardware platform can guarantee a trustworthy RoT for the overall cloud environment
* secure management of VMs – to secure the launch and migration of VMs in the cloud environment

In this section we will cover some aspects of what is considered compute
security, such as secure/trusted boot, although of course these can be
extended to other actors such as neutron networking nodes.

Secure Boot
###########

Secure boot, a UEFI-based feature that has become controversial lately,
ensures that nodes in an OPNFV deployment boot only software that is trusted
by the admin or end user.

In order to understand the secure boot procedure, we need to explain the related technology
and specification.

**Unified Extensible Firmware Interface (UEFI)**

UEFI is a specification intended to be the replacement and improvement on the
old BIOS (Basic Input/Output System).

One UEFI-based feature that has become controversial lately is the secure boot feature.

The UEFI specification is a standard that’s handled by a non-profit organization
with representatives of Intel, AMD, Microsoft, Apple, Dell, HP, IBM and others,
called the Unified EFI Forum.

UEFI supports 32 and 64 bit processors and can be used with Itanium, x86,
x64 and ARM processors.

**Trusted Execution Environment (TEE) vs Trusted Platform Mobile (TPM)**

Two main components of platform security:

* Trusted Execution Environment
* Trusted Platform Module

These are not designed as a replacement of the other. TEE is the bulletproof
safe, while TPM is the 128-digit combination lock for the safe. Both are
needed to ensure the safe is protected.

TPM is a dependency of TEE but not the other way around.

The TPM is where TEE will store the measurements - hash of components - of the platform.

If TEE is not supported by a platform but a TPM is still present you still have
all these features:

* Integrity measurement – securely measure the platform's components (hashes stored within the TPM)

* Authenticated boot – a process by which a platform's state (the sum of its
  components) is reliably measured and stored

* SRTM - Static Root of Trust for Measurements

* Sealed Storage - encrypt data based on the current state of the platform
  or in other words, what has been measured (the PCR hash values stored in the
  TPM) - seal operation

* Attestation - securely report to other parties the state of the platform


Trusted Compute Pools
#####################

**Trusted Boot**

Trusted boot (tboot) is an open source, pre- kernel/VMM module that uses
Intel(R) Trusted Execution Technology (Intel(R) TXT) to perform a measured
and verified launch of an OS kernel/VMM. The root of trust is in the hardware
and a TPM is required. Compute nodes in an OPNFV deployment boot with Intel
TXT technology enabled.

Read more about `Trusted Boot <http://www.trustedcomputinggroup.org/resources/trusted_boot>`_ and
`Trusted Computing. <http://www.trustedcomputinggroup.org/trusted_computing>`_

**Trusted Execution Environments (TEE)**

The Trusted Execution Environment is an isolated execution environment which
provides higher level of security such as isolated execution, integrity of
Trusted Applications along with confidentiality of their assets.

**Goals of a Trusted Execution Environments:**

* Isolated Execution
* Secure Storage
* Remote Attestation
* Secure Provisioning
* Trusted Path

**TEE platforms/implementations**

* Intel’s TXT (Trusted Execution Technology)
* AMD Secure Execution Environment
* ARM TrustZone

All three of these TEE implementations provide a virtualized Execution
Environment for the secure OS and applications.

To switch between the secure world and the normal world, Intel provides SMX
Instructions, while ARM uses SMC. Programmatically, they all achieve very
similar results.

Read more about Trusted Execution Environments `here. <http://www.openvirtualization.org/open-source-arm-trustzone.html>`_

`NIST SP800-147 <http://csrc.nist.gov/publications/nistpubs/800-147/NIST-SP800-147-April2011.pdf>`_
, is a  guidelines for firmware security, to ensure that the firmware itself is secure.

Read more about "Trusted compute pools", in the
`OpenStack Security Guide. <http://docs.openstack.org/admin-guide-cloud/compute-security.html>`_

