---
bc-version: [all]
domain: style
keywords: [subform, read-only, posted-document, trigger, insert-record, delete-record, drill-down]
technologies: [al]
countries: [w1]
application-area: [all]
---

## Description

Subforms reused across draft and posted documents must enforce read-only behavior for posted records through trigger guards, not by cloning pages.

Use document type checks in interaction and record-operation triggers (`OnDrillDown`, `OnInsertRecord`, `OnDeleteRecord`) so posted documents cannot be changed while draft documents remain editable.

Be careful in `OnDrillDown`: a blind `exit;` for posted records can block users from viewing existing comments. Posted mode should still allow read-only viewing.

## Best Practice

Keep one subform page and add context-aware trigger guards for posted document types:

1. In `OnDrillDown`, route posted records to a read-only viewer, then `exit;`
2. Return `false` in `OnInsertRecord` for posted records
3. Return `false` in `OnDeleteRecord` for posted records
4. Keep field-level `Editable = false` only as UI signaling, not as the sole protection

See sample: `protect-subform-operations-for-posted-documents.good.al`.

## Anti Pattern

Creating separate draft/posted subform pages, relying only on page-level `Editable = false`, or using a blind `exit;` in `OnDrillDown` that prevents users from opening comment content in posted mode.

This duplicates layout code, increases maintenance cost, and can leave operation paths insufficiently protected.

See sample: `protect-subform-operations-for-posted-documents.bad.al`.
