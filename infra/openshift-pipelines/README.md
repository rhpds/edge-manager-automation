# Pipelines Service
This chart deploys the pipelines service, which is used run complex workflows on an spoke or on a hub cluster. This can be used for application builds, testing, virtual machine template creation, and more.

## Required Values
This chart requires a few inputs to configure the service, see below for more information:

```yaml
# Define this to trigger installation of the service
pipelines:
  # What channel to use, where 'latest' is the default 
  channel: latest
```

## Service Deployment
This service can be deployed individually, however, it's recommended to deploy it alongside other services using the acp-standard-services parent application.

To deploy it individually, use the following command:
```
helm install -f /path/to/values.yaml pipelines-service charts/pipelines/
```