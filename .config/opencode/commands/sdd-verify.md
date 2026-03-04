---
description: "SDD: Verify implementation against specs"
---

Detect the active change in `.spec/changes/` and verify the implementation.

Invoke @sdd-verify to:
1. Run `yarn test` and `yarn lint`
2. Validate that each spec scenario has coverage in the implementation
3. Generate a report at `.spec/changes/<name>/verify-report.md`

The report classifies findings as:
- CRITICAL: blocking, cannot archive
- WARNING: important but non-blocking
- SUGGESTION: optional improvement

Show the report to the user. If there are CRITICALs, indicate they must be resolved before `/sdd-archive`.
If everything is OK, indicate the next step is `/sdd-archive`.
