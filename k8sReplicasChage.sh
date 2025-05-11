#!/bin/bash

echo "*******Changing the replicas********"

# Validate arguments
if [ $# -lt 2 ]; then
    echo "Usage: ./k8sReplicasChage.sh <replica-count> <yaml-file>"
    exit 1
fi

REPLICA_COUNT="$1"
YAML_FILE="$2"

# Confirm inputs
echo "Changing replicas to: $REPLICA_COUNT in file: $YAML_FILE"

# This line is the key — notice the DOUBLE quotes, not single quotes
sed -i "s/replicas: *[0-9]\+/replicas: $REPLICA_COUNT/" "$YAML_FILE"

# Check result
if [ $? -eq 0 ]; then
    echo "✅ File updated successfully."
else
    echo "❌ Error occurred while updating the file."
fi

