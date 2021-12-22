## THIS REPO IS NOW PART OF A HANDS ON WORKSHOP RUN BY RED HAT
### Details on that here: [http://redhatgov.io/workshops/openshift_service_mesh/](http://redhatgov.io/workshops/openshift_service_mesh/)
### Active development here has stopped, find [maintenance updates happening here](https://github.com/RedHatGov/service-mesh-workshop-code)

- Working services: app-ui, boards, context-scraper, profile service, and Auth via SSO
- Working platform components integrated: Istio

Latest tested OpenShift version:
[![OpenShift Version][openshift-heximage]][openshift-url]

# Microservices
Microservices, also known as the microservice architecture, is a software development technique that structures an application as a collection of loosely coupled services. Microservice architectures enable the continuous delivery/deployment/scaling of complex applications.

This git repo showcases an app built using the microservice architecture with several intentionally simple components. The goal is to showcase an example way to develop and manage microservices using a container platform. However, this example is not meant to be prescriptive - obviously your team and business goals will drive your specific architecture and environment. The technology should translate and hopefully you will find this repo helpful.

## Why microservices?
Agility. Deliver application updates faster. Isolate and fix bugs easier. Done right, a microservices architecture will you help to meet several important non-functional requirements for your software:
* scalability
* performance
* reliability
* resiliency
* extensibility
* availability

# This Repo
This repo is an example microservices based application. It's core functionality is a paste board. It's an intentionally simple example that could be the prototype for something bigger like a [Pinterest](https://www.pinterest.com/), a [PasteBin](https://pastebin.com/), a [CodePen](https://codepen.io/pens/), or even a [Ranker](https://www.ranker.com/).

## Current screenshot
![Screenshot](design/screenshots/2019-04-19_1042.png?raw=true)


## Here's the initial design for the architecture:

![Diagram](design/highlevel-arch.png)
*In the above diagram web app users are accessing the APP UI service which in turns calls chains of microservices on the backend. Optionally the backend services have calls to API services managed via 3scale (and future access to the services from mobile apps could go through the 3scale API management capability as well). A single sign on capability provides security around user access to the application via OpenID Connect (OIDC) and OAuth2. The Istio service mesh is shown too - it provides core capabilities for traffic management and security of the services as well as detailed observation into the application's operational status. All of this is running on top of an OpenShift cluster. (Additional service interactions and deployment details are in other diagrams).*

![Diagram](design/ocp-arch.png)
*The above diagram shows how the services are related and additionally how they are abstracted from the underlying infrastructure (compute and storage) when deployed on top of an OpenShift cluster. (The abstraction means this can be run in AWS, GCP, Azure, on-prem, or in some hybrid combination).*

###### :information_source: This example is based on OpenShift Container Platform version 4.3.

## How to run this?
First off, you need access to an OpenShift cluster. Don't have an OpenShift cluster? Download Code Ready Containers (CRC) for free here: https://developers.redhat.com/products/codeready-containers/overview. You will need a fairly beefy machine to run *everything* on the same machine, so I'd recommend you expose extra CPUs and Mem to CRC when you start your cluster - I actually haven't tried it so YMMV.

You will also need to install/configure the additional dependencies you plan to leverage. We assume you want to run these in the cluster, so you might need to tweak the install scripts to move things outside or to use already existing shared services in different namespaces.
   - Service Mesh (Istio)
   - 3Scale - FUTURE
   - Kafka - FUTURE
   - Caching - FUTURE

To install everything:
- [Follow instructions here](./deployment/install/)

Once you have the basic app up and running, how about trying out [some demos](./deployment/demos)


## About the code / software architecture
The parts in action here are:
* A set of microservices that together provide full application capability for a cut and paste board (in code folder)
* Key platform components that enable this example:
    * container building via s2i
    * service load balancing
    * service autoscaling
    * service health checks and recovery
    * dynamic storage allocation and persistent volume mapping
    * Kubernetes operators to manage middleware components (e.g. Kafka)
    * advanced service traffic management via Istio
    * additional service observability via Istio
* Middleware components in this example:
    * API management and metrics (on the external facing APIs)
    * authorization and application security via SSO
    * Kafka for scalable messaging


## This demo is now part of a hands-on workshop from Red Hat!
[Click here to check it out](http://redhatgov.io/workshops/openshift_service_mesh/)


## References, useful links, good videos to check out
### Microservices
* [Microservices at Spotify Talk](https://www.youtube.com/watch?v=7LGPeBgNFuU)
* [Microservices at Uber Talk](https://www.youtube.com/watch?v=kb-m2fasdDY)
* [Mastering Chaos Netflix Talk](https://youtu.be/CZ3wIuvmHeM)
* [Red Hat Developer's Learning - Microservices](https://developers.redhat.com/learn/microservices/)
### Istio Service Mesh
* [What is Istio?](https://istio.io/docs/concepts/what-is-istio/)
* [Red Hat Developer's Istio Free Book](https://developers.redhat.com/books/introducing-istio-service-mesh-microservices/)
* [Free Hands-on with Istio](https://learn.openshift.com/servicemesh)
### Single Sign On
* [Keycloak SSO](https://www.keycloak.org/)

## Contributing
[See guidelines here](./CONTRIBUTING.md). But in general I would love for help with 2 things.
1. Use this repo and [report issues][1], even fix them if you can.
2. Have [discussions][2] on topics related to this repo. Things like "Securing services", or "Microservices vs SOA"... 
   - currently doing this in issues (and tagging them as a `discussion`).

## License
Apache 2.0.

[1]: https://github.com/dudash/openshift-microservices/issues
[2]: https://github.com/dudash/openshift-microservices/labels/discussion

[openshift-heximage]: https://img.shields.io/badge/openshift-4.8-BB261A.svg
[openshift-url]: https://docs.openshift.com/container-platform/4.8/welcome/index.html
