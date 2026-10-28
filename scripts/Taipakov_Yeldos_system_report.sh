
#!/bin/bash

# Student Information
NAME="Yeldos"
SURNAME="Taipakov"
GROUP="IT2-2310"
STUDENT_ID="38321"

# Project paths
PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LOG_FILE="$PROJECT_DIR/logs/Taipakov_Yeldos_system_report.log"

# Generate system report
{
    echo "=================================="
    echo "DevOps Midterm - System Report"
    echo "=================================="

    echo "Name: $NAME"
    echo "Surname: $SURNAME"
    echo "Group: $GROUP"
    echo "Student ID: $STUDENT_ID"

    echo "----------------------------------"
    echo "Date: $(date)"
    echo "Username: $(whoami)"
    echo "Hostname: $(hostname)"

    echo "----------------------------------"
    echo "Operating System:"
    uname -a

    echo "----------------------------------"
    echo "CPU Information:"
    lscpu | grep -E 'Architecture:|CPU\(s\):|Model name:'

    echo "----------------------------------"
    echo "Disk Usage:"
    df -h /

    echo "----------------------------------"
    echo "Memory Usage:"
    free -h

    echo "----------------------------------"
    echo "Running Processes:"
    ps aux --sort=-%cpu | head -n 6

    echo "=================================="
} | tee -a "$LOG_FILE"
