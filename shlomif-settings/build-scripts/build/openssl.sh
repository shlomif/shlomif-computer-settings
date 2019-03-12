#!/usr/bin/env bash
ossl_pref="$HOME/apps/openssl"
./config --prefix="$ossl_pref" --openssldir="$ossl_pref/openssl" shared
