# AlertLogAnalyzer
This application is created to analyze alert logs in Oracle Databases

# Usage
- Change the alertloganalyzer.sh file according to your Oracle Home and mail address  
- Put these two file into /u01/app/oracle/scripts/
- Run "bash /u01/app/oracle/scripts/alertloganalyzer.sh"  
- You can use crontab to run everyday automatically. You can add this line into crontab file
- 30 8 * * * bash /u01/app/oracle/scripts/alertloganalyzer.sh >/dev/null 2>&1
