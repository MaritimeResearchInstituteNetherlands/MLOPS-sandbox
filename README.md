# MLOPS-sandbox
A proposal for the sandbox environment and examples how to use it.

The sandbox github contains the following parts:
- __Sandbox infra__. This part is used to deploy the sandbox to a server where it can be used. The server can be your laptop or a server running somewhere in the (private) cloud. The infra could contain things like the MLflow docker container and other tools that are used to control or monitor the operation of the sandbox. Typically, a _developer_ will use this part of the sandbox.
- __Sandbox experiment__. This part contains the actual experiment to be conducted. This can be any set of containers containing code, models, data, etc.. to be tested. In order for a sanbox experiment to run, a sandbox infra needs to be available. If not it is created automatically. Typically, a _data scientist_ will use this part of the sandbox.

# Setup Sandbox Infra Development environment
For a developer to work on the Sandbox infra, some requirements need to be fulfilled on the development machine:
- Linux machine (e.g. WSL2) 
- docker and docker-compose need to be installed
- MLflow needs to be installed locally (this is needed to build the docker container) (Use <code>pip install mlflow</code>)

You then can run a local MLflow server with <code>mlflow server</code> and you can start the mlflow user interface using <code>mlflow ui</code>



