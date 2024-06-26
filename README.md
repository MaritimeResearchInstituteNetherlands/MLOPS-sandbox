# MLOPS-sandbox
A proposal for the sandbox environment and examples how to use it.

The sandbox github contains a basic setup to develop and work with the MLOPS-sandbox. It contains two main parts, with distinct functionality:
- __Sandbox infra__. This part is used to deploy the sandbox to a server where it can be used. The server can be your own, local laptop or a server running somewhere in the (private) cloud. The infra could contain things like the MLflow tracking server docker container with corresponding Postgress database, jupyter notebooks (and conda) and other tools that are used to control or monitor the operation of the sandbox. Typically, a _developer_ will use this part of the sandbox. For now, it uses docker-compose, but eventually might move to Kubernetes.
- __Sandbox experiment__. This part contains the actual experiment to be conducted. This can be any set of containers containing code, notebooks, models, data, etc.. to be tested. In order for a sandbox experiment to run, a sandbox infra needs to be available. If not it is created automatically. Typically, a _data scientist_ will use this part of the sandbox. This part of the sandbox will most likely be accessed through the provided Jupyterlab and/or MLflow web interfaces.

# Setup Sandbox Infra toolset
 For a developer to work on the Sandbox infra, some trivial requirements need to be fulfilled on the development machine in the first place:
- Linux machine (e.g. WSL2) 
- Python and pip
- docker and docker-compose

The folder <code>docker</code> contains several docker images that are to be created/built/overlayed:
- <code>mlflow</code> contains the mlflow tracking server image construction code,
- <code>postgres</code> contains the database image construction that mlflow uses to store artifacts.
- <code>jupyter</code> contains the jupyter notebook image construction code.
- <code>python-dev</code> contains the python image construction code.
- <code>opa</code> contains the open policy agent image construction code.
- <code>envoy</code> contains the envoy sidecar/L7 filter image construction code

In order to control the infra toolset, <code>make</code> is used:
- <code>make all</code> cleans, builds and ups
- *(for other options look in the Makefile)*

# Available tools
- With a local installation, the mlflow user interface should be available at <code>http://localhost:5000</code>
- With a local installation, the Jupyter notebook UI should be available at <code>http://localhost:8888/lab</code> using the link provided during the build process (the standard way Jupyter does this)
- With a local installation, the opa should be available at <code>http://localhost:9191</code>
- With a local installation, envoy uses port 8080 to the outside workd and 80 inside the docker network. The <code>envoy.yaml</code> filter code can be found in <code>/config/envoy.yaml</code>
- At this moment, a stub (<code>httpbin</code>) is used instead of a deployed model. Of course this will change later.

# Opa note:
(please not this does not work at the moment. Please look at the envoy note below to see what does work)
- run <code>curl -X PUT --data-binary @access_policy.rego http://localhost:9191/v1/policies/main</code> to give the OPA service the rule you defined - it will return {} (empty object) if there are no errors
- run <code>curl http://localhost:9191/v1/policies</code> to confirm that your policy (rego) is within the list of policies that OPA now has
- run <code>curl -X POST --data-binary @input.json 'http://localhost:9191/v1/data/example/allow_access' -H 'Content-Type: application/json'</code> to have OPA scan the contents of the input.json file to make sure it complies with the policies you've defined - should see a response like {"result":false/true}
An example policy and example input can be found in ./docker/opa

# Envoy note:
- <code>curl -X GET http://localhost:8080/anything</code> should work but <code>curl -X POST http://localhost:8080/anything</code> should fail.

Environment variables SERVICE_NAME and SERVICE_PORT refers to the service Envoy is proxying. Environment variable OPA_PORT identifies the port opa is wired to. These env variables will replace the variables in envoy.yaml. See <code>./compose/envoy/entrypoint.sh</code> for more details.

# Notice
This setup uses snippets and knowledge originating from 
- <code>https://github.com/amoat7/mlflow_tutorial</code>
- <code>https://github.com/vastevenson/opa-rego-json-intro-example-vs</code>
- <code>https://medium.com/swlh/securing-dockerized-microservices-with-open-policy-agent-and-envoy-c128dfc764fe</code>

But was modified beyond recognition. Rights etc.. need to be checked (it is AGPL-3.0 licensed)













