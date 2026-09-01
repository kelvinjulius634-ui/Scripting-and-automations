#!/bin/bash
LOG_FILE="$1"
if [ -z "$1" ]; then
echo "Please enter the log file this way : < "$0" Log_file >"
exit 1
elif [ ! -f "$1" ]; then
  echo "Error: Log file '$1' does not exist."
  exit 1
else
echo "" >DataReport.txt
echo "YOUR LOG_FILE RECEIVED SO ANALYSIS BEGINS " >> DataReport.txt
echo "___________________________________________">> DataReport.txt
fi
echo "">>DataReport.txt
echo "List of log_files created today or within 24 hours">> DataReport.txt
echo "">> DataReport.txt
TodayFile=$(find "$1" -name "*.log" -mtime -1)
echo "$TodayFile">> DataReport.txt
echo "">> DataReport.txt
echo "Total number of logs Today are: " >> DataReport.txt
echo "$TodayFile" | wc -l >> DataReport.txt
echo "">> DataReport.txt
echo "List of ERROR occured Today">> DataReport.txt
grep "ERROR" "$TodayFile">> DataReport.txt
echo "Number of ERROR occured Today are: " >> DataReport.txt
grep -c "ERROR" "$TodayFile" >>DataReport.txt
grep "ERROR" "$TodayFile" | awk '{print "Failed IP adress " $4 "\t" "Time was: " $2}' >> DataReport.txt
echo "Report generated, see it at  DataReport.txt"



