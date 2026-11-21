# Fidel: A Large-Scale Sentence-Level Amharic OCR Dataset

## Citation (IEEE)

T. T. Chamisso, B. Guda, B. Retta, C. P. Sagbo, G. Z. Ashungafac, and A. Gueye, “Fidel: A large-scale sentence level Amharic OCR dataset,” International Journal on Document Analysis and Recognition, vol. 29, pp. 815–833, 2026, doi: 10.1007/s10032-026-00593-7.

## Problem

The paper addresses the shortage of large-scale, sentence-level Amharic OCR resources. Earlier datasets were often restricted to isolated characters, individual words, historical documents, or synthetic text. These resources do not fully represent the combination of handwriting variation and linguistic context encountered in contemporary Amharic documents. Fidel responds by bringing handwritten, typed, and synthetic line images together within a common benchmark.

Amharic recognition is challenging because the Ethiopic script contains visually similar characters whose distinctions can depend on small stroke changes. Handwriting introduces further variation through inconsistent spacing, character connections, and writer-dependent shapes. Consequently, good performance on clean printed or synthetic text does not necessarily imply reliable handwritten recognition.

The paper’s contribution is therefore both a dataset and an evaluation framework: it provides line-level image–transcription pairs, writer metadata, and baseline recognition results to support reproducible comparison.

## Method

Fidel is a dataset-and-benchmark study rather than a proposal for one new recognition architecture. The authors collect and process real handwritten and typed text, generate synthetic examples, and evaluate established OCR systems on the resulting resource.

### Real-data collection and processing

The authors collect handwriting from 411 native Amharic writers recruited through academic institutions in Addis Ababa. Participants transcribe sampled Amharic sentences on standardized forms, and anonymized writer identifiers link samples to their writers. The source sentences are drawn from the amWaC corpus, with attention to Ethiopic character coverage.

The processing workflow converts scanned forms into line images paired with transcriptions. It includes deskewing, binarization, line segmentation, image–label alignment, and quality checks. These steps produce the pre-segmented line inputs used by the recognition benchmark.

### Synthetic-data generation

The synthetic subset is generated from amWaC and CC-100 Amharic text using 43 Ethiopic-supporting fonts. It supplements the real images with additional text and font variation. The authors generate 297,810 synthetic line images; synthetic data are therefore the largest component of the released resource.

### Baseline recognition systems

Table 3 reports seven evaluated settings:

- DocTR CRNN (VGG16)
- DocTR MASTER
- DocTR VIPTR_TINY
- DocTR SAR_RESNET
- SuryaOCR, zero-shot
- SuryaOCR, fine-tuned
- CRNN-Att

These are seven evaluation settings, not seven entirely distinct architectures: zero-shot and fine-tuned SuryaOCR are reported separately. The results tables do not list a separate model explicitly named “CRNN+CTC.” Accordingly, this review retains the published DocTR CRNN label rather than treating it as an exact match to our implementation.

## Data

| Subset | Number of line images | Content |
|---|---|---|
| Handwritten | 40,855 | Real handwriting from 411 writers |
| Typed | 28,342 | Scanned printed text |
| Synthetic | 297,810 | Computer-rendered Amharic text |
| Total | 367,007 | Combined resource |

These figures describe the dataset resource, not the number of samples necessarily used in every training experiment. In particular, the benchmark limits synthetic training data to 60,000 samples to reduce synthetic dominance.

### Splits and unseen writers

The handwritten subset uses approximately 70% of writers for training, 15% for validation, and 15% for testing. The split is writer-disjoint: writers in the handwritten test set do not appear in the training or validation sets. This makes the evaluation relevant to recognition of previously unseen handwriting styles.

The typed subset is partitioned at document level, preventing lines from the same document from being distributed across different splits. The synthetic subset is randomly partitioned. The paper also describes filtering text overlap between training and test samples to reduce near-duplicate leakage.

## Evaluation

The paper evaluates recognition with Character Error Rate (CER) and Word Error Rate (WER), expressed as percentages; lower values indicate fewer transcription errors. The benchmark operates on pre-segmented line images rather than complete document pages.

Table 3 distinguishes two test groupings:

- **ALL:** handwritten, typed, and synthetic text.
- **REALWORLD:** handwritten and typed text only.

Table 4 separates handwritten, typed, and synthetic performance for three selected models. This breakdown is particularly important for our project because neither ALL nor REALWORLD is a handwritten-only evaluation.

## Key Results

### Overall and real-world results
Fine-tuned SuryaOCR obtains the lowest aggregate errors in Table 3: 2.64% CER and 7.29% WER on ALL. Its REALWORLD results are 6.17% CER and 17.06% WER.

| Model | ALL CER (%) | ALL WER (%) | REALWORLD CER (%) | REALWORLD WER (%) |
|---|---|---|---|---|
| DocTR CRNN (VGG16) | 6.9 | 21.5 | 7.0 | 21.7 |
| DocTR MASTER | 8.1 | 28.0 | 9.2 | 31.3 |
| DocTR VIPTR_TINY | 11.9 | 31.5 | 9.9 | 27.2 |
| DocTR SAR_RESNET | 11.6 | 20.2 | 13.6 | 23.7 |
| SuryaOCR, zero-shot | 184 | 162 | 100 | 100 |
| SuryaOCR, fine-tuned | 2.64 | 7.29 | 6.17 | 17.06 |
| CRNN-Att | 9.6 | 22.94 | 10.97 | 27.94 |

Source: Table 3.

The comparison between zero-shot and fine-tuned SuryaOCR shows the importance of task-specific adaptation in this benchmark. However, the combined scores should not be used as handwritten recognition results: typed and synthetic examples also contribute to ALL.

### Handwritten, typed, and synthetic results

| Model label in Table 4 | Handwritten CER (%) | Handwritten WER (%) | Typed CER (%) | Typed WER (%) | Synthetic CER (%) | Synthetic WER (%) |
|---|---|---|---|---|---|---|
| Surya OCR | 11.0 | 33.0 | 1.0 | 2.0 | 1.0 | 2.0 |
| DocTR (CRNN-VGG16) | 14.90 | 42.30 | 2.10 | 8.10 | 7.10 | 21.00 |
| CRNN-Att | 30.7 | 52.70 | 7.71 | 16.09 | 17.32 | 14.3 |

Source: Table 4, “Performance by text type (CER% / WER%).”

Surya OCR achieves the lowest handwritten errors among the three models shown: 11.0% CER and 33.0% WER. Its typed performance is substantially stronger, at 1.0% CER and 2.0% WER. Thus, the precise replacement for “typed text is nearly error-free” is that Table 4 reports 1.0% CER and 2.0% WER for Surya OCR on typed text.

For our CRNN-based project, the most relevant published CRNN-family reference is DocTR CRNN-VGG16: 14.90% handwritten CER and 42.30% handwritten WER. Its typed results are 2.10% CER and 8.10% WER. These are not, without further architectural verification, results for our exact CRNN+CTC implementation.

Table 4 labels its first model “Surya OCR”; it does not identify the checkpoint in the heading. This review therefore preserves that label rather than presenting its modality-specific values as explicitly identified fine-tuned results.

## Error Analysis

The paper discusses recognition errors that are directly relevant to a correction stage:

- **Merged words:** whitespace deletion joins adjacent words, producing incorrect word boundaries.
- **Fidel-order confusion:** the recognizer identifies a base consonant but substitutes another vowel-bearing form.
- **Visually similar glyph substitutions:** small differences between Ethiopic characters are missed.
- **Handwriting-related degradation:** writer variation and irregular character formation make handwritten samples substantially harder than clean typed text.

These findings indicate that the remaining problem is not simply recognition of individual character shapes. Reliable transcription also requires preserving word boundaries and resolving context-sensitive character alternatives.

## Strengths

Scale and mixed text types. Fidel combines more than 367,000 line images across handwritten, typed, and synthetic text, supporting both training and analysis of modality differences.

Writer-disjoint handwritten testing. Unseen test writers make the handwritten evaluation more informative than a split that allows the same writers in training and testing.

Line-level supervision. Image–transcription pairs preserve contextual information beyond isolated characters or words and support sequence-recognition approaches.

Multiple baselines and modality-specific reporting. The paper provides aggregate comparisons as well as handwritten, typed, and synthetic results for selected systems. The modality breakdown exposes limitations that aggregate scores can conceal.

## Weaknesses

Limited evidence of population-wide handwriting coverage. Recruitment through academic institutions in Addis Ababa provides useful writer variation, but it does not establish that the dataset represents all regions, age groups, or everyday writing contexts. This is a limitation of representativeness rather than evidence that any particular group performs poorly.

The benchmark starts with segmented lines. It does not by itself establish full-page OCR performance, where layout analysis, line detection, and segmentation errors also affect transcription.

Modality-specific reporting is incomplete across baselines. Table 4 reports only three selected models, whereas Table 3 contains seven evaluated settings. Consequently, readers cannot use these tables alone to compare handwritten performance for every evaluated system or identify a separate custom CRNN+CTC result.

## Relevance to Our Project

We train on Fidel, and CRNN+CTC is our main recognition model. Fidel therefore supplies both our data resource and the published benchmark context for evaluating our recognizer.

The DocTR CRNN-VGG16 result—14.90% handwritten CER and 42.30% handwritten WER—is a relevant CRNN-family comparison point. We must retain the published model name and verify architectural and training differences before describing it as an exact baseline for our system.

Our primary comparison should use handwritten-only CER and WER. Comparing our handwritten results against the paper’s 2.64% ALL CER would mix different evaluation populations and could give a misleading impression of relative performance.

The paper’s merged-word and fidel-order findings directly motivate our correction module. Our module targets missing word boundaries and vowel-form substitutions, so its evaluation should measure whether it reduces those errors rather than merely changing the output text.

We will report recognition results before and after correction on the same held-out handwritten test samples. We should also document whether our training uses handwritten data alone or includes typed and synthetic examples. Together, these controls make clear which improvements arise from the recognizer, which arise from correction, and how closely our experimental setting matches the published benchmark.
