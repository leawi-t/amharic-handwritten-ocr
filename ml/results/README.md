# Results

Guideline Section 9.7 requires a table that links **each reported result to
the script that produced it**. Add a row for every result that appears in the
FYP document or the technical report.

| Result ID | Description | Value | Split | Produced by | Config / run | Date |
|---|---|---|---|---|---|---|
| CRNN-v1 | CRNN+CTC, Fidel handwritten, best checkpoint (epoch 13 of 17) | CER 0.1647, WER 0.411 (at epoch 13) | **Validation** (writer-disjoint, 3,251 lines) | `ml/notebooks/crnn_extended.py` | `metrics/config.json`, `metrics/epoch_history.csv` | 2026-09 |

## Known issues to fix before these numbers go in a report

1. **No held-out test set yet.** `data_prep.py` builds only a train / validation
   split, and the best checkpoint was chosen on that validation split. A
   number used to pick the model cannot also be its final score (guideline
   9.3). Add a writer-disjoint **test** split (or use Fidel's official test
   set) and report final results on it.
2. **Two different CRNN definitions.** `ml/src/model.py` has no BatchNorm or
   dropout. `ml/notebooks/crnn_extended.py`, which produced these results, has
   both. The code in `src/` should match the model that was actually trained.
3. **`crnn_extended.py` is not runnable on its own.** It is a notebook cell
   export that relies on variables defined elsewhere (`OCR_RESEARCH_ROOT`, the
   imports). Another person must be able to reproduce the results from the
   repository (Section 8.5).
4. **No baseline yet.** Section 9.1 requires at least one baseline evaluated
   under the same conditions.
5. **Single run, single seed.** Report mean and variation across seeds before
   claiming one model is better than another (Section 9.4).
6. **AHL-D 29K not used yet.** The approved proposal promises within-dataset
   and cross-dataset results on both datasets.
7. **Whitespace in ground truth.** The sample predictions show double spaces
   in the reference text. Document the normalisation applied before computing
   WER, since it changes the score.
