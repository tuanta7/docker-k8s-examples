# Kong Dev Environment

- Install guide: [Install Kong Gateway](https://developer.konghq.com/gateway/install/#docker)
- Official Kong plugin template: [Kong/kong-plugin](https://github.com/Kong/kong-plugin)
- Custom plugin guide: [Kong Custom Plugins](https://developer.konghq.com/custom-plugins/)
- Typedefs: [Source code](https://github.com/Kong/kong/blob/master/kong/db/schema/typedefs.lua)

## 1. Gateway Modes

- Traditional Mode
- Declarative Mode (DB-less): Kong can operate with no database, using a single YAML or JSON file that defines all entities. Entity management occurs by editing the file then reloading the gateway

## 2. Kong Ingress Controller

In Kubernetes environments, Kong entities can be defined using Kubernetes resources such as KongIngress, KongPlugin, KongConsumer, HTTPRoute (Gateway API), Ingress. These CRDs are translated by the Kong Ingress Controller into Kong configuration without using the Admin API directly.

## 3. Konnect

Kong Konnect is a unified API platform that manages APIs, LLMs, events, and microservices, consolidating API and connectivity management. It is delivered as a Software as a Service (SaaS) control plane for Kong Gateway and associated services.

- It manages an entire API ecosystem across potentially multiple clouds and environments from a single, unified interface.
- It also provides several built-in applications that run on top of the platform to help manage, monitor, and secure API ecosystem, as well as provide a customizable developer experience.
