#!/bin/bash
pid=$(ps -ef | grep mkdoc |grep -v grep| awk '{print $2}')
kill -9 $pid
