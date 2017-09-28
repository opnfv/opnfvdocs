.. _opnfv-overview:

.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. SPDX-License-Identifier: CC-BY-4.0
.. (c) Open Platform for NFV Project, Inc. and its contributors

=======================
Infrastructure overview
=======================

Introduction
============

TBD


Power Consumption Monitoring Framework
======================================

Introduction
------------
Power consumption is a key driver for NFV.
As an end user is interested to know which application is good/bad regarding
power consumption and explains why he/she has to plug his/her smartphone every
day, we would be interested to know which VNF is power consuming.

Power consumption is hard to evaluate empirically. It is however possible to
collect information and leverage Pharos federation to try to detect some
profiles/footprints.
In fact thanks to CI, we know that we are running a known/deterministic list of
cases. The idea is to correlate this knowledge with the power consumption to try
at the end to find statistical biais.


High Level Architecture
-----------------------

The energy recorder high level architecture may be described as follows:

.. figure:: ../../images/energyrecorder.png
   :align: center
   :alt: Energy recorder high level architecture

The energy monitoring system in based on 3 software components:

   * Power info collector: poll server to collect instantaneous power consumption information
   * Energy recording API + influxdb: On oone leg receive servers consumption and on the other, scenarios notfication. It then able to establish te correlation between consumption and scenario and stores it into a time-series database (influxdb)
   * Python SDK: A Python SDK using decorator to send notification to Energy recording API from testcases scenarios

Power Info Collector
--------------------
It collects instantaneous power consumption information and send it to Event
API in charge of data storing.
The collector use different connector to read the power consumption on remote
servers:

  * IPMI: this is the basic method and is manufacturer dependent.
  Depending on manufacturer, refreshing delay may vary (generally for 10 to 30 sec.)
  * RedFish: redfish is an industry RESTFUL API for hardware managment.
  Unfortunatly it is not yet supported by many suppliers.
  * ILO: HP RESTFULL API:
  This connector support as well 2.1 as 2.4 version of HP-ILO

IPMI is supported by at least:

  * HP
  * IBM
  * Dell
  * Nokia
  * Advantech
  * Lenovo
  * Huawei

Redfish API has been successfully tested on:

  * HP
  * Dell
  * Huawei (E9000 class servers used in OPNFV Community Labs are  IPMI 2.0 compliant and use Redfish login Interface through Browsers supporting JRE1.7/1.8)

Several test campaigns done with physical Wattmeter showed that IPMI results
were notvery accurate but RedFish were. So if Redfish is available, it is
highly recommended to use it.

Installation
^^^^^^^^^^^^

To run the server power consumption collector agent, you need to deploy a
docker container locally on your infrastructure.

This container requires:

  * Connectivy on the LAN where server administration services (ILO, eDrac, IPMI......) are configured and IP access to the POD's servers
  * Outgoing HTTP access to the Event API (internet)

Build the image by typing::

  curl -s https://raw.githubusercontent.com/bherard/energyrecorder/master/docker/server-collector.dockerfile|docker build -t energyrecorder/collector -

Create local folder on your host for logs and config files::

  mkdir -p /etc/energyrecorder
  mkdir -p /var/log/energyrecorder

In /etc/energyrecorder create a configuration for logging in a file named
collector-logging.conf::

  curl -s https://raw.githubusercontent.com/bherard/energyrecorder/master/server-collector/conf/collector-logging.conf.sample > /etc/energyrecorder/collector-logging.conf

Check configuration for this file (folders, log levels.....)
In /etc/energyrecorder create a configuration for the collector in a file named
collector-settings.yaml::

  curl -s https://raw.githubusercontent.com/bherard/energyrecorder/master/server-collector/conf/collector-settings.yaml.sample > /etc/energyrecorder/collector-settings.yaml

Define the "PODS" section and their "servers" section according to the
environment to monitor.
Note: The "environment" key should correspond to the pod name, as defined in
the "NODE_NAME" environment variable by CI when running.

**IMPORTANT NOTE**: To apply a new configuration, you need to kill the running
container an start a new one (see below)

Run
^^^

To run the container, you have to map folder located on the host to folders in
the container (config, logs)::

  docker run -d --name energy-collector --restart=always -v /etc/energyrecorder:/usr/local/energyrecorder/server-collector/conf -v /var/log/energyrecorder:/var/log/energyrecorder energyrecorder/collector


Energy Recording API
--------------------
An event API to insert contextual information when monitoring energy (e.g.
start Functest, start Tempest, destroy VM, ..)
It is associated with an influxDB to store the power consumption measures
It is hosted on a shared environment with the folling access points:

+------------------------------------+----------------------------------------+
|   Component                        |    Connectivity                        |
+====================================+========================================+
| Energy recording API documentation | http://energy.opnfv.fr/resources/doc/  |
+------------------------------------+----------------------------------------+
| influxDB (data)                    | http://energy.opnfv.fr:8086            |
+------------------------------------+----------------------------------------+

In you need, you can also host your own version of the Energy recording API
(in such case, the Python SDK may requires a settings update)
If you plan to use the default shared API, following steps are not required.

Image creation
^^^^^^^^^^^^^^
First, you need to buid an image::

  curl -s https://raw.githubusercontent.com/bherard/energyrecorder/master/docker/recording-api.dockerfile|docker build -t energyrecorder/api -

Setup
^^^^^
Create local folder on your host for logs and config files::

  mkdir -p /etc/energyrecorder
  mkdir -p /var/log/energyrecorder
  mkdir -p /var/lib/influxdb

In /etc/energyrecorder create a configuration for logging in a file named
webapp-logging.conf::

  curl -s https://raw.githubusercontent.com/bherard/energyrecorder/master/recording-api/conf/webapp-logging.conf.sample > /etc/energyrecorder/webapp-logging.conf

Check configuration for this file (folders, log levels.....)

In /etc/energyrecorder create a configuration for the collector in a file
named webapp-settings.yaml::

  curl -s https://raw.githubusercontent.com/bherard/energyrecorder/master/recording-api/conf/webapp-settings.yaml.sample > /etc/energyrecorder/webapp-settings.yaml

Normaly included configuration is ready to use except username/passwer for
influx (see run-container.sh bellow). Use here the admin user.

**IMPORTANT NOTE**: To apply a new configuration, you need to kill the running
container an start a new one (see bellow)

Run
^^^
To run the container, you have to map folder located on the host to folders in
the container (config, logs)::

  docker run -d --name energyrecorder-api -p 8086:8086 -p 8888:8888  -v /etc/energyrecorder:/usr/local/energyrecorder/web.py/conf -v /var/log/energyrecorder/:/var/log/energyrecorder -v /var/lib/influxdb:/var/lib/influxdb energyrecorder/webapp admin-influx-user-name admin-password readonly-influx-user-name user-password

with

+---------------------------+--------------------------------------------+
| Parameter name            | Description                                |
+===========================+============================================+
| admin-influx-user-name    | Influx user with admin grants to create    |
|---------------------------+--------------------------------------------+
| admin-password            | Influx password to set to admin user       |
|---------------------------+--------------------------------------------+
| readonly-influx-user-name | Influx user with readonly grants to create |
|---------------------------+--------------------------------------------+
| user-password             | Influx password to set to readonly user    |
+---------------------------+--------------------------------------------+

**NOTE**: Local folder /var/lib/influxdb is the location web influx data are
stored. You may used anything else at your convience. Just remember to define
this mapping properly when running the container.

Power consumption Python SDK
----------------------------
a Python SDK - almost not intrusive, based on python decorator to trigger call
to the event API.

It is currently hosted in Functest repo but if other projects adopt it, a
dedicated project could be created and/or it could be hosted in Releng.

How to use the SDK
^^^^^^^^^^^^^^^^^^

import the energy library::

  import functest.energy.energy as energy

Notify that you want power recording in your testcase::

  @energy.enable_recording
  def run(self):
      self.do_some_stuff1()
      self.do_some_stuff2()

If you want to register additional steps during the scenarios you can to it in
2 diffferent way:

  * notify step on method defintion::
    @energy.set_step("step1")
    def do_some_stuff1(self):
    ...
    @energy.set_step("step2")
    def do_some_stuff2(self):
  * directly from code::
    @energy.enable_recording
    def run(self):
      Energy.set_step("step1")
      self.do_some_stuff1()
      ...
      Energy.set_step("step2")
      self.do_some_stuff2()

SDK Setting
^^^^^^^^^^^
Settings delivered in the project git are ready to use and assume that you will
use the sahre energy recording API.
If you want to use an other instance, you have to update the key
"energy_recorder.api_url" in <FUNCTEST>/functest/ci/config_functest.yaml" by
setting the proper hostname/IP

Results
-------
Here is an example of result comming from LF POD2. This sequence represents
several CI runs in a raw. (0 power corresponds to hard reboot of the servers)

You may connect http://energy.opnfv.fr:3000 for more results (ask for
credentials to infra team).

.. figure:: ../../images/energy_LF2.png
   :align: center
   :alt: Energy monitoring of LF POD2
