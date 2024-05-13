# MLOPS-sandbox
A proposal for the sandbox environment and examples how to use it.

The sandbox github contains a basic setup to develop and work with the MLOPS-sandbox. It contains two main parts, with distinct functionality:
- __Sandbox infra__. This part is used to deploy the sandbox to a server where it can be used. The server can be your own, local laptop or a server running somewhere in the (private) cloud. The infra could contain things like the MLflow tracking server docker container with corresponding Postgress database, jupyter notebooks (and conda) and other tools that are used to control or monitor the operation of the sandbox. Typically, a _developer_ will use this part of the sandbox.
- __Sandbox experiment__. This part contains the actual experiment to be conducted. This can be any set of containers containing code, notebooks, models, data, etc.. to be tested. In order for a sandbox experiment to run, a sandbox infra needs to be available. If not it is created automatically. Typically, a _data scientist_ will use this part of the sandbox.

# Setup Sandbox Infra toolset
 For a developer to work on the Sandbox infra, some trivial requirements need to be fulfilled on the development machine in the first place:
- Linux machine (e.g. WSL2) 
- Python and pip
- docker and docker-compose need to be installed

The folder <code>docker</code> contains several docker images that are to be created:
- <code>mlflow</code> contains the mlflow tracking server image construction code,
- <code>postgres</code> contains the database image construction that mlflow uses to store artifacts.
- <code>jupyter</code> contains the jupyter notebook image construction code.
- <code>python-dev</code> contains the python image construction code.

In order to control the infra toolset, <code>make</code> is used:
- <code>make all</code> cleans, builds and ups
- (for other options look in the Makefile)

# Available tools
- With a local installation, the mlflow user interface should be available at <code>http://localhost:5000</code>
- With a local installation, the Jupyter notebook UI should be available at <code>http://localhost:8888/lab</code> using the link provided during the build process (the standard way Jupyter does this)

# Notice
This setup originated from <code>https://github.com/amoat7/mlflow_tutorial</code>, but was heavily modified. Rights etc.. need to be checked (it is AGPL-3.0 licensed)











