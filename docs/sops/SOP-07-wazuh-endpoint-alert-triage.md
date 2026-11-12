# SOP-07: Wazuh endpoint alert triage

**Purpose:** Triage endpoint alerts and link security findings to a controlled helpdesk/security case.

## Procedure
1. Record alert ID, rule/description, severity, endpoint/agent ID, timestamp, and relevant asset ID.
2. Validate the alert source and time range; check whether the endpoint is expected to be online and reporting.
3. Review related alerts, inventory, SCA results, vulnerability findings, and approved endpoint protection telemetry.
4. Determine scope: one endpoint, multiple endpoints, or a shared identity/service.
5. Preserve relevant evidence and restrict ticket visibility where sensitive details are present.
6. For suspected compromise, follow the organisation's incident response authority and containment playbook. Do not isolate a production system without approval unless the incident procedure explicitly authorises it.
7. Assign remediation owner and due date; document containment, eradication, recovery, and validation steps as applicable.
8. Close only after evidence supports resolution and required approvals are complete.

**Safety:** Do not download, execute, or create malware to test this procedure. Use benign controlled tests in an isolated lab.
