#!/bin/bash

cd functions; npm install

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "FIREBASE_TOKEN is missing"
    exit 1
fi

if [ -z "${FIREBASE_PROJECT}" ]; then
    echo "FIREBASE_PROJECT is missing"
    exit 1
fi

# Check if FUNCTION_TO_DEPLOY is set
if [ -n "${FUNCTION_TO_DEPLOY}" ]; then
    DEPLOY_OPTION="--only functions:${FUNCTION_TO_DEPLOY}"
else
    DEPLOY_OPTION="--only functions"
fi

firebase use $FIREBASE_PROJECT
firebase deploy $DEPLOY_OPTION
