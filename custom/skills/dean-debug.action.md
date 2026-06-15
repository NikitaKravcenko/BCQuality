---
kind: action-skill
id: dean-debug
version: 1
title: Dean Debug - Performance & Troubleshooting Specialist (Wrapper)
description: Domain-focused wrapper for performance diagnostics and troubleshooting. Goal keywords: performance, slow, timeout, regression, debugging, telemetry.
inputs: [pr-diff, file-path, repository, object-list]
outputs: [findings-report]
bc-version: [all]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Dean Debug - Performance & Troubleshooting Specialist - Wrapper

## Source
Primary knowledge domains for this specialist:
- microsoft/knowledge/performance/, community/knowledge/performance/ when available
- microsoft/knowledge/testing/, community/knowledge/testing/ when available
Also use custom/knowledge/style/ when it adds organization-specific guidance.
Use specialist guidance from custom/skills/dean-debug.md to shape prioritization and recommendations.

## Relevance
Apply READ frontmatter matching semantics against task context.
Prioritize this wrapper when the goal matches: performance, slow, timeout, regression, debugging, telemetry.
If goal and changed artifacts do not match this specialist focus (performance diagnostics and troubleshooting), return outcome not-applicable.

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