#!/bin/bash

set -ex

. app_constants.sh

curl -O ${env_script_location}
mkdir -p cico_utils/prerequisites/
curl -o cico_utils/prerequisites/${BUILD_MACHINE_OS}.sh ${os_prep_script_location}
. setup_env.sh
setup_env

. app_version.sh
. cico_utils/setup_utils.sh
. constants.sh

install_docker
load_jenkins_vars
docker_login

BUILD_ARGS=$( format_build_args APP_PORT=${APP_PORT} APP_NAME=${APP_NAME} APP_REGISTRY=${DEFAULT_PULL_REGISTRY} )
build_push_images -repo ${APP_NAME} -build-args "${BUILD_ARGS}" -app-version ${APP_VERSION} -test "yes" -docker-file Dockerfile.app -app-version ${APP_VERSION} -docker-file-test "Dockerfile.tests" -port ${APP_PORT}
