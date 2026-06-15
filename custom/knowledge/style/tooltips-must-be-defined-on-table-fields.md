---
bc-version: [all]
domain: style
keywords: [tooltip, tooltips, table-field, page-field]
technologies: [al]
countries: [w1]
application-area: [all]
---

## Description

ToolTips must be defined on table fields rather than page fields.

Without this rule, generated AL code often places ToolTips on page controls, resulting in duplicated tooltip definitions across multiple pages and inconsistent descriptions for the same field.

## Best Practice

Define the ToolTip property on the table field.

Pages should inherit the ToolTip automatically from the underlying table field. This creates a single source of truth, reduces duplication, and keeps tooltip text consistent across all pages that expose the field.

## Anti Pattern

Defining ToolTip properties directly on page fields when the tooltip describes the underlying table field.

This duplicates metadata, increases maintenance effort, and can lead to inconsistent tooltip text across pages.