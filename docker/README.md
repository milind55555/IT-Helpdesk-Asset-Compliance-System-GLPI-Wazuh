# GLPI Docker deployment

1. Copy `.env.example` to `.env` in this directory.
2. Replace the two password values with different random secrets.
3. Start from this directory:

   ```bash
   docker compose --env-file .env up -d
   docker compose ps
   docker compose logs -f glpi
   ```

4. Open `http://localhost:8080` (change `GLPI_HTTP_PORT` to use another host port).
5. Complete the GLPI setup wizard if required. The database host is `db` and database credentials are in `.env`.

Data persists in `glpi_data` and `db_data`. `docker compose down` stops/removes containers but preserves volumes. `docker compose down -v` deletes lab data.

This Compose file is for a local learning lab only. Do not publish it directly to the internet. For a production-like setup, pin images to reviewed versions/digests, use TLS, restrict network access, centralize secrets, configure backups, and follow the official GLPI deployment guidance.
