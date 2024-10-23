@echo off

newman run "./Postman Project.json" -e "./Locally.postman_environment.json"  -r cli,htmlextra,csv 
--report-htmlextra-export "./PostmanTest.html" ^  
--report-csv-export "./PostmanTest.csv" 