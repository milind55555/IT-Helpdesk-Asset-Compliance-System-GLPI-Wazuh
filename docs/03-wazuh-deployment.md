# Wazuh deployment and endpoint onboarding

## Deployment approach

Deploy the Wazuh central components on a dedicated Linux VM or supported host. The exact package names, supported operating systems, installation script version, and resource requirements change over time. Follow the official current documentation rather than copying an old installer command:

- Quickstart: https://documentation.wazuh.com/current/quickstart.html
- Installation guide: https://documentation.wazuh.com/current/installation-guide/index.html
- Agent deployment: https://documentation.wazuh.com/current/installation-guide/wazuh-agent/index.html

For a small disposable lab, the official quickstart/all-in-one installation is usually the easiest starting point. Restrict dashboards and manager interfaces to a trusted lab network.

## Agent onboarding process

1. Confirm written permission to monitor the test endpoint.
2. Record the endpoint owner, asset ID, OS, hostname, and purpose in the asset register.
3. Install the Wazuh agent using the package/installer appropriate to the endpoint OS and current manager version.
4. Configure the manager address and enroll/authenticate the agent using the official procedure.
5. Start the agent and verify that the manager shows it as active.
6. Apply the example configuration from `../wazuh/agent/ossec.conf.example` carefully; merge relevant blocks rather than replacing a full vendor-generated configuration blindly.
7. Enable inventory, SCA, FIM, and required event sources. Tune frequency and monitored paths to avoid unnecessary volume.
8. Confirm events are received and timestamps/host identity are correct.
9. Document the agent ID, endpoint asset ID, date, and validation result.

## Detection and compliance validation

- Inventory: confirm OS, hardware, packages, and relevant system details are reported.
- SCA: run an applicable policy and review failed/passed checks; document exceptions.
- FIM: create or modify a controlled test file in a monitored lab folder and confirm the event.
- Vulnerability detection: verify inventory is being collected and review available CVE findings.
- Windows Defender: subscribe to the relevant Defender Operational event channel if required; verify events using a safe lab test or existing benign events.

Do not disable antivirus, introduce malware, or run destructive tests to create alerts. A Wazuh agent alone does not prove antivirus coverage or patch compliance. Evidence must show the endpoint configuration, active telemetry, scan results, and remediation status.

## Sample rule validation

Copy selected rules from `../wazuh/manager/local_rules.xml.example` into the manager's local rules file only after backing up the original. Validate XML and event matching with `wazuh-logtest`, restart/reload as documented for your installed release, then verify the alert in the dashboard. Rule fields may differ by event decoder and agent version.
