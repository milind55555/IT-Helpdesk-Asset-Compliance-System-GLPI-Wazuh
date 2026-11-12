# IT Helpdesk, Asset & Compliance Lab — GLPI + Wazuh

A hands-on lab repository for building an ITIL-style service desk and asset register with **GLPI**, monitoring endpoints with **Wazuh**, documenting support operations through **8 SOPs**, and mapping evidence to selected **ISO/IEC 27001:2022** controls.

> **Lab status:** This repository contains deployment files, configuration examples, checklists, scripts, and runbooks. It does not contain a running GLPI/Wazuh instance, real endpoint telemetry, or proof of certification. Deploy the lab, validate each control, and add your own redacted screenshots/evidence before describing implementation outcomes on a CV.

## Architecture

```text
                        IT / Support Team
                               |
                         Web browser / HTTPS
                               |
                      +-------------------+
                      |       GLPI        |
                      | Tickets / SLAs    |
                      | Assets / Changes  |
                      +---------+---------+
                                |
                         MySQL database
                                |
              +-----------------+-----------------+
              |                                   |
        Asset inventory                     Ticket records

  Windows endpoints / Linux endpoints
          |                  |
      Wazuh agent        Wazuh agent
          |                  |
          +--------+---------+
                   |
           +-------v--------+
           | Wazuh Manager  |
           | Alerts / SCA   |
           | Inventory /   |
           | Vulnerability |
           +-------+--------+
                   |
             Wazuh Dashboard

       Analysts correlate GLPI tickets
       with Wazuh endpoint alerts.
```

## Repository layout

```text
.
├── docker/                  # GLPI + MySQL Docker Compose deployment
├── docs/                    # Architecture, setup, workflows, security, backup
│   └── sops/                 # 8 support and operations SOPs
├── templates/               # Asset register, ticket, change, access review
├── scripts/                 # PowerShell endpoint inventory collection
├── wazuh/
│   ├── agent/                # Agent ossec.conf example
│   └── manager/              # Local detection rule examples
├── assets/screenshots/       # Add your own redacted lab screenshots
├── .env.example
├── .gitignore
└── README.md
```

## Lab components

| Area | What you configure | Evidence to capture |
|---|---|---|
| GLPI helpdesk | Incident, service request, and change categories; priorities; assignment groups; SLAs | Ticket lifecycle and SLA screenshots |
| Asset register | Laptops, printers, cameras, ownership, location, warranty, lifecycle | Asset list with sample/lab assets |
| Knowledge base | Eight SOPs and troubleshooting guides | Published knowledge articles |
| Wazuh SIEM/XDR | Agent enrollment, inventory, security configuration assessment, alert monitoring | Agent status, alerts, SCA and inventory views |
| Compliance | Selected ISO/IEC 27001:2022 control checklist and evidence tracker | Completed checklist with evidence references |
| Operations | Backup/restore, access reviews, change records | Test restore record and review log |

## Quick start: GLPI with Docker Compose

Prerequisites: Docker Engine or Docker Desktop with the Compose plugin. The GLPI stack in `docker/compose.yaml` is intended for a local lab.

1. Change to the repository's `docker` directory.
2. Copy `.env.example` to `.env` and replace every example password with a unique random value.
3. Start the services:

   ```bash
   docker compose --env-file .env up -d
   docker compose ps
   docker compose logs -f glpi
   ```

4. Browse to `http://localhost:8080` (or the host/port you configured).
5. Complete the GLPI first-run wizard if the image does not complete the initial installation automatically. Use the database values from your local `.env` file; the database host inside Compose is `db`.
6. Change/remove any default application accounts, enable HTTPS before remote access, and configure outgoing mail only with a dedicated test mailbox.

Stop the lab:

```bash
docker compose --env-file .env down
```

Persistent data is stored in Docker named volumes. **`docker compose down -v` deletes the database and GLPI data volumes**; do not use it unless you intentionally want to reset the lab.

## Quick start: Wazuh

Run Wazuh on a separate Linux VM or supported deployment host. Follow the current official Wazuh installation guide in [docs/03-wazuh-deployment.md](docs/03-wazuh-deployment.md), because supported versions and installation commands change. Enroll a Windows or Linux test endpoint, then adapt `wazuh/agent/ossec.conf.example` to your manager address. Review the sample local rules in `wazuh/manager/local_rules.xml.example` and validate them with `wazuh-logtest` before using them.

Wazuh capabilities used in this lab:

- Agent inventory (hardware, OS, packages, processes, network configuration).
- Security Configuration Assessment (SCA) against supported policies.
- File Integrity Monitoring (FIM) for selected sensitive paths.
- Vulnerability detection based on collected inventory and supported feeds.
- Security-event collection and alert triage.

> Antivirus and patch compliance are not automatically guaranteed by installing Wazuh. Visibility depends on endpoint OS, enabled log sources, policies, agent permissions, and the integrations configured. Validate Windows Defender or other endpoint protection telemetry separately, and use inventory/vulnerability findings as evidence rather than claiming every patch is installed.

## Suggested implementation sequence

1. Deploy GLPI and complete its initial configuration.
2. Configure support groups, categories, priorities, SLAs, and the incident/request/change flows.
3. Add a small set of clearly labelled test assets using `templates/asset_register.csv`.
4. Publish the eight SOPs from `docs/sops/` in the GLPI knowledge base.
5. Deploy Wazuh manager and enroll one test Windows endpoint and/or Linux endpoint.
6. Enable inventory, SCA, FIM, vulnerability detection, and relevant event collection.
7. Test a benign alert (for example, a controlled file-integrity change in a lab folder) and document the triage workflow.
8. Complete the ISO control checklist and attach evidence references.
9. Test backup and restore, then capture redacted screenshots.

## Helpdesk workflow and sample SLA

See [docs/04-glpi-workflows-and-slas.md](docs/04-glpi-workflows-and-slas.md). The response/resolution targets are **illustrative lab values**, not contractual or regulatory requirements. Adjust them to the organisation's service hours and business impact.

## PowerShell endpoint inventory

Run `scripts/Collect-EndpointInventory.ps1` on a Windows lab endpoint. It collects basic computer, OS, BIOS serial, CPU, memory, and network information into a CSV. Review the output before importing it into GLPI; serial numbers and host details may be sensitive. The script does not install software or make system changes.

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\Collect-EndpointInventory.ps1 -OutputPath .\endpoint-inventory.csv
```

## Security and safe-use notes

- Never commit `.env`, passwords, API tokens, certificates, private keys, real user data, or unredacted security alerts.
- Do not expose the GLPI database port or Wazuh management ports directly to the public internet.
- Use a private lab network, strong credentials, MFA where supported, and HTTPS for browser access.
- Keep GLPI, MySQL, Wazuh, agents, and operating systems patched.
- Use synthetic users and non-production endpoints. Obtain permission before monitoring any device.
- Take backups before upgrades. Test restore procedures rather than relying only on successful backup jobs.
- Sample Wazuh rules are starting points; validate rule syntax and field names against the events generated by your installed agent/manager versions.

## GitHub upload

```bash
git init
git add .
git status                 # verify .env and sensitive data are not staged
git commit -m "Add GLPI helpdesk and Wazuh compliance lab"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/it-helpdesk-asset-compliance.git
git push -u origin main
```

Create an empty GitHub repository first. Add your own redacted screenshots under `assets/screenshots/` and link them from the README only after the lab is implemented.

## Official references

- GLPI official Docker images and Compose usage: https://github.com/glpi-project/docker-images
- GLPI documentation: https://glpi-install.readthedocs.io/
- Wazuh documentation: https://documentation.wazuh.com/current/
- Wazuh installation guide: https://documentation.wazuh.com/current/quickstart.html
- Wazuh agent configuration: https://documentation.wazuh.com/current/user-manual/reference/ossec-conf/index.html
- ISO/IEC 27001:2022 overview: https://www.iso.org/standard/27001

## License

MIT for the original scripts and documentation in this repository. GLPI, Wazuh, Docker images, and other third-party components remain subject to their respective licenses and terms.
