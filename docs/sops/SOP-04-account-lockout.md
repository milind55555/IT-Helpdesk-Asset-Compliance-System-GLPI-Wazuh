# SOP-04: Account lockout investigation

**Purpose:** Restore legitimate access and identify the source of repeated lockouts.

## Procedure
1. Verify requester identity using the approved identity-verification process.
2. Record username, affected services, approximate lockout time, device(s), and ticket ID. Do not record passwords.
3. Check account enabled/locked status and lockout policy using authorised directory tools.
4. Review sign-in/security logs for source device, time, and authentication method.
5. Check common causes: stale saved credentials, mapped drives, scheduled tasks, mobile mail clients, services, or another logged-in session.
6. Confirm whether the pattern indicates brute force or an unfamiliar source. Escalate security indicators before repeatedly unlocking the account.
7. After identifying the cause, unlock/reset only through approved procedures and require the normal secure sign-in/MFA process.
8. Confirm successful access and record evidence, action, and follow-up.

**Escalate immediately:** Unknown source, multiple accounts targeted, impossible travel, suspected phishing, or privileged account lockout.
