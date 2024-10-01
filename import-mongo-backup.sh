#!/bin/bash

# Configuration
MONGO_URI="mongodb://127.0.0.1:27017/YOUR_DB"
# update you db name------------------^ here
IMPORT_DIR="dump"

# Loop through each JSON file in the directory
for file in $IMPORT_DIR/*.json; do
  # Extract the collection name from the filename
  collection=$(basename "$file" .json)
  echo "Importing collection: $collection from file: $file"
  mongoimport --uri $MONGO_URI --collection $collection --file "$file" --jsonArray --verbose
done

echo "Import completed."
