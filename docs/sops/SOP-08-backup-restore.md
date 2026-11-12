# SOP-08: Backup and restore verification

**Purpose:** Verify that GLPI records and related persistent data can be recovered.

## Procedure
1. Identify the system, data scope, owner, backup policy, retention, RPO/RTO, and latest successful backup ID.
2. Confirm backup logs and storage location; check encryption and access restrictions.
3. Select an isolated restore target matching the supported application/database versions.
4. Restore database and corresponding persistent application data/configuration using the approved runbook.
5. Validate application login, representative tickets, assets, attachments, and integrations.
6. Record actual recovery duration, recovery point, validation results, errors, and corrective actions.
7. Obtain service owner sign-off and securely remove temporary restore data when no longer needed.
8. Update the backup/restore log and open follow-up tickets for failures.
