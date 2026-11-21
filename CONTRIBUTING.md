# Contributing

## Workflow

1. Create a branch off `main` for your work (e.g. `hallelujah/dataset-prep`,
   `eyob/correction-baseline`, `leawi/capture-screen`, `maryamawit/srs`).
2. Commit within your own module folder (`ml/`, `backend/`, `mobile/`, or the
   relevant `docs/` phase folder) unless the change is cross-cutting.
3. Open a pull request into `main` for review before merging.

## Commit under your own identity

The guideline (Section 8.4) requires each member to commit their own work
under their own name. Commit history is part of the evidence for the
Individual Contribution Factor (Section 17.7). Before your first commit, check:

```bash
git config user.name
git config user.email
```

Write meaningful commit messages, and tag milestones (for example
`fyp1-ch2-draft`, `fyp1-requirements-baseline`, `fyp1-submission`).

## Documents

- Work on chapter drafts in the matching `docs/` phase folder. The assembled
  FYP I document (DOCX and PDF) goes in `docs/fyp1-document/`.
- Update `docs/project-management/logbook.md` every week. Each entry must say
  which member did what.
- Record any significant use of AI tools in `docs/compliance/ai-use-disclosure.md`
  as you go (tool, version, date, purpose, how the output was checked).
- Every reference must be read and verified before it is cited (Sections 5.4,
  11.11, 15.3). Use IEEE format.

## Do not commit

- Datasets (`ml/data/`). See `ml/README.md` for where to get Fidel and AHL-D 29K.
  The small wordlist in `ml/data/raw/` is the only exception.
- Trained model weights (`ml/models/`). Share them through cloud storage or a
  release artifact instead.
- Flutter build output (`build/`, `.dart_tool/`), Python virtual environments, `.env` files, API keys or other
  secrets (Section 8.3).
- Personal data from questionnaires or interviews (Section 15.4).

These are covered by `.gitignore`, but double-check before pushing large files.

## Cross-team dependencies

- NLP correction in `ml/` depends on error-analysis output from the
  recognition pipeline. Agree on the output format before finalising
  correction logic.
- `backend/` depends on the `ml/` pipeline having a working interface before
  it can wire up the `/recognize` endpoint.
- `mobile/` depends on `backend/`'s API contract. Check `backend/README.md`
  for the current draft request/response shape.
