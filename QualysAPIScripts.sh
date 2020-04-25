#!/bin/bash
/data/python3.6/bin/python /data/QualysHostList.py > /data/CronOuts/HostlistOut.log 2>&1
/data/python3.6/bin/python /data/QualysHostDetection.py > /data/CronOuts/HostDetect.log 2>&1
/data/python3.6/bin/python /data/QualysVulnDetail.py >/data/CronOuts/VulnDetail.log 2>&1