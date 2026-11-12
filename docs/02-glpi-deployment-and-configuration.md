# GLPI deployment and initial configuration

## Deployment

Use `docker/compose.yaml` and `docker/.env.example`. Follow `docker/README.md`. Use a private host-only/NAT lab network initially.

## Initial setup checklist

- [ ] Complete the web installation wizard and verify database connectivity.
- [ ] Change/remove all default accounts and set strong unique passwords.
- [ ] Set the correct timezone, language, and organisation details for the lab.
- [ ] Configure outbound mail with a dedicated test mailbox; avoid real user mailboxes.
- [ ] Create support groups such as Service Desk, Endpoint Support, Network Support, and Security Operations.
- [ ] Create technician and requester profiles with least privilege.
- [ ] Configure ticket categories and assignment rules.
- [ ] Configure priorities and SLAs using the sample matrix in `04-glpi-workflows-and-slas.md`.
- [ ] Enable and test the knowledge base.
- [ ] Define asset types, locations, statuses, and lifecycle fields.
- [ ] Record a test laptop, printer, and camera; use fictitious data.
- [ ] Configure HTTPS before allowing access from other machines.
- [ ] Schedule and test database/application backups.

## Ticket categories

Suggested categories: Account & Access, Email & Collaboration, Network & VPN, Printing, Hardware, Software, Security Alert, and Change Request.

## Asset lifecycle values

Requested → In Stock → Assigned → In Repair → Retired → Disposed. Add a disposal approval/evidence reference before marking an asset disposed.

## Integrations

If you later integrate LDAP/Active Directory, SMTP, inventory agents, or Wazuh alerts with GLPI, configure service accounts with least privilege and document the integration owner, credential rotation, and failure procedure. Treat integrations as optional until tested.
