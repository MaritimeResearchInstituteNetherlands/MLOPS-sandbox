# Use the official OPA Docker image as the base image
FROM openpolicyagent/opa:latest-envoy


# Set the working directory inside the container
WORKDIR /app


# Expose the OPA API port
EXPOSE 8181


# Command to run OPA with the policies
CMD ["run", "--server", "--addr=:8181", "/app", "--log-level=debug", "--set=plugins.envoy_ext_authz_grpc.path=envoy/authz/allow", "--set=decision_logs.console=true", "--log-format=json-pretty"]