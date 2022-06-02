#!/bin/sh

ETC_PATH=/opt/zeek/etc/
LOCAL_PATH="/opt/pocketsoc-ng"
WORK_DIR=$1

if [ ! -d "${ETC_PATH}" ]; then
  mkdir ${ETC_PATH}
fi

if [ ! -f "${ETC_PATH}/networks.cfg" ]; then
  cp $LOCAL_PATH/code/config/networks.cfg ${ETC_PATH}
fi

if [ ! -f "${ETC_PATH}/node.cfg" ]; then
  cp $LOCAL_PATH/code/config/node.cfg ${ETC_PATH}
fi

if [ ! -f "${ETC_PATH}/zeekctl.cfg" ]; then
  cp $LOCAL_PATH/code/config/zeekctl.cfg ${ETC_PATH}
fi

