#!/bin/bash

# Configuration
DB_NAME="" # <-- your database name
MONGO_HOST="localhost"
MONGO_PORT="27017"
EXPORT_DIR="dump"

# Create export directory if it doesn't exist
mkdir -p $EXPORT_DIR

# Get a list of collections
collections=$(mongosh --quiet --host $MONGO_HOST --port $MONGO_PORT $DB_NAME --eval "db.getCollectionNames().join(' ')")

# Export each collection to a separate JSON file
for collection in $collections; do
  echo "Exporting collection: $collection"
  mongoexport --host $MONGO_HOST --port $MONGO_PORT --db $DB_NAME --collection $collection --out "$EXPORT_DIR/$collection.json" --jsonArray
done

echo "Export completed. Files saved in the '$EXPORT_DIR' directory."