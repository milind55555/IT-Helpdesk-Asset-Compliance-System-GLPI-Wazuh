# ISO/IEC 27001:2022 control checklist (lab alignment aid)

This is a practical evidence checklist inspired by selected ISO/IEC 27001:2022 controls. It is not the full standard, a statement of conformity, an audit opinion, or certification advice. Confirm applicability through the organisation's risk assessment and Statement of Applicability (SoA). Control wording below is paraphrased; consult the licensed standard and your auditor for authoritative requirements.

| Control reference | Theme | Lab evidence to collect | Status |
|---|---|---|---|
| 5.9 | Inventory of information and other associated assets | GLPI asset register, owner, lifecycle and reconciliation record | Not assessed |
| 5.15 | Access control | GLPI profiles/roles and access approval record | Not assessed |
| 5.16 | Identity management | User provisioning/deprovisioning records and unique identity review | Not assessed |
| 5.17 | Authentication information | Password/MFA configuration evidence; secrets handling process | Not assessed |
| 5.18 | Access rights | Access request approvals and periodic review log | Not assessed |
| 5.24 | Information security incident management planning and preparation | Incident categories, escalation contacts, response SOP | Not assessed |
| 5.25 | Assessment and decision on information security events | Wazuh alert triage and ticket linkage | Not assessed |
| 5.26 | Response to information security incidents | Incident handling record and containment/remediation evidence | Not assessed |
| 5.28 | Collection of evidence | Timestamped alert/ticket records and evidence handling notes | Not assessed |
| 8.8 | Management of technical vulnerabilities | Wazuh vulnerability findings, prioritisation, remediation tracking | Not assessed |
| 8.9 | Configuration management | Baseline configurations and approved change records | Not assessed |
| 8.13 | Information backup | Backup job logs and successful restore-test record | Not assessed |
| 8.15 | Logging | Centralised log-source and retention configuration | Not assessed |
| 8.16 | Monitoring activities | Wazuh agent health, alerts, SCA and monitoring review | Not assessed |
| 8.32 | Change management | GLPI change records, approvals, validation and rollback details | Not assessed |

## Evidence quality

For each control, record: evidence ID, system/source, owner, collection date, review date, result, exception, corrective action, and approval. Screenshots must be redacted. A screenshot alone may not demonstrate that a control is operating consistently; retain relevant records and test results.

## Review questions

- Is the control applicable based on risk and the SoA?
- Is there an assigned control owner?
- Is the configuration documented and approved?
- Is operation evidenced over time, not just at one point?
- Are exceptions, risk acceptance, and remediation tracked?
