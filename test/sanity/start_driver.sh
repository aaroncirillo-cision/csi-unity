#!/bin/sh
# This will run coverage analysis using the integration testing.
# The env.sh must point to a valid Unisphere deployment and the iscsi packages must be installed
# on this system. This will make real calls to  Unisphere

rm -f unix_sock
. ../../env.sh
echo ENDPOINT $X_CSI_UNITY_ENDPOINT
echo "Starting the csi-unity driver. You should wait until the node setup is complete before running tests."
../../csi-unity --driver-name=$DRIVER_NAME --driver-config=$DRIVER_CONFIG
