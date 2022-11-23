# Set which domain this script will be run for
MY_DOMAIN=
# Set the directory that the certificates will be copied to.
CERTIFICATE_DIR=/etc/mosquitto/certs

if [ "${RENEWED_DOMAINS}" = "${MY_DOMAIN}" ]; then
	# Copy new certificate to Mosquitto directory
	sudo cp ${RENEWED_LINEAGE}/fullchain.pem ${CERTIFICATE_DIR}/server.pem
	sudo cp ${RENEWED_LINEAGE}/privkey.pem ${CERTIFICATE_DIR}/server.key

	# Set ownership to Mosquitto
	sudo chown mosquitto: ${CERTIFICATE_DIR}/server.pem ${CERTIFICATE_DIR}/server.key

	# Ensure permissions are restrictive
	sudo chmod 0600 ${CERTIFICATE_DIR}/server.pem ${CERTIFICATE_DIR}/server.key

	# Tell Mosquitto to reload certificates and configuration
	sudo pkill -HUP -x mosquitto
fi