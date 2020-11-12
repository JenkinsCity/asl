#!/bin/bash

set -e 

ASL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ANT_HOME=${ASL_DIR}/tools/ant
_ANT_EXEC=${ANT_HOME}/bin/ant
RUN_BUILDFILE=${ASL_DIR}/init.xml

exec ${_ANT_EXEC} -f ${RUN_BUILDFILE} -logger org.apache.tools.ant.NoBannerLogger $@
