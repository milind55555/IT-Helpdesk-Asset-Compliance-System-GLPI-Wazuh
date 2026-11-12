# Wazuh configuration examples

- `agent/ossec.conf.example`: example Windows agent configuration snippets for manager connectivity, inventory, a small FIM test folder, and selected Windows event channels.
- `manager/local_rules.xml.example`: illustrative Windows Security/Defender event rules.

These are examples, not a universal production policy. Merge configuration carefully, confirm event-channel availability and decoder field names, and validate with `wazuh-logtest` against your own event samples. Review official Wazuh documentation for the exact configuration supported by your installed release.
