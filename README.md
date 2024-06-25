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
- <code>opa</code> contains the open policy agent image construction code.

- **currently trying envoy as L7 proxy/filter**


In order to control the infra toolset, <code>make</code> is used:
- <code>make all</code> cleans, builds and ups
- (for other options look in the Makefile)

# Available tools
- With a local installation, the mlflow user interface should be available at <code>http://localhost:5000</code>
- With a local installation, the Jupyter notebook UI should be available at <code>http://localhost:8888/lab</code> using the link provided during the build process (the standard way Jupyter does this)
- With a local installation, the opa should be available at <code>http://localhost:8181</code>

# Opa note:
- run <code>curl -X PUT --data-binary @access_policy.rego http://localhost:8181/v1/policies/main</code> to give the OPA service the rule you defined - it will return {} (empty object) if there are no errors
- run <code>curl http://localhost:8181/v1/policies</code> to confirm that your policy (rego) is within the list of policies that OPA now has
- run <code>curl -X POST --data-binary @input.json 'http://localhost:8181/v1/data/example/allow_access' -H 'Content-Type: application/json'</code> to have OPA scan the contents of the input.json file to make sure it complies with the policies you've defined - should see a response like {"result":false/true}
An example policy and example input can be found in ./docker/opa

# Envoy note:
- curl -X GET http://localhost:8080/anything should work but curl -X POST http://localhost:8080/anything should fail.

Environment variables SERVICE_NAME and SERVICE_PORT refers to the service Envoy is proxying. These env variables will replace the variables in envoy.yaml. See ./compose/envoy/entrypoint.sh for more details.

# Notice
This setup originated from <code>https://github.com/amoat7/mlflow_tutorial</code> and from <code>https://github.com/vastevenson/opa-rego-json-intro-example-vs</code> and from <code>https://medium.com/swlh/securing-dockerized-microservices-with-open-policy-agent-and-envoy-c128dfc764fe</code>but was heavily modified. Rights etc.. need to be checked (it is AGPL-3.0 licensed)













