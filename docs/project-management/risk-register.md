# Project risk register (Appendix H)

Review with the advisor **at least once a month** (Section 6.3). Every high
risk needs a named fallback. Owners and status are placeholders for the
team to agree.

| Risk ID | Risk | Probability (L/M/H) | Impact (L/M/H) | Mitigation / fallback | Owner | Status |
|---|---|---|---|---|---|---|
| R1 | Data unavailable: AHL-D 29K cannot be obtained or its licence does not allow use | M | H | Confirm access and licence now; fallback is Fidel only, using its official test split for held-out evaluation and HHD-Ethiopic for cross-dataset testing | Hallelujah | Open |
| R2 | Technology failure: insufficient GPU compute to fine-tune TrOCR | H | M | Use Colab / Kaggle GPU; smaller TrOCR variant; fixed training budget; TrOCR stays a comparison, so CRNN+CTC remains the minimum scope | Hallelujah | Open |
| R3 | Scope expansion: two models, correction module, app and technical report in parallel | H | H | Minimum scope = CRNN+CTC + correction + app; TrOCR is optional per the proposal; change control for anything new | All | Open |
| R4 | Schedule delay: technical report experiments (CoSc4511) compete with FYP I chapters | H | M | Shared literature review; plan both schedules together; weekly logbook check | All | Open |
| R5 | Security or privacy: user images or questionnaire data exposed | M | M | Ethical screening first; anonymise responses; no personal data in repo or public AI tools; HTTPS; no secrets in repo | Leawi | Open |
| R6 | Mobile framework mismatch between proposal and repo | L | M | Resolved: `mobile/` converted to Flutter on 2026-11-06 (change log C1) | Leawi | Closed |
| R7 | Domain shift: model trained on dataset images performs poorly on real phone photos | H | H | Collect a small, consented phone-photo test set; augmentation; preprocessing (deskew, binarisation) | Hallelujah | Open |
| R8 | Group member contribution imbalance or unassigned work package | M | H | Assign a primary work package to every member (Section 14.2); logbook records who did what | All | Open |
