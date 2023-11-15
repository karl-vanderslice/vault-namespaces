# Vault Namespaces

Example of setting Vault Enterprise up with least privilege.

## Organizational (Namespace) Overview & Design

WAYNE Central Identity Cyber Team (WCICT) provides Vault as a service for these customer profiles:

- Self-Service, Vault as a Service (customer with a dedicated namespace and guard rails)
- Fully Managed Vault consumer (Vault credentials vended through a system such as Developer portal, etc.)

- Org name: Wayne Industries (WAYNE)
- Sub organizations:
    - ACME Co (`Self Service`):
      - ACME Widgets
      - ACME Retail
      - ACME Billing
    - Omni Consumer Products (OCP) - a recent company acquisition `VaaS Vault as a Service`
    - Oscorp (OSC), an established child company/brand `VaaS Vault as a Service`

### Teams

- WAYNE Central Identity Cyber Team - owns and operates Vault as a Service for their customers
- WAYNE FinOps - owns financial visibility into Vault

## TODO

- Kubernetes
- OIDC/Okta and role mapping
- MFA

## References
- https://developer.hashicorp.com/vault/tutorials/enterprise/namespace-structure
- https://developer.hashicorp.com/vault/tutorials/recommended-patterns/pattern-policy-templates