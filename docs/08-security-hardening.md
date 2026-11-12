# Security hardening checklist

- [ ] Use unique, strong secrets for GLPI database and administrator accounts.
- [ ] Keep `.env` out of Git; check staged files before every push.
- [ ] Use HTTPS and a trusted certificate when accessing dashboards beyond localhost.
- [ ] Restrict GLPI, Wazuh dashboard, and manager ports to trusted subnets/firewall rules.
- [ ] Do not expose MySQL to host/public networks.
- [ ] Use least-privilege GLPI profiles and Wazuh access roles.
- [ ] Enable MFA for privileged accounts where supported by the identity provider/application edition.
- [ ] Patch hosts, containers, GLPI, Wazuh components, and agents on a defined schedule.
- [ ] Back up application data and database; encrypt off-host backups; test restores.
- [ ] Define ticket/log retention and protect exports containing personal or security information.
- [ ] Review stale accounts, agents, API tokens, and service credentials.
- [ ] Record configuration changes, approvals, and rollback plans.
- [ ] Monitor agent health and investigate endpoints that stop reporting.

This is a starter hardening checklist, not an exhaustive security baseline.
