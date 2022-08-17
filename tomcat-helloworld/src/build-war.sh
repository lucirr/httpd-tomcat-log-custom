#!/bin/bash

mkdir -p dist
jar -cvf dist/helloworld.war *.jsp WEB-INF
