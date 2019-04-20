#!/bin/sh

echo ""
echo "====================================="
echo "Packt-Publishing-Free-Learning"
echo "====================================="
echo ""
if [ -z "${DOWNLOAD_DIR}" ]; then
  DOWNLOAD_DIR="/download"
  echo "[i] DOWNLOAD_DIR environment variable not set, using default: ${DOWNLOAD_DIR}"
  echo "[|] Same download location need to be set in config file!"
fi

if [ -z "${CRON_TIME}" ]; then
  CRON_TIME="* 12 * * *"
  echo "[i] CRON_TIME environment variable not set, using default: ${CRON_TIME}"
fi

if [ ! -f "${CONFIG_FILE}" ]; then
  echo "[e] Configuration file doesn't exist! File should be located in: ${CONFIG_FILE}"
  echo "[|] You can change config file location by setting CONFIG_FILE environment variable"
  exit 1
fi

mkdir -p ${DOWNLOAD_DIR}

echo ""
echo "=========== CONFIGURATION ==========="
echo "CONFIG_FILE  = ${CONFIG_FILE}"
echo "CLI_OPTIONS  = ${CLI_OPTIONS}"
echo "DOWNLOAD_DIR = ${DOWNLOAD_DIR}"
echo "CRON_TIME    = ${CRON_TIME}"
echo "====================================="
echo ""

echo "${CRON_TIME} packt-cli ${CLI_OPTIONS} -c ${CONFIG_FILE}" > /var/spool/cron/crontabs/root
/usr/sbin/crond -l 2 -f
