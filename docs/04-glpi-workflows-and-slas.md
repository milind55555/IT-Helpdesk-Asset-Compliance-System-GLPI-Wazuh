# GLPI ticket workflows and sample SLAs

The following targets are examples for a demonstration environment, not a promise of service or a legal/industry standard. Define service hours, exclusions, pause conditions, and escalation ownership before adopting any SLA.

## Incident workflow

New → Triage → Assigned → In Progress → Pending User/Vendor → Resolved → Closed.

Required fields: requester, affected asset/service, category, impact, urgency, priority, summary, diagnostic notes, assignment group, timestamps, resolution, and closure confirmation.

## Service request workflow

Submitted → Approval (if needed) → Assigned → Fulfilment → User Validation → Closed.

Examples: software access, new account, shared mailbox, printer access, VPN access, and standard equipment request.

## Change workflow

Draft → Risk/Impact Assessment → Approval → Scheduled → Implementing → Validation → Closed (or Rolled Back).

Every change record should include business reason, affected assets/services, implementation plan, test/validation plan, rollback plan, approver, change window, and outcome.

## Sample priority and SLA matrix

| Priority | Example impact | First response target | Resolution target |
|---|---|---:|---:|
| P1 Critical | Site-wide outage or confirmed major security incident | 15 minutes | 4 hours |
| P2 High | Department unable to perform a key function | 1 business hour | 1 business day |
| P3 Medium | Single user impaired; workaround exists | 4 business hours | 3 business days |
| P4 Low | General query or minor request | 1 business day | 5 business days |

Use business-hours calendars and pause/resume rules. A security incident may require a separate response playbook and escalation path rather than ordinary helpdesk resolution.

## Escalation examples

- P1: immediate service desk lead + infrastructure/security on-call.
- P2: assignment group lead after the response target is at risk.
- P3/P4: normal queue ageing and requester updates.

## Quality checks

- Every ticket has a category, priority, owner, and status.
- Pending tickets include a reason and next follow-up date.
- Resolved tickets include a clear action taken and user validation where appropriate.
- Changes have approval and rollback evidence.
- Tickets containing sensitive data are access-restricted and redacted in public screenshots.
