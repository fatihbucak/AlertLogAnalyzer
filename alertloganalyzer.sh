#!/bin/bash
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/dbhome_1
export PATH=$ORACLE_HOME/bin:$PATH
bash /u01/app/oracle/scripts/last_day_ora_errors.sh > /tmp/ora-errors-report.txt
/bin/mailx -s "ORA iceren alert log hatalari" mail_here@gmail.com < /tmp/ora-errors-report.txt
