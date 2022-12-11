#!/bin/bash

endpath=$(~/bin/wcd_core.py "$@")

if [[ $endpath == *"wcd_core.py"* ]]; then
  echo "(wcd_core python output)" && echo
  echo "$endpath"
  return
fi

if [[ -z $endpath ]]; then
  echo "(wcd bash output)" && echo
  echo "No directory match found"
  return
fi

cd "${endpath}" || echo "Final cd step failed"
