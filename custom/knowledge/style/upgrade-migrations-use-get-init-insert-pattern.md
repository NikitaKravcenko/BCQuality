---
bc-version: [all]
domain: style
keywords: [upgrade, migration, get, init, insert, data-transfer, pattern, procedure]
technologies: [al]
countries: [w1]
application-area: [all]
---

## Description

When migrating data from one table to another during an upgrade, use the **Get-Init-Insert** pattern: check if the target record exists using `Get()` with the actual key values from the source, and only if it does not exist, call `Init()` to prepare the new record and then `Insert()`.

This pattern:
- Avoids unguarded `Insert()` that raises errors on duplicate keys
- Eliminates unnecessary `Modify()` calls for duplicates
- Makes the upgrade idempotent and safe to re-run
- Uses actual source values directly in the `Get()` check for clarity

## Best Practice

Use the source record values directly in the `Get()` call to check for duplicates. Only `Init()` and `Insert()` if the record does not exist.

See sample: `upgrade-migrations-use-get-init-insert-pattern.good.al`.

## Anti Pattern

Calling `Init()` before checking if the record exists, or attempting to handle Insert errors with a fallback `Modify()`.

See sample: `upgrade-migrations-use-get-init-insert-pattern.bad.al`.
