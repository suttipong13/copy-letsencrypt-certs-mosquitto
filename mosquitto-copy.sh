# Set which domain this script will be run for
MY_DOMAIN=
# Set the directory that the certificates will be copied to.
CERTIFICATE_DIR=/etc/mosquitto/certs

if [ "${RENEWED_DOMAINS}" = "${MY_DOMAIN}" ]; then
	# Copy new certificate to Mosquitto directory
	echo "Copy new certificate to Mosquitto directory"
	cp ${RENEWED_LINEAGE}/fullchain.pem ${CERTIFICATE_DIR}/server.pem
	cp ${RENEWED_LINEAGE}/privkey.pem ${CERTIFICATE_DIR}/server.key

	# Set ownership to Mosquitto
	echo "Set ownership to Mosquitto"
	chown mosquitto: ${CERTIFICATE_DIR}/server.pem ${CERTIFICATE_DIR}/server.key

	# Ensure permissions are restrictive
	echo "Ensure permissions are restrictive"
	chmod 0600 ${CERTIFICATE_DIR}/server.pem ${CERTIFICATE_DIR}/server.key

	echo "Tell Mosquitto to reload certificates and configuration"
	# Tell Mosquitto to reload certificates and configuration
	pkill -HUP -x mosquitto
fi