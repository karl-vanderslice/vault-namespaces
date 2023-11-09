# Vault Namespaces

Example of setting Vault up with least privilege, with shared Kubernetes authentication.

In this demo, we use the following infrastructure:

- HashiCorp Vault Enterprise
- Okta

## Organizational (Namespace) Design

- Org name: Wayne Industries (WAYNE)
- Sub organizations:
    - ACME Co (ACME):
      - ACME Widgets
      - ACME Retail
      - ACME Billing
    - Omni Consumer Products (OCP) - a recent company acquisition 
    - Oscorp (OSC), an established child company

### Teams

- WAYNE Central Identity Cyber Team - owns and operates Vault as a Service for their customers
- WAYNE FinOps - owns financial visibility into Vault

WAYNE Central Identity Cyber Team (WCICT) provides Vault as a service for these customer profiles:

- Self-Service, Vault as a Service (customer with a dedicated namespace and guard rails)
- Fully Managed Vault consumer (Vault credentials vendeded through a system such as Developer portal, etc.)

## References
- https://developer.hashicorp.com/vault/tutorials/enterprise/namespace-structure
- https://developer.hashicorp.com/vault/tutorials/recommended-patterns/pattern-policy-templates