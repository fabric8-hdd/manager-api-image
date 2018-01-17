
#!/bin/bash

. cico_tests/run_tests.sh
. app_constants.sh
. app_version.sh
run_tests -app-port ${APP_PORT} -app-name ${APP_NAME} -app-version ${APP_VERSION} -docker-file Dockerfile.tests
