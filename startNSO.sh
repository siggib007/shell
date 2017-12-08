#!/bin/bash
set -x
source nso44/ncsrc
ncs-netsim start
cd ncs44-run/
ncs
set +x
cd ..

