---
kind: action-skill
id: morgan-market
version: 1
title: Morgan Market - AppSource & ISV Business Expert (Wrapper)
description: Domain-focused wrapper for appsource readiness and commercial compliance. Goal keywords: appsource, compliance, publishing, marketplace, readiness.
inputs: [pr-diff, file-path, repository, object-list]
outputs: [findings-report]
bc-version: [all]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Morgan Market - AppSource & ISV Business Expert - Wrapper

## Source
Primary knowledge domains for this specialist:
- microsoft/knowledge/security/, community/knowledge/security/ when available
- microsoft/knowledge/privacy/, community/knowledge/privacy/ when available
- microsoft/knowledge/upgrade/, community/knowledge/upgrade/ when available
Also use custom/knowledge/style/ when it adds organization-specific guidance.
Use specialist guidance from custom/skills/morgan-market.md to shape prioritization and recommendations.

## Relevance
Apply READ frontmatter matching semantics against task context.
Prioritize this wrapper when the goal matches: appsource, compliance, publishing, marketplace, readiness.
If goal and changed artifacts do not match this specialist focus (appsource readiness and commercial compliance), return outcome not-applicable.

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