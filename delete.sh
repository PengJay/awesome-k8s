#!/bin/bash

kubectl delete -f deepstream

kubectl delete -f mongo

kubectl delete -f mysql

kubectl delete -f redis

kubectl delete -f system
