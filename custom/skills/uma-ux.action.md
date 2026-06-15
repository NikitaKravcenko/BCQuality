---
kind: action-skill
id: uma-ux
version: 1
title: Uma UX - User Experience & Interface Design (Wrapper)
description: Domain-focused wrapper for ui usability and interaction quality. Goal keywords: ui, ux, usability, interaction, user flow, accessibility.
inputs: [pr-diff, file-path, repository, object-list]
outputs: [findings-report]
bc-version: [all]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Uma UX - User Experience & Interface Design - Wrapper

## Source
Primary knowledge domains for this specialist:
- microsoft/knowledge/ui/, community/knowledge/ui/ when available
- microsoft/knowledge/style/, community/knowledge/style/ when available
- microsoft/knowledge/performance/, community/knowledge/performance/ when available
Also use custom/knowledge/style/ when it adds organization-specific guidance.
Use specialist guidance from custom/skills/uma-ux.md to shape prioritization and recommendations.

## Relevance
Apply READ frontmatter matching semantics against task context.
Prioritize this wrapper when the goal matches: ui, ux, usability, interaction, user flow, accessibility.
If goal and changed artifacts do not match this specialist focus (ui usability and interaction quality), return outcome not-applicable.

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