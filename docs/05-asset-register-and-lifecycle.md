# Asset register and lifecycle management

Use `templates/asset_register.csv` as a starter data model. Enter only assets that exist in your lab or are clearly labelled synthetic sample records.

## Minimum asset fields

- Asset ID, asset type, manufacturer/model, serial number, hostname, operating system/firmware.
- Assigned user/team, location, purchase/received date, warranty end date, status.
- Criticality, network identifier (where appropriate), owner, last verification date.
- Wazuh agent ID/status (for monitored endpoints), GLPI record ID, disposal/evidence reference.

## Controls

1. Assign a unique asset ID when a device is received.
2. Record custody and assignment changes.
3. Review stock and assigned assets periodically.
4. Track repairs, warranty, loan devices, and retired equipment.
5. Remove/disable accounts and revoke access during offboarding or asset return.
6. Securely erase storage media before reassignment or disposal; retain approved disposal evidence.
7. Reconcile GLPI assets with endpoint inventory and Wazuh agents. Investigate missing, duplicate, or stale records.

## Reconciliation routine

Monthly in this sample lab: export GLPI assets, compare against endpoint discovery/Wazuh inventory, flag unknown agents and assets without owners, assign remediation owners, then record sign-off in `templates/asset_review_log.csv`.
