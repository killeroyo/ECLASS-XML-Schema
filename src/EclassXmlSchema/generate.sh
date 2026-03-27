#!/bin/bash
# Generate C# classes from ECLASS XML Schema (XSD) files
#
# Prerequisites:
#   dotnet tool install --global dotnet-xscgen
#
# Run from repository root:
#   bash src/EclassXmlSchema/generate.sh

set -e

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
OUTPUT_DIR="$REPO_ROOT/src/EclassXmlSchema/Generated"
NAMESPACE_FILE="$REPO_ROOT/src/EclassXmlSchema/namespace-mappings.txt"

mkdir -p "$OUTPUT_DIR"

xscgen \
  --nf "$NAMESPACE_FILE" \
  --output "$OUTPUT_DIR" \
  --nc \
  --nr \
  "$REPO_ROOT/unitml/w3c-xml.xsd" \
  "$REPO_ROOT/ISO29002/identifier-expanded.xsd" \
  "$REPO_ROOT/ISO29002/basic.xsd" \
  "$REPO_ROOT/ISO29002/value.xsd" \
  "$REPO_ROOT/ISO29002/catalogue.xsd" \
  "$REPO_ROOT/ISO29002/query.xsd" \
  "$REPO_ROOT/unitml/UnitsML-v1.0-csd02.xsd" \
  "$REPO_ROOT/ECLASSXML/dictionary/units.xsd" \
  "$REPO_ROOT/ECLASSXML/dictionary/dictionary.xsd" \
  "$REPO_ROOT/ECLASSXML/relations/relations.xsd" \
  "$REPO_ROOT/ECLASSXML/templates/template.xsd" \
  "$REPO_ROOT/ECLASSXML/tuf/mapping.xsd" \
  "$REPO_ROOT/ECLASSXML/workflow/query.xsd" \
  "$REPO_ROOT/ECLASSXML/workflow/response.xsd" \
  "$REPO_ROOT/bmecat/bmecat_2005-2.xsd" \
  "$REPO_ROOT/ISO22745-30/identification-guide.xsd" \
  "$REPO_ROOT/ISO22745-30/data-type.xsd"

echo "C# classes generated in $OUTPUT_DIR"
