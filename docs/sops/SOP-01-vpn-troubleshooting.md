# SOP-01: VPN connectivity troubleshooting

**Purpose:** Restore authorised remote access while preserving security controls.

**Scope:** Lab or organisation-approved VPN clients and gateways.

## Procedure
1. Verify the user identity and confirm the VPN service is approved for that user/device.
2. Capture the exact error, timestamp, client version, network type, and affected asset ID in the ticket.
3. Check local internet connectivity and system date/time.
4. Confirm the VPN client is updated and the user is using the approved profile/gateway.
5. Check account status, MFA challenge, certificate expiry, and access group membership with the authorised administrator.
6. Review gateway status and relevant authentication logs; do not ask the user to share passwords or MFA codes.
7. If connected but internal resources fail, check assigned routes, DNS resolution, split-tunnel policy, and target service availability.
8. Apply only approved configuration changes. Reconnect and test an approved internal resource.
9. Record the root cause, actions, validation, and any escalation. Close after user confirmation.

**Escalate:** Multiple users affected, suspected credential compromise, repeated MFA prompts, or unrecognised VPN profile changes.
