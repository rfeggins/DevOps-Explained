docker pull microsoft/mssql-server-linux:2017-GA

docker run --name sql-server02 \
	-p 1431:1433 \
	-e "ACCEPT_EULA=Y" \
	-e "SA_PASSWORD=sql!DevOps2017" \
 	-e "MSSQL_PID=Developer" \
	-d microsoft/mssql-server-linux:2017-GA


docker rm -f sql-server02

docker-compose up -d
