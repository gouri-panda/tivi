#!/bin/sh

function decrypt {
  PASSPHRASE=$1
  INPUT=$2
  OUTPUT=$3
  gpg --batch --yes --passphrase $PASSPHRASE --output $OUTPUT --decrypt $INPUT
}

ENCRYPT_KEY=$1

if [[ ! -z "$ENCRYPT_KEY" ]]; then
  # Decrypt Release key
  decrypt ${ENCRYPT_KEY} release/app-release.gpg release/app-release.jks
  # Decrypt Play Store key
  decrypt ${ENCRYPT_KEY} release/play-account.gpg release/play-account.json
  # Decrypt Google Services key
  decrypt ${ENCRYPT_KEY} release/google-services.gpg app/google-services.json
else
  echo "ENCRYPT_KEY is empty"
fi