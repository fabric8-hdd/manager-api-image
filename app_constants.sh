set -a
env_script_location=https://raw.githubusercontent.com/fabric8-hdd/fabric8-hypothesis-core-image/master/cico_utils/setup_env.sh
APP_NAME=osio-hypothesis-manager-api
APP_PORT=$(grep "HDD_MANAGER_API_PORT" openshift/supervisor.env | cut -d'=' -f 2)
BUILD_MACHINE_OS=centos
os_prep_script_location=https://raw.githubusercontent.com/fabric8-hdd/fabric8-hypothesis-core-image/master/cico_utils/prerequisites/${BUILD_MACHINE_OS}.sh
set +a
