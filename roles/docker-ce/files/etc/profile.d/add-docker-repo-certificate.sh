#!/bin/bash
add-docker-repo-certificate() {
  CERTS_FOLDER="/etc/docker/certs.d"
  SERVER=$1
  mkdir -p "$CERTS_FOLDER/$SERVER"
  openssl s_client -showcerts -connect $SERVER </dev/null 2>/dev/null | openssl x509 -outform PEM >"$CERTS_FOLDER/$SERVER/ca.crt"
  if [[ "$SERVER" == *:443 ]];then
    ln --symbolic --relative "$CERTS_FOLDER/$SERVER" "$CERTS_FOLDER/${SERVER%':443'}"
    echo true
  fi
}
