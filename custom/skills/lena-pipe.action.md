---
kind: action-skill
id: lena-pipe
version: 1
title: Lena Pipe - Pipelines & CI/CD Engineer (Wrapper)
description: Domain-focused wrapper for ci cd and pipeline reliability. Goal keywords: pipeline, ci, cd, build, release, automation.
inputs: [pr-diff, file-path, repository, object-list]
outputs: [findings-report]
bc-version: [all]
technologies: [al, powershell, javascript]
countries: [w1]
application-area: [all]
---

# Lena Pipe - Pipelines & CI/CD Engineer - Wrapper

## Source
Primary knowledge domains for this specialist:
- microsoft/knowledge/testing/, community/knowledge/testing/ when available
- microsoft/knowledge/upgrade/, community/knowledge/upgrade/ when available
- microsoft/knowledge/security/, community/knowledge/security/ when available
Also use custom/knowledge/style/ when it adds organization-specific guidance.
Use specialist guidance from custom/skills/lena-pipe.md to shape prioritization and recommendations.

## Relevance
Apply READ frontmatter matching semantics against task context.
Prioritize this wrapper when the goal matches: pipeline, ci, cd, build, release, automation.
If goal and changed artifacts do not match this specialist focus (ci cd and pipeline reliability), return outcome not-applicable.

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