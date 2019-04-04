#!/bin/bash

set -ex
set -o nounset


if [ ! -d /elasticsearch ] ; then
  mkdir /elasticsearch
fi
if [ ! -d $ES_CONF ] ; then
  mkdir -p $ES_CONF
fi
chmod -R og+w $ES_CONF ${ES_HOME} ${HOME} /elasticsearch
chmod -R o+rx /etc/elasticsearch
