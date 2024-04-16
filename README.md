# MLOPS-sandbox
A proposal for the sandbox environment and examples how to use it.

The sandbox github contains everythiong to develop and work with the MLOPS-sandbox. It containbs two main parts, with distinct functionality:
- __Sandbox infra__. This part is used to deploy the sandbox to a server where it can be used. The server can be your own, local laptop or a server running somewhere in the (private) cloud. The infra could contain things like the MLflow tracking server docker container and other tools that are used to control or monitor the operation of the sandbox. Typically, a _developer_ will use this part of the sandbox.
- __Sandbox experiment__. This part contains the actual experiment to be conducted. This can be any set of containers containing code, models, data, etc.. to be tested. In order for a sanbox experiment to run, a sandbox infra needs to be available. If not it is created automatically. Typically, a _data scientist_ will use this part of the sandbox.

# Setup Sandbox Infra toolset
 For a developer to work on the Sandbox infra, some trivial requirements need to be fulfilled on the development machine in the first place:
- Linux machine (e.g. WSL2) 
- Python and pip
- docker and docker-compose need to be installed

The folder <code>docker</code> contains several docker images that are to be created:
- <code>mlflow</code> contains the mlflow tracking server,
- <code>postgres</postgres> contains the database mlflow uses to store artifacts.

As a developer you can build, up, down using <code>docker-compose</code>. The config is read from <code>.env</code> by docker-compose only.

# Available tools
- With a local installation, the mlflow user interface should be available at <code>http://localhost:5000</code>











