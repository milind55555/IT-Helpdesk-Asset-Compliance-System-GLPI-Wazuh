# GitHub evidence checklist

Before publishing the repository:

- [ ] Deploy GLPI locally and capture the dashboard.
- [ ] Create test incident, request, and change records with fictitious details.
- [ ] Capture the priority/SLA setup and ticket lifecycle.
- [ ] Add lab laptop, printer, and camera assets to GLPI.
- [ ] Publish all eight SOPs to the knowledge base or link the Markdown documents.
- [ ] Enroll at least one authorised Wazuh test endpoint.
- [ ] Capture agent status, inventory, one benign FIM alert, and an SCA result.
- [ ] Complete relevant rows in the ISO control checklist with evidence IDs.
- [ ] Perform a backup and restore test and record the outcome.
- [ ] Redact usernames, email addresses, IPs, serial numbers, tokens, and organisation details from screenshots.
- [ ] Confirm `.env`, backup files, logs, and inventory exports are not staged.

Put screenshots in `assets/screenshots/`. Add a date, what is shown, and the lab version to each screenshot caption. Never create fake screenshots or present sample CSV rows as proof of a real deployment.
