#!/bin/bash

set -eux

WORKSPACE=$(pwd)
echo "--//INFO: ws.dir: ${WORKSPACE}"

ASL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ANT_HOME=${ASL_DIR}/tools/ant
_ANT_EXEC=${ANT_HOME}/bin/ant

TASKS_DIRS=${ASL_DIR}/../

mkdir -p .asl
if [ ! -d ".asl/asl" ]; then
  ln -s ${ASL_DIR} .asl/asl
fi


if [ -n "$1" ]; then
  TASK=$1
  if [ ! -d "${TASKS_DIRS}/${TASK}" ]; then
    echo "--//INFO: please check task.name"
    exit -1
  fi
  shift
else
  echo "--//INFO: please set task.name"
  exit -1
fi

if [ ! -d ".asl/${TASK}" ]; then
  ln -s ${TASKS_DIRS}/${TASK} .asl/${TASK}
fi

RUN_BUILDFILE=.asl/asl/run.xml
exec ${_ANT_EXEC} -f ${RUN_BUILDFILE} -logger org.apache.tools.ant.NoBannerLogger -Dabs.task.id=${TASK} $@
