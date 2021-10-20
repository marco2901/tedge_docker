#!/bin/sh
sudo tedge_mapper c8y &
sudo tedge connect c8y --test
while true; do sleep 1; done
