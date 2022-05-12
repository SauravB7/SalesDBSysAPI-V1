# SalesDBSysAPI-V1

### Setting Up Listener for the Project
* Use the following Domain project to run this repository - [**SDHTTPListener**](https://github.com/SauravB7/SDHTTPListener)
* Or, uncomment the following line in the [***SalesDBSysAPI-main.xml***](./src/main/mule/SalesDBSysAPI-main.xml)
    ```
    <http:listener-config name="SDHTTP_Listener_config">
        <http:listener-connection host="${api.host}" port="${api.port}" readTimeout="${api.listener_timeout}" connectionIdleTimeout="${api.listener_timeout}"/>
    </http:listener-config>
    ```
  Update the ***src/main/resources/configuration.yaml*** to set your preferred host, port and path.
    ```
    api:
      host: "0.0.0.0"
      port: "8091"
      path: "/salesdbms/v1/*"
      console: "/salesdbms/v1/console"
      listener_timeout: "30000"
    ```

### Database Table Structure
Create the Database with following Table structure

![SALESDB_ERD](https://user-images.githubusercontent.com/28842863/167982011-22204f98-5a04-48c0-95bd-fecb4edb4290.png)

### Setting Up Database Config for the Project
Update the following parameters with your Database configs in [***configuration.yaml***](./src/main/resources/configuration.yaml). Update the host, port, database, schema and user credentials with your Database details.
```
db:
  host: "192.168.15.10"
  port: "1521"
  database: "XYZ"
  schema: "SALESDEV"
  user: "SALESDEV"
  password: "TestSALESDev1"
```

### Creating the Deployable Package
To create a deployable package from your configured Project, run the following Maven command inside your Project root folder.
```
mvn clean package
```

### Mock Service and Exchange Doc
Mock Service is RAML is published in the Exchange: [***SalesDBSysAPI-V1 Exchange***](https://anypoint.mulesoft.com/exchange/portals/test-4779/64efc3bc-f2ea-4c4d-9159-51c6597ce859/salesdbsysapi/)
