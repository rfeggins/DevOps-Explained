
## Overview
SQL Server 2017 now runs on Linux. It’s the same SQL Server database engine, with many similar features and services regardless of your operating system. SQL Server 2017 can be installed and run on the following linux distributions :
- [Install on Red Hat Enterprise Linux](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-red-hat?view=sql-server-2017)
- [Install on SUSE Linux Enterprise Server](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-suse?view=sql-server-2017)
- [Install on Ubuntu](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-2017)

In this blog, we will walk through the steps to pull and run the SQL Server 2017 using a docker container image. This image, mssql-server-linux, consists of SQL Server running on Linux based on Ubuntu 16.04 and can be used with the Docker Engine 1.8+ on Linux or on Docker for Mac/Windows.

With containers you can take advantage of the Container platform along with using CI/CD for both the application code but also for the run-time environment.

Here is a quick summary of what we will cover:
- Pulling the docker image for SQL Server from Docker github
- Running SQL Server instance in Docker
- Connnecting to the SQL instance
- Creating our first database

In a subsequent blog, we will then add this container to a Kubernetes cluster running on the IBM Container Service where we will then connect with sqlcmd to create your first database and run queries.

### Prerequisites

Here is the list of the following prerequisites required to complete this tutorial
-	Minimum of 4 GB of disk space
- Minimum of 4 GB of RAM
-	Docker Engine 1.8+ or [Docker for Mac/Windows](https://docs.docker.com/install/)

### References
Here are some additional referencesw
1. [Introduction to SQL Server on SUSE Linux Enterprise Server](https://suse.lookbookhq.com/sql-server-on-suse-linux/introduction-webinar?campaign_description=FY18%20May%20Global%20Demand%20Generation%20Advertising%20online%20SEMPPC%20Digital%20Transformation&campaign_id=GSDGNIT32475&gclid=EAIaIQobChMI8OD-78qN3QIVl4jICh1p5Ad6EAAYASAAEgJ_qPD_BwE)
2. [Quickstart: Run the SQL Server 2017 container image with Docker](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-2017)
3. [MS SQL Server Environment Variables](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-configure-environment-variables?view=sql-server-2017)
4. [Configuring SQL Server container for Production](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-configure-docker?view=sql-server-2017)

## Step 1 - Pulling SQL Server container
The official docker images for Microsoft SQL Server that can run on Linux are available here, the [mssql-server-linux Docker hub page.](https://hub.docker.com/r/microsoft/mssql-server-linux/tags/)
For this lab will be using the SQL Server developer edition. The process for running production editions for SQL Server 2017 in containers is slightly different. For more information, see Run production container images.
1.	Pull SQL Server image (On some system sudo might not be required.)
>
> sudo docker pull microsoft/mssql-server-linux:2017-GA
>
2.	Note if you want to pul the latest image, you can change the tag name, for example you can use
> microsoft/mssql-server-linux:2017-latest


3.	Execute command docker images to see what other images you now have available locally
>
> sudo docker images
>

## Step 2 - Running SQL Server instance in Docker

4.	To run the container locally using Docker, you can use the following command from a bash shell (Linux/macOS)
>
> sudo docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=<YourStrong!Passw0rd>' \
>
> -p 1433:1433 --name sql1 \
>
> -d microsoft/mssql-server-linux:2017-GA

Note in some cases you may need to increase the memory size that you are using for Docker.
https://github.com/Microsoft/mssql-docker/issues/114

5. Check if docker image successfully started by running following commands
> sudo docker ps
>
> sudo docker ps -a


6. In my case the container running SQL-Server didn't start properly so I also had to check the error logs by executing the [docker logs command.](https://docs.docker.com/engine/reference/commandline/logs/)
>
> sudo docker logs --details <container-id>
>

If the STATUS column shows a status of Up, then SQL Server is running in the container and listening on the port specified in the PORTS column.

If the STATUS column for your SQL Server container shows Exited, then you will need to do some troubleshooting and retry again.

## Step 3 - Connecting to SQL Server

The following steps use the SQL Server command-line tool, sqlcmd, inside the container to connect to SQL Server.
7.	Use the docker exec -it command to start an interactive bash shell inside your running container.
   > sudo docker exec -it sql1 "bash"

  Using the docker exec -it command to start an interactive bash shell inside your running container.

  You can use standard commands such as "ls", "cd". "pwd" to name a few.

8. Once you have access to the bash shell for your MS Server container, change to the sqlcmd directory as Sqlcmd is not in the path by default.
  > cd /opt/mssql-tools/bin/
  >
  > ./sqlcmd -S localhost -U SA -P '<YourNewStrong!Passw0rd>'

4.

   ## Step 4 - Create a test data
   The following steps create a new database named **TestDB.**
   1.	From the sqlcmd command prompt, paste the following Transact-SQL command to create a test database:
   SQL Copy
   CREATE DATABASE TestDB
   2.	On the next line, write a query to return the name of all of the databases on your server:
   SQL Copy
   SELECT Name from sys.Databases
   3.	The previous two commands were not executed immediately. You must type GO on a new line to execute the previous commands:
   SQL Copy
   GO
   Insert data
   Next create a new table, Inventory, and insert two new rows.
   1.	From the sqlcmd command prompt, switch context to the new TestDB database:
   SQL Copy
   USE TestDB
   2.	Create new table named Inventory:
   SQL Copy
   CREATE TABLE Inventory (id INT, name NVARCHAR(50), quantity INT)
   3.	Insert data into the new table:
   SQL Copy
   INSERT INTO Inventory VALUES (1, 'banana', 150); INSERT INTO Inventory VALUES (2, 'orange', 154);
   4.	Type GO to execute the previous commands:
   SQL Copy
   GO
   Select data
   Now, run a query to return data from the Inventory table.
   1.	From the sqlcmd command prompt, enter a query that returns rows from the Inventory table where the quantity is greater than 152:
   SQL Copy
   SELECT * FROM Inventory WHERE quantity > 152;
   2.	Execute the command:
   SQL Copy
   GO
   Exit the sqlcmd command prompt
   1.	To end your sqlcmd session, type QUIT:
   SQL Copy
   QUIT
   2.	To exit the interactive command-prompt in your container, type exit. Your container continues to run after you exit the interactive bash shell.
   Connect from outside the container
   You can also connect to the SQL Server instance on your Docker machine from any external Linux, Windows, or macOS tool that supports SQL connections.
   The following steps use sqlcmd outside of your container to connect to SQL Server running in the container. These steps assume that you already have the SQL Server command-line tools installed outside of your container. The same principals apply when using other tools, but the process of connecting is unique to each tool.
   1.	Find the IP address for the machine that hosts your container. On Linux, use ifconfig or ip addr. On Windows, use ipconfig.
   2.	Run sqlcmd specifying the IP address and the port mapped to port 1433 in your container. In this example, that is the same port, 1433, on the host machine. If you specified a different mapped port on the host machine, you would use it here.
   bash Copy
   sqlcmd -S 10.3.2.4,1433 -U SA -P '<YourNewStrong!Passw0rd>'
   PowerShell Copy
   sqlcmd -S 10.3.2.4,1433 -U SA -P "<YourNewStrong!Passw0rd>"
   3.	Run Transact-SQL commands. When finished, type QUIT.
   Other common tools to connect to SQL Server include:
   •	Visual Studio Code
   •	SQL Server Management Studio (SSMS) on Windows
   •	SQL Server Operations Studio (Preview)
   •	mssql-cli (Preview)
   Remove your container
   If you want to remove the SQL Server container used in this tutorial, run the following commands:
   bash Copy
   sudo docker stop sql1
   sudo docker rm sql1
   PowerShell Copy
   docker stop sql1
   docker rm sql1
   Warning
   Stopping and removing a container permanently deletes any SQL Server data in the container. If you need to preserve your data, create and copy a backup file out of the container or use a container data persistence technique.
   Docker demo
   After you have tried using the SQL Server container image for Docker, you might want to know how Docker is used to improve development and testing. The following video shows how Docker can be used in a continuous integration and deployment scenario.
   Next steps
   For a tutorial on how to restore database backup files into a container, see Restore a SQL Server database in a Linux Docker container. To explore other scenarios, such as running multiple containers, data persistence, and troubleshooting, see Configure SQL Server 2017 container images on Docker.
   Also, check out the mssql-docker GitHub repository for resources, feedback, and known issues.
   Note
   The feedback system for this content will be changing soon. Old comments will not be carried over. If content within a comment thread is important to you, please save a copy. For more information on the upcoming change, we invite you to read our blog post.
   229 comments
