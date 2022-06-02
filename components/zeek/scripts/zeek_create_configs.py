#!/usr/bin/env python

import shutil
import os

from string import Template

ZEEK_VERSION = os.environ.get("ZEEK_VER")

def get_environment():
    """
    Read environment variables meant for configuration

    :return: dict
    """

    infrastructure = {}
    infrastructure.update(LOGGER_HOST = os.environ.get('LOGGER_HOST') or "localhost")
    infrastructure.update(MANAGER_HOST = os.environ.get('MANAGER_HOST') or "localhost")
    infrastructure.update(PROXY_HOST = os.environ.get('PROXY_HOST') or "localhost")
    # Comma separated list or single item expected
    infrastructure.update(WORKER_HOSTS = os.environ.get('WORKER_HOSTS') or "localhost")
    infrastructure.update(WORKER_INT = os.environ.get('WORKER_INTERFACES') or "eth0")
    infrastructure.update(NETWORKS = os.environ.get('NETWORKS') or "")
    return infrastructure

def create_cluster_configuration(infrastructure):
    """
    Create the cluster configuration (node.cfg) and write to file

    :param infrastructure: dict
    :return:
    """

    workers = infrastructure.get("WORKER_HOSTS").split(",")
    worker_ints = infrastructure.get("WORKER_INT").split(",")

    worker_config = ""
    for indx, value in enumerate(workers):
        with open('config/worker.cfg') as wc:
            try:
              int = worker_ints[indx]
            except IndexError:
              int = worker_ints[0]
            worker_template = Template(wc.read())
            worker_config += worker_template.substitute(WORKER_INDEX=indx, WORKER_HOST=value, WORKER_INTERFACE=int)

    with open('config/node.cfg') as cc:
        node_template = Template(cc.read())

    cc_outfile = "/usr/local/zeek-%s/node.cfg".format(ZEEK_VERSION)
    cc_outfile_handle = open(cc_outfile, "w")
    cc_outfile_handle.write(node_template.substitute(**infrastructure, WORKERS=worker_config))
    cc_outfile_handle.close()

def create_networks_configuration(infrastructure):
    """

    :param infrastructure:
    :return:
    """
    home_nets = ""
    if infrastructure.get("NETWORKS"):
      home_nets = infrastructure.get("NETWORKS").split(",")

    nets = ""

    for net in home_nets:
        nets += net + "\n"

    with open('config/networks.cfg') as nwc:
        network_template = Template(nwc.read)
        network_config = network_template.substitute(NETWORKS=nets)

    nwc_outfile = "/usr/local/zeek-%s/networks.cfg".format(ZEEK_VERSION)
    nwc_outfile_handle = open(nwc_outfile, "w")
    nwc_outfile_handle.write(network_config)
    nwc_outfile_handle.close()


def main():
  # Prioritize configuration in a volume
  if os.path.exists("/data/zeek/etc/"):
    shutil.copytree("/data/zeek/etc/", "/usr/local/zeek-%s".format(ZEEK_VERSION))
  # Check for needed configuration - if it does not exist, create dummy config
  else:
    infrastructure = get_environment()
    create_cluster_configuration(infrastructure)
    create_networks_configuration(infrastructure)

if __name__ == "__main__":
    main()
