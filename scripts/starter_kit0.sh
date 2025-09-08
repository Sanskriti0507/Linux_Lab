#!/bin/bash

BASE_DIR="project"

mkdir -p $BASE_DIR/scripts
mkdir -p $BASE_DIR/docs
mkdir -p $BASE_DIR/data

echo "# Project" > $BASE_DIR/README.md
echo "# Scripts Folder" > $BASE_DIR/scripts/README.md
echo "# Documentation Folder" > $BASE_DIR/docs/README.md
echo "# Data Folder" > $BASE_DIR/data/README.md

echo "Starter Kit Ready!"