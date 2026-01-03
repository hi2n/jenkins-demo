#!/bin/bash

echo "Running basic tests..."

# Test file ton tai
if [ ! -f index.html ]; then
  echo "index.html not found"
  exit 1
fi

# Test noi dung 
grep -q "DevOps" index.html
if [ $? -ne 0 ]; then
  echo "Content test failed"
  exit 1
fi

echo "Tests passed"
exit 0
