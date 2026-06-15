---
kind: action-skill
id: victor-versioning
version: 1
title: Victor Versioning - BC Version Migration Specialist (Wrapper)
description: Domain-focused wrapper for version upgrades and obsolescence handling. Goal keywords: upgrade, obsolescence, versioning, breaking changes, migration.
inputs: [pr-diff, file-path, repository, object-list]
outputs: [findings-report]
bc-version: [all]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Victor Versioning - BC Version Migration Specialist - Wrapper

## Source
Primary knowledge domains for this specialist:
- microsoft/knowledge/upgrade/, community/knowledge/upgrade/ when available
Also use custom/knowledge/style/ when it adds organization-specific guidance.
Use specialist guidance from custom/skills/victor-versioning.md to shape prioritization and recommendations.

## Relevance
Apply READ frontmatter matching semantics against task context.
Prioritize this wrapper when the goal matches: upgrade, obsolescence, versioning, breaking changes, migration.
If goal and changed artifacts do not match this specialist focus (version upgrades and obsolescence handling), return outcome not-applicable.

## Worklist
Build a worklist from relevant candidates using available inputs.
Rank by: 1) direct keyword overlap with goal, 2) touched files and objects, 3) stronger domain match.
Keep only items with clear evidence in the provided inputs.

## Action
Evaluate the task through this specialist lens and emit findings per DO output contract.
Cite knowledge files in references; when no applicable knowledge remains, return outcome no-knowledge with reason.
When fixes are local and mechanical, include suggested-code; otherwise include a concise remediation message.

## Output
Return a findings-report JSON object conforming to skills/do.md.