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

## Best Practice

Keep one subform page and add context-aware trigger guards for posted document types:

1. Exit early in `OnDrillDown` for posted records
2. Return `false` in `OnInsertRecord` for posted records
3. Return `false` in `OnDeleteRecord` for posted records
4. Keep field-level `Editable = false` only as UI signaling, not as the sole protection

See sample: `protect-subform-operations-for-posted-documents.good.al`.

## Anti Pattern

Creating separate draft/posted subform pages, or relying only on page-level `Editable = false` without trigger-level enforcement.

This duplicates layout code, increases maintenance cost, and can leave operation paths insufficiently protected.

See sample: `protect-subform-operations-for-posted-documents.bad.al`.
