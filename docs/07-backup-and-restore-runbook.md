# GLPI backup and restore runbook

## Scope

Back up the GLPI database and persistent GLPI application data. The exact backup commands depend on the database image/version and storage platform. The commands below are a lab example; confirm the container and database names first.

## Database backup example

From the `docker/` directory, after configuring `.env`:

```bash
mkdir -p ../backups
# Avoid typing a password into shell history; use a protected environment or prompt.
docker compose --env-file .env exec -T db sh -c 'exec mysqldump -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE"' > ../backups/glpi-db-$(date +%F-%H%M).sql
```

Protect the resulting SQL file because it may contain personal or operational information. Encrypt backups before storing them outside the lab host.

## Persistent application data

The `glpi_data` Docker volume contains persistent GLPI data. Use a documented volume-backup method appropriate to your Docker host or storage platform. Stop GLPI for a consistent file-level copy unless the selected backup method guarantees consistency. Do not copy only the database and assume uploaded documents/configuration are included.

## Restore test

1. Create an isolated restore environment; never overwrite production or the only working lab copy.
2. Restore the database into a clean test database using a compatible MySQL version.
3. Restore the matching GLPI data volume/configuration backup.
4. Start GLPI and check login, ticket records, asset records, attachments, and plugins.
5. Record start/end time, backup identifier, errors, data validation, and operator in `templates/backup_restore_log.csv`.
6. Remove the test environment securely after sign-off.

## Recovery considerations

Document target recovery point (RPO), target recovery time (RTO), encryption key custody, retention, off-host copy, and restore owner. Example lab values must be explicitly labelled as assumptions rather than organisational commitments.
