#!/bin/bash

# Prints GitHub repo entries in JSON format
gh repo list deanofwalls --limit 1000 --visibility public  --json name,description,url
