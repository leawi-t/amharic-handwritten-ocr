# Model description (model card)

Required by guideline Sections 9.5 and 9.6. One section per model.

## CRNN+CTC recogniser

| Item | Detail |
|---|---|
| Architecture | 6-layer CNN (BatchNorm, ReLU, max-pooling) → 2-layer BiLSTM (hidden 256, dropout 0.2) → linear layer → CTC |
| Input | Grayscale line image, 64 × 512 |
| Output | Character sequence over a 251-character vocabulary plus CTC blank |
| Training data | Fidel handwritten, writer-disjoint train split |
| Training | AdamW, lr 1e-3, weight decay 1e-4, batch 16, max 20 epochs, early stopping patience 4, seed 42 |
| Compute and time | _GPU type and training time (required by Section 9.3)_ |
| Intended use | Recognition of single lines of modern handwritten Amharic |
| Known limits | Line-level only; trained on one dataset; performance on real phone photos untested |
| Results | See `../results/README.md` |

## TrOCR (comparison)

| Item | Detail |
|---|---|
| Base model | _Exact model name and version, e.g. `microsoft/trocr-base-handwritten`_ |
| Provider and licence | _Provider; licence and terms of use (Section 9.5)_ |
| Our contribution | _Exactly what the group did: tokenizer / vocabulary adaptation for Fidel, fine-tuning, evaluation_ |
| Training data, budget, compute | _To fill in_ |

## NLP correction module

| Item | Detail |
|---|---|
| Approach | Dictionary / edit-distance candidate generation with confusion-aware ranking (current baseline) |
| Resources | Amharic wordlist; OCR confusion statistics learned from **training** predictions only |
| Evaluation | CER / WER before vs after correction on the same held-out split |
| Known limits | Wordlist is small and biased toward proper nouns; tokens are corrected independently |
