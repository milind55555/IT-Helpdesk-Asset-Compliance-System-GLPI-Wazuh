# SOP-03: Outlook mail/calendar synchronisation

**Purpose:** Resolve common Outlook synchronisation issues without exposing mailbox contents.

## Procedure
1. Record Outlook edition/build, OS, connectivity, scope (mail/calendar/contacts), and exact error.
2. Check service health through the approved Microsoft 365 admin channel, if available.
3. Confirm the user can sign in through the organisation-approved webmail route; never request their password or MFA code.
4. Check system date/time, network/VPN state, mailbox quota, and whether the issue occurs on another approved client.
5. Restart Outlook and check for offline mode, paused synchronisation, or a large pending queue.
6. Review supported profile/cache repair steps for the installed Outlook edition. Obtain user approval before removing/recreating a profile.
7. Avoid deleting local data files or resetting credentials without a documented backup/recovery plan.
8. Validate mail and calendar updates with a non-sensitive test item; record the outcome.

**Escalate:** Tenant-wide service degradation, suspected account compromise, data loss, or repeated authentication failures.
