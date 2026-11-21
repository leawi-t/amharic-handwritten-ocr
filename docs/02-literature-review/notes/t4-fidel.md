# Fidel: A Large-Scale Sentence-Level Amharic OCR Dataset

## Citation (IEEE)

<!-- CHECK against the paper's first page: third author (B. R. Adego?), volume 29, pages 815–833, title hyphenation. -->

T. T. Chamisso, B. Guda, B. Retta, C. P. Sagbo, G. Z. Ashungafac, and A. Gueye, “Fidel: A large-scale sentence level Amharic OCR dataset,” International Journal on Document Analysis and Recognition, vol. 29, pp. 815–833, 2026, doi: 10.1007/s10032-026-00593-7.

## Problem

Amharic OCR has lacked a large dataset of full sentences. Earlier datasets mostly covered single characters, single words, historical documents, or synthetic text. None of them combine real handwriting with the sentence context that shows up in everyday Amharic documents.

The Ethiopic script makes this hard. Many characters look alike and differ only by a small stroke. Handwriting adds uneven spacing, joined characters and a different style for every writer. A model that does well on clean printed or synthetic text can still fail on handwriting.

Fidel answers this with a dataset and a benchmark: line images paired with their transcriptions, writer information, and baseline results that others can reproduce.

## Method

Fidel is a dataset and benchmark paper. It does not propose a new recognition model. The authors build the data and then test existing OCR systems on it.

### Real data

411 native Amharic writers, recruited through universities in Addis Ababa, copied sample sentences onto standard forms. The sentences come from the amWaC corpus and were chosen to cover the Ethiopic characters. Each writer has an anonymous ID.

The forms were scanned and turned into line images with their transcriptions. The steps were deskewing, binarization, line segmentation, aligning image and text, and quality checks.

### Synthetic data

The authors rendered 297,810 line images from amWaC and CC-100 Amharic text, using 43 fonts that support Ethiopic. This is the largest part of the dataset.

### Systems tested

Table 3 reports seven settings:

- DocTR CRNN (VGG16)
- DocTR MASTER
- DocTR VIPTR_TINY
- DocTR SAR_RESNET
- SuryaOCR, zero-shot
- SuryaOCR, fine-tuned
- CRNN-Att

Zero-shot and fine-tuned SuryaOCR are counted separately, so these are seven settings, not seven different architectures. No result is labelled "CRNN+CTC". The closest is DocTR CRNN, so I keep that name and do not treat it as the same thing as our model.

## Data

| Subset | Line images | Content |
|---|---|---|
| Handwritten | 40,855 | Real handwriting, 411 writers |
| Typed | 28,342 | Scanned printed text |
| Synthetic | 297,810 | Computer-rendered text |
| Total | 367,007 | All three |

These are the sizes of the dataset, not of each experiment. The benchmark uses at most 60,000 synthetic samples for training so that synthetic text does not dominate.

### Splits

Handwritten data is split by writer: about 70% of writers for training, 15% for validation and 15% for testing. A test writer never appears in training, so the test measures how the model copes with unseen handwriting. Typed data is split by document, and synthetic data is split randomly. The authors also filter near-duplicate text between training and test sets.

## Evaluation

The paper reports Character Error Rate (CER) and Word Error Rate (WER) as percentages, where lower is better. Models read line images that are already cut out, not whole pages.

Table 3 uses two test groups:

- **ALL:** handwritten, typed and synthetic text.
- **REALWORLD:** handwritten and typed text only.

Table 4 gives separate handwritten, typed and synthetic results for three models. This matters for us, because neither ALL nor REALWORLD is handwritten-only.

## Key Results

### Overall and real-world results

<!-- Table 3 values checked against the paper (screenshot, 2026-11-21): all match. -->

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

Fine-tuned SuryaOCR is best overall: 2.64% CER and 7.29% WER on ALL, and 6.17% CER and 17.06% WER on REALWORLD. The gap between the zero-shot and fine-tuned versions shows how much fine-tuning for Amharic matters. These scores include typed and synthetic text, so they cannot be used as handwriting results.

### Handwritten, typed and synthetic results

<!-- Table 4 values checked against the paper (screenshot, 2026-11-21): all match. The CRNN-Att synthetic WER (14.3) below its CER (17.32) is printed that way in the paper. -->

| Model (as labelled in Table 4) | Handwritten CER (%) | Handwritten WER (%) | Typed CER (%) | Typed WER (%) | Synthetic CER (%) | Synthetic WER (%) |
|---|---|---|---|---|---|---|
| Surya OCR | 11.0 | 33.0 | 1.0 | 2.0 | 1.0 | 2.0 |
| DocTR (CRNN-VGG16) | 14.90 | 42.30 | 2.10 | 8.10 | 7.10 | 21.00 |
| CRNN-Att | 30.7 | 52.70 | 7.71 | 16.09 | 17.32 | 14.3 |

Source: Table 4. The CRNN-Att synthetic WER (14.3) is lower than its CER (17.32) in the paper itself, which is unusual, so I do not rely on that cell.

Surya OCR has the lowest handwritten errors of the three: 11.0% CER and 33.0% WER. On typed text it reaches 1.0% CER and 2.0% WER. Table 4 does not say whether this is the fine-tuned checkpoint, so I keep the label as printed.

The closest result to our CRNN model is DocTR CRNN-VGG16: 14.90% CER and 42.30% WER on handwriting, and 2.10% CER and 8.10% WER on typed text. I cannot call these results for our own CRNN+CTC implementation without checking how the two differ.

## Error Analysis

The paper describes errors that a correction step could target:

- **Merged words:** spaces are dropped, so neighbouring words run together.
- **Fidel-order confusion:** the model gets the base consonant right but picks the wrong vowel form.
- **Look-alike characters:** small differences between Ethiopic characters are missed.
- **Handwriting:** differences between writers and irregular letter shapes make handwriting much harder than clean typed text.

So the remaining problem is not just recognising character shapes. A good transcription also needs correct word boundaries and the right choice between similar characters, using context.

## Strengths

- **Size and variety.** More than 367,000 line images across handwritten, typed and synthetic text, which allows training and a comparison between types of text.
- **Unseen writers in the test set.** This makes the handwritten results more realistic than a split that shares writers between training and testing.
- **Whole lines.** Image-and-text pairs for full lines keep the context that single characters or words lose, and suit sequence models.
- **Results by text type.** The breakdown shows weaknesses that the overall scores hide.

## Weaknesses

- **Narrow writer group.** Writers came from universities in Addis Ababa, so the data may not represent other regions, ages or everyday writing. This is my own observation, not something the paper says.
- **Cut-out lines only.** The benchmark does not test full pages, where finding and segmenting lines adds errors.
- **Incomplete breakdown.** Table 4 covers three models, while Table 3 covers seven. We cannot compare handwritten results for all of them, and there is no separate CRNN+CTC result.

## Relevance to Our Project

Fidel is our training data, and CRNN+CTC is our main model, so the paper gives us both the data and a published point of comparison.

DocTR CRNN-VGG16 (14.90% handwritten CER, 42.30% WER) is the closest CRNN comparison. We should keep its published name and check how it differs from our model before calling it a baseline.

We should compare handwritten results with handwritten results. Setting our handwritten CER against the paper's 2.64% on ALL would compare different data and look better or worse than it really is.

The merged-word and fidel-order errors are the reason for our correction module. We should measure whether it reduces those specific errors, not only whether the text changes.

We will report results before and after correction on the same held-out handwritten test samples, and state whether our training used handwritten data only or also typed and synthetic data.
