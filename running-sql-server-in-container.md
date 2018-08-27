
## Overview
SQL Server 2017 now runs on Linux. It’s the same SQL Server database engine, with many similar features and services regardless of your operating system. SQL Server 2017 can be installed and run on the following linux distributions :
- [Install on Red Hat Enterprise Linux](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-red-hat?view=sql-server-2017)
- [Install on SUSE Linux Enterprise Server](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-suse?view=sql-server-2017)
- [Install on Ubuntu](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-2017)

In this blog, we will walk through the steps to pull and run the SQL Server 2017 using a docker container image. This image, mssql-server-linux, consists of SQL Server running on Linux based on Ubuntu 16.04 and can be used with the Docker Engine 1.8+ on Linux or on Docker for Mac/Windows.

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

## Pull SQL Server container
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
## Running SQL Server instance in Docker

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

    If the STATUS column shows a status of Up, then SQL Server is running in the container and listening on the port specified in the PORTS column.

    If the STATUS column for your SQL Server container shows Exited, then you will need to do some troubleshooting.

6. In my case the container running SQL-Server didn't start properly so I also had to check the error logs by executing the [docker logs command.](https://docs.docker.com/engine/reference/commandline/logs/)
>
> sudo docker logs --details <container-id>
>

## Connecting to SQL Server

The following steps use the SQL Server command-line tool, sqlcmd, inside the container to connect to SQL Server.
3.	Use the docker exec -it command to start an interactive bash shell inside your running container.
4.	In the following example sql1 is name specified by the --name parameter when you created the container.
