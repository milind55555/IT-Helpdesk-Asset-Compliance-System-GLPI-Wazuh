# Architecture and scope

## Objective

Create a small IT operations lab demonstrating a service desk, asset inventory, endpoint visibility, operational knowledge, and control evidence management.

## Logical components

- **GLPI:** IT service management, incidents, service requests, changes, assets, contracts/licenses (where applicable), and knowledge base.
- **MySQL:** GLPI relational data store. Keep it on an internal Docker network; do not publish port 3306.
- **Wazuh manager/indexer/dashboard:** Central endpoint monitoring, alerting, security configuration assessment, inventory, and vulnerability visibility.
- **Wazuh agents:** Installed only on test endpoints where monitoring has been authorized.
- **Support analyst:** Uses ticket IDs to correlate user-reported symptoms with Wazuh alerts and asset records.

## Lab sizing (suggested, not a vendor minimum)

| Component | Suggested lab allocation |
|---|---|
| GLPI + database | 2 vCPU, 4 GB RAM, 25 GB disk |
| Wazuh all-in-one | 4 vCPU, 8 GB RAM, 50 GB disk for a small test |
| Windows endpoint | 2 vCPU, 4 GB RAM |
| Optional Linux endpoint | 1–2 vCPU, 2 GB RAM |

Actual requirements depend on agent count, event volume, retention, enabled modules, and product version. Check current vendor sizing guidance before deployment.

## Trust boundaries

- Keep the GLPI database private to the Compose network.
- Limit access to GLPI and Wazuh dashboards to the lab/admin network.
- Restrict agent-to-manager communication to required ports and trusted networks.
- Use separate administrator and analyst identities where supported.
- Treat device serials, usernames, IP addresses, logs, and ticket descriptions as potentially sensitive.

## Scope exclusions

This lab is not a production design, penetration test, formal ISO audit, or certification assessment. No real SLA commitments are implied.
