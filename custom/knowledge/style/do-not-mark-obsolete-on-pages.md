---
bc-version: [all]
domain: style
keywords: [obsolete, page-field, table-field, deprecation, api-page]
technologies: [al]
countries: [w1]
application-area: [all]
---

## Description

Do not mark fields as obsolete on page extensions or pages. Obsolescence should be declared only on the table. When a field is deprecated, delete it from all pages and mark it obsolete on the table only.

**Exception:** For `PageType = Api` pages, you may mark the field obsolete on the page to maintain API contract visibility. For all other page types (Card, List, Document, etc.), simply remove the field.

This prevents:
- Confusing UI warnings for end users who have no control over the data model
- Inconsistency between page and table-level obsolescence
- Unclear deprecation signals in page definitions

## Best Practice

1. Mark the field `ObsoleteState = Pending` with `ObsoleteReason` and `ObsoleteTag` on the **table or table extension only**
2. **Delete the field from all standard pages** (Card, List, Document, Worksheet, etc.)
3. For **API pages only**, you may optionally retain the field with `ObsoleteState = Pending` to signal API deprecation to consumers

See sample: `do-not-mark-obsolete-on-pages.good.al`.

## Anti Pattern

Marking a field as obsolete on a page extension, creating duplicate deprecation signals and confusing users.

See sample: `do-not-mark-obsolete-on-pages.bad.al`.
