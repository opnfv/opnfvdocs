==================
OPNFV-GCE-MACHINES
==================

code-block:: yaml

  hosts:
    gce-opnfv-jenkins-2:
      location: us-central1-a
      flavor: n1-standard-4
      purpose: 'main jenkins server'
      network: gce-wl
    gce-opnfv-jenkins-dev-1:
      location: us-central1-a
      flavor: n1-standard-2
      purpose: 'main sandbox server'
      network: gce-wl
    gce-opnfv-jenkins-dev-build-1:
      location: us-central1-a
      flavor: n1-standard-1
      purpose: 'static centos builder'
      network: opnfv-sandbox
    gce-opnfv-jenkins-dev-build-2-ubuntu:
      location: us-central1-a
      flavor: n1-standard-1
      purpose: 'static ubuntu builder'
      network: opnfv-sandbox
    gce-opnfv-nginx-1:
      location: us-central1-a
      flavor: n1-highcpu-2
      purpose: 'main load balancer'
      network: gce-wl
    gce-wl-openvpn:
      location: us-central1-a
      flavor: g1-small
      purpose: 'vpn bridge'
      network: gce-wl
    gke-cluster-1-bamboo-gke-default-pool-76eef41f-dvfd:
      location: us-central1-a
      flavor: n1-standard-1
      purpose: 'kubernetes cluster'
      contact: 'chu.wenjing@gmail.com'
    gke-cluster-1-bamboo-gke-default-pool-76eef41f-fnt7:
      location: us-central1-a
      flavor: n1-standard-1
      purpose: 'kubernetes cluster'
      contact: 'chu.wenjing@gmail.com'
    gke-cluster-1-bamboo-gke-default-pool-76eef41f-m798:
      location: us-central1-a
      flavor: n1-standard-1
      purpose: 'kubernetes cluster'
      contact: 'chu.wenjing@gmail.com'
    gke-cluster-1-bamboo-gke-default-pool-76eef41f-w5h8:
      location: us-central1-a
      flavor: n1-standard-1
      purpose: 'kubernetes cluster'
      contact: 'chu.wenjing@gmail.com'
    gke-cluster-1-bamboo-gke-default-pool-76eef41f-wjs5:
      location: us-central1-a
      flavor: n1-standard-1
      purpose: 'kubernetes cluster'
      contact: 'chu.wenjing@gmail.com'
    gke-cluster-1-bamboo-gke-default-pool-76eef41f-znj9:
      location: us-central1-a
      flavor: n1-standard-1
      purpose: 'kubernetes cluster'
      contact: 'chu.wenjing@gmail.com'
    gce-opnfv-cvp:
      location: us-central1-c
      flavor: n1-standard-2
      purpose: 'verified.opnfv.org'
      contact: 'eddie.arrage@huawei.com'
      network: opnfv-sandbox
    gce-opnfv-discourse-ash-1:
      location: us-central1-f
      flavor: n1-standard-1
      purpose: 'techdiscuss.opnfv.org'
      contact: 'ashleeyoung@huawei.com'
      network: opnfv-sandbox
    gce-opnfv-influxdb-fbrockners:
      location: us-central1-f
      flavor: n1-standard-1
      purpose: 'testresults.opnfv.org database server'
      contact: 'feng.xiaowei@zte.com.cn'
      network: opnfv-sandbox
    gce-opnfv-pharos-dashboard:
      location: us-central1-f
      flavor: n1-standard-1
      purpose: 'labs.opnfv.org'
      network: opnfv-sandbox
    gce-opnfv-plugfest-influxdb-fbrockners-1:
      location: us-central1-f
      flavor: n1-standard-1
      purpose: 'Plugfest only testresults database server'
      contact: 'feng.xiaowei@zte.com.cn'
      network: opnfv-sandbox
    gce-opnfv-plugfest-sandbox-fbrockners-1:
      location: us-central1-f
      flavor: n1-standard-2
      purpose: 'Plugfest only testresults server'
      contact: 'feng.xiaowei@zte.com.cn'
      network: opnfv-sandbox
    gce-opnfv-sandbox-fbrockners:
      location: us-central1-f
      flavor: n1-standard-2
      purpose: 'testresults.opnfv.org'
      contact: 'feng.xiaowei@zte.com.cn'
      network: opnfv-sandbox
    gce-opnfv-vnf-opnfv-org:
      location: us-central1-f
      flavor: n1-standard-1
      purpose: 'vnf.opnfv.org'
      contact: 'shailrishabh@gmail.com'
      network: opnfv-sandbox
    zuul-test-machine:
      location: us-central1-f
      flavor: n1-standard-4
      purpose: 'Technology test macine'
      contact: 'fatih.degirmenci@ericsson.com'
      network: opnfv-sandbox
    gce-korg-lkml-public-inbox:
      location: us-west1-b
      flavor: n1-standard-4
      purpose: 'This is not an OPNFV resource'
