# ASP.NET 4.5 and MySQL Sample Application
This is MySQL Example Application which demonstrate connectivity between ASP.NET 4.5 and MySQL on OpenShift 3 Cloud.

## How to run this sample on OpenShift 3
To run this sample application on OpenShift 3 Environment, deploy Click2Cloud's ASP.NET Templates on OpenShift 3 environment as specified instructions at https://github.com/Click2Cloud/DotNetOnOpenShift3.

Once ASP.NET Templates availble in OpenShift Web Console, create application using `aspnet-45-mysql-ex` template and provide this as a source repository url. 

Once application comes in running state, its time to update `connectionstring` in `Web.config` file and create table with dummy records.
Based on `mysql` pod created in OpenShift update `DefaultConnection` in `Web.config` file. 

###### NOTE: Use `mysql` pod `Cluster IP` as a `server` value in connection string and commit changes in GitHub.

Connect to MySQL Database using Port Forwarding and run `CreateTable.sql` script under `DatabaseScript` folder to create table and insert dummy records.

Now rebuild application to check application.
