# GCSEN: Offline Handwritten Ethiopic Text Recognition

## Citation (IEEE)

D. A. Tadesse, C.-M. Liu, and V.-D. Ta, “Gated convolution and stacked self-attention encoder–decoder-based model for offline handwritten Ethiopic text recognition,” Information, vol. 14, no. 12, Art. no. 654, 2023, doi: 10.3390/info14120654.

## Problem

The paper addresses offline handwritten Ethiopic text recognition. Key challenges include handwriting variation, visually similar Fidel characters, overlapping characters, and ligatures.

## Method

The proposed GCSEN model combines:

- **Gated CNN:** extracts visual features from handwritten images.
- **Self-attention encoder:** a six-layer Transformer encoder that learns relationships between positions in the feature sequence.
- **Self-attention decoder:** a six-layer Transformer decoder that produces the character sequence from the encoder's output.

GCSEN uses Transformer layers instead of recurrent layers. The paper doesn't state which loss function GCSEN trains with (CTC is mentioned only for the comparison models), and it doesn't say whether decoding is autoregressive, greedy or beam search, so I can't say how its output alignment compares with CTC. The number of attention heads and the total parameter count are not given either, although the authors call the model "more parameter-efficient".

The paper compares GCSEN against three recurrent baselines, all trained with CTC:

1. **Puigcerver:** CNN + bidirectional LSTM (five convolution layers and five BLSTM layers, about 9.6M parameters).
2. **Bluche:** gated CNN + bidirectional LSTM (eight convolution layers, three of them gated, and two BLSTM layers, about 730K parameters).
3. **FLOR++:** gated CNN + bidirectional GRU (11 convolution layers, six of them gated, and two Bi-GRU layers).

This makes the paper a comparison between recurrent CTC-based recognition and a Transformer encoder–decoder.

## Data

The authors collected handwriting from 250 volunteers (300 pages) and created two datasets:

| Dataset | Task | Total | Training | Testing |
|---|---|---:|---:|---:|
| HETD | Text-line recognition | 2,800 | 2,240 | 560 |
| HEWD | Word recognition | 10,540 | 8,432 | 2,108 |

Neither real dataset has a validation split in Table 1, and the paper doesn't describe how the 80/20 train/test split was made. Both datasets are small for deep-learning handwriting recognition.

The authors also generated synthetic datasets for pre-training:

| Synthetic set | Total | Training | Testing | Validation |
|---|---:|---:|---:|---:|
| Text lines | 290,000 | 174,000 | 58,000 | 58,000 |
| Words | 500,000 | 300,000 | 100,000 | 100,000 |

The paper does not say whether training and testing use different writers, and it does not claim to be writer-independent, so writer-independent evaluation cannot be confirmed.

## Evaluation

The paper uses two metrics:

- **CER:** Character Error Rate, measuring character-level insertions, deletions and substitutions.
- **WER:** Word Error Rate, measuring the same types of errors at word level.

Lower values are better.

## Key Results

### HETD (text lines)

| Model | CER (%) | WER (%) |
|---|---:|---:|
| Puigcerver | 10.15 | 15.50 |
| Bluche | 9.12 | 14.80 |
| FLOR++ | 8.92 | 14.51 |
| **GCSEN** | **8.72** | **13.11** |

### HEWD (words)

| Model | CER (%) | WER (%) |
|---|---:|---:|
| Puigcerver | 9.55 | 13.75 |
| Bluche | 8.46 | 11.24 |
| FLOR++ | 8.41 | 11.08 |
| **GCSEN** | **8.22** | **9.17** |

Reporting discrepancy: the abstract gives the HETD CER as 9.17%, but Table 2 and the conclusion (Section 4) give 8.72%. I use the table's value. The 9.17 in the abstract is also the same number as the HEWD WER, which may be a slip in the abstract (my guess, not stated by the authors).

Synthetic pre-training: the authors describe a significant positive effect, and say that training without it raises the proposed model's CER and WER by "approximately 11%". The paper doesn't say whether that is a relative increase or percentage points, and it doesn't give the from-scratch scores.

## Strengths and Limitations

### Strengths

- Introduces two Ethiopic handwriting datasets.
- Compares a Transformer encoder–decoder against three recurrent CTC baselines.
- Tests synthetic pre-training for limited real data.
- Evaluates both word-level and text-line recognition.

### Limitations and my observations

- The real datasets are small (2,800 lines and 10,540 words).
- Table 1 lists no validation split for the real datasets. The paper mentions early stopping on validation loss but not which data it came from, and says synthetic data was used to optimise hyperparameters. How hyperparameters were chosen for the real data is unclear.
- Writer independence between training and testing is not established.
- The baselines differ a lot in size (about 9.6M parameters for Puigcerver, about 730K for Bluche), and no parameter count is given for GCSEN. The paper does not compare models at equal size, so we can't tell how much of GCSEN's advantage comes from model size.
- The margins are small: GCSEN is about 0.2 CER points ahead of FLOR++ on HETD, and the paper reports no repeated runs, standard deviations or significance tests.
- Exact from-scratch results are not reported.
- The abstract and the results table disagree on the HETD CER.
- The authors say the network struggled with characters of similar shape and with characters that have few training samples, and that a larger and more diverse dataset is needed.

## Relevance to Our Project

This paper gives a useful contrast with our CRNN+CTC model. Its three baselines all use CTC with recurrent layers, while GCSEN replaces the recurrent layers with Transformer self-attention and an encoder–decoder.

The authors list language modelling and a larger dataset as future work, which fits our plan for a correction module. The results make attention-based recognition worth investigating, but the unclear writer split, the missing validation split and the small margins limit what we can conclude.

For our project, a writer-disjoint evaluation would strengthen the design. We should also not compare word-level and text-line CER values directly, because they are different tasks.
