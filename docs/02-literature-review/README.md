# Phase 2: Literature review (Chapter 2)

## What the guideline requires (Sections 5.4, 5.5, 11.11)

- A **critical synthesis**, organised **by theme**, not paper by paper. A
  source-by-source summary only scores "Adequate" (rubric, Table 17.3).
- Within each theme: group sources that address the same question, compare
  methods, data, metrics and results, judge how strong the evidence is,
  point out agreement and disagreement, and say in your own words what the
  evidence shows as a whole.
- A **comparison table** of at least **3 directly comparable** systems or
  studies on the same criteria (see `comparison-table.md`).
- An explicit **gap statement** at the end: what existing work does not do,
  why it matters for the stakeholders in the problem statement, and how this
  project responds.
- Show how the evidence shaped your choice of methods, technologies and design.
- At least **15 credible sources**, recent alongside foundational, mostly
  journals, conference proceedings and books, with web sources only as support.
- **IEEE** numbered citations in order of first use. No citations in headings.
- Never cite a source you have not read. An AI summary does not count as
  reading it (Section 15.3). Check every reference exists and says what you claim.

Chapter 2 is worth 15 of the 100 examiner marks in FYP I.

## Files

| File | Purpose |
|---|---|
| `reading-matrix.md` | One row per source: what it did, data, metrics, results, weaknesses, theme, who read it |
| `comparison-table.md` | The required comparison table (at least 3 comparable studies) |
| `references.md` | Verified IEEE reference list, numbered in order of first citation |
| `chapter-2-draft.md` | The chapter itself, organised by theme |
| `notes/` | Per-source reading notes (one file per paper, e.g. `notes/shi-2017-crnn.md`) |

## Shared with the technical report

The CoSc4511 technical report needs its own literature section on the same
topic. Share the reading matrix and references, but write each chapter
separately in your own words. The similarity check flags more than 20% overall
or more than 5% from one source (Section 15.2).

## Themes and owners

| Theme | Owner |
|---|---|
| T1 Sequence and Transformer recognition models (CTC, CRNN, TrOCR) | Hallelujah |
| T2 Post-OCR error correction | Leawi |
| T3 Existing OCR apps and mobile OCR | Maryamawit |
| T4 Amharic / Ethiopic OCR studies and datasets (Fidel, AHL-D 29K, HHD-Ethiopic) | Eyob |

## Workflow (first round due Tuesday, Nov 10, 2026)

1. Find and read 4 to 5 credible sources for your theme. Start general, then narrow to Amharic or other low-resource languages.
2. Add a row per source to your theme's table in `reading-matrix.md`, and a short note per source in `notes/` (e.g. `notes/t2-<author>-<year>.md`).
3. Check each source's full citation details against the paper and add it to `references.md` under your theme.
4. Write 1 to 2 paragraphs on what your sources show together in `notes/<theme>-synthesis.md` (e.g. `notes/t2-synthesis.md`).
5. Commit from your own account.
6. Later: draft your theme's section in `chapter-2-draft.md`, then fill `comparison-table.md` and write the gap statement together.
