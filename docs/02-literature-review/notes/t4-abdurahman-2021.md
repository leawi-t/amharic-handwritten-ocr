# AHWR-Net: Offline Handwritten Amharic Word Recognition

## Citation (IEEE)

F. Abdurahman, E. Sisay, and K. A. Fante, “AHWR-Net: Offline handwritten Amharic word recognition using convolutional recurrent neural network,” SN Applied Sciences, vol. 3, Art. no. 760, 2021, doi: 10.1007/s42452-021-04742-x.

## Problem

The paper investigates offline handwritten Amharic word recognition: converting images of handwritten words into digital text. The authors identify the similarity between Ethiopic characters as a central difficulty. Many Fidel characters are derived from a base character by changing only a small stroke, making them difficult to distinguish in handwriting. Differences in writers' styles, cursive writing, and disconnected character components add to the challenge.

The study focuses on word-image recognition, not full-page or text-line recognition.

## Method

The authors propose an end-to-end convolutional recurrent neural network (CRNN) trained with Connectionist Temporal Classification (CTC). The system has three main stages:

1. A CNN extracts visual features from a word image.
2. A bidirectional recurrent network models the sequence of features.
3. A CTC layer maps the sequence into a character transcription without requiring character-by-character segmentation.

Four CNN feature extractors are evaluated: a custom CNN, ResNet-50, DenseNet-121, and VGG-19.

The custom CNN has 12 convolutional layers, batch normalization, ReLU activations, and max-pooling. The recurrent component experiments with bidirectional LSTM and bidirectional GRU configurations. The reported final models use two Bi-GRU layers, each with 512 hidden units and dropout of 0.5.

The paper confirms that the proposed CRNN models use CTC loss and decoding. This makes it a direct architectural comparison for our CRNN+CTC model.

## Data: HARD-I

The authors introduce HARD-I (Handwritten Amharic text Recognition Dataset), a dataset of handwritten Amharic word images. Sixty writers from different age groups and educational backgrounds copied text from four sources:

| Source | Pages | Lines | Original word images |
|---|---:|---:|---:|
| Aristotle monograph | 7 | 178 | 1,389 |
| Astronomy newsletter | 7 | 188 | 1,476 |
| Ethiopian Federal Democratic Republic constitution | 50 | 1,074 | 7,817 |
| Thus Spake Zarathustra (Amharic translation) | 6 | 163 | 1,382 |
| Total (as printed in the paper) | 70 | 1,574 | 12,064 |

The line counts in the paper's Table 2 add up to 1,603, but the printed total is 1,574. The page and word totals add up correctly.

The original dataset contains 12,064 word images. The paper additionally reports 21,608 augmented images, giving 33,672 images in the combined dataset. The output vocabulary has 301 symbols, and the maximum word-label length is 11 characters.

The split is 80% training, 10% validation and 10% test. The test set comes from the original handwritten data, and augmentation is applied only to the training and validation portions.

The paper does not say the split is by writer or by document, so the results are not a verified evaluation on unseen writers. The authors call the test set unseen, but they do not describe how lines were grouped before splitting.

Dataset: [HARD-I](https://sites.google.com/view/hawdb-v1)

## Image preparation and labelling

The writers' documents were scanned at 1080 DPI and saved as PNG images. The authors used A* path-planning for line segmentation and a scale-space word-partitioning algorithm for word segmentation.

Word crops were converted to binary images, with white backgrounds and black characters. Each word image was transcribed by hand in UTF-8, and its characters were mapped to numerical class indices.

Augmented samples were made by rotation, shifting, shrinking, expanding, degradation, Gaussian noise, and blurring. The paper reports two augmented images per original word image.

## Training setup

All four final models share the same two-layer Bi-GRU sequence model (512 hidden units, dropout 0.5) and the same CTC loss and decoding. Only the CNN feature extractor differs:

| Model | CNN feature extractor |
|---|---|
| Model A | Custom CNN |
| Model B | ResNet-50 |
| Model C | DenseNet-121 |
| Model D | VGG-19 |

The authors compare two input sizes, 32 × 128 and 64 × 256. They report 100 epochs, batch size 8, and an initial learning rate of 0.0001.

The paper says both that the models are trained with stochastic gradient descent (SGD) and that Adam was the optimizer, so I can't tell which one was used.

Implementation used Keras with a TensorFlow backend. Training was done in Google Colaboratory on an NVIDIA Tesla T4 GPU with 12 GB RAM.

## Evaluation and results

The paper evaluates:

- **Character Error Rate (CER):** character-level edit operations between the prediction and the ground truth, as an error rate.
- **Word Error Rate (WER):** word-level recognition errors.
- **Trainable parameters:** the number of model parameters.
- **Recognition speed:** average inference time per word image.

The paper does not report NED or a human-level benchmark.

Results from Table 4 of the paper:

| Model | Augmentation | CER (32 × 128) | WER (32 × 128) | CER (64 × 256) | WER (64 × 256) |
|---|---|---:|---:|---:|---:|
| Model A – Custom CNN | No | 3.14% | 11.17% | 3.66% | 13.00% |
| Model A – Custom CNN | Yes | 1.98% | 6.58% | 2.65% | 9.25% |
| Model B – ResNet-50 | No | 3.39% | 11.42% | 2.75% | 8.66% |
| Model B – ResNet-50 | Yes | 2.58% | 8.50% | 1.54% | 5.67% |
| Model C – DenseNet-121 | No | 2.61% | 9.08% | 1.99% | 6.75% |
| Model C – DenseNet-121 | Yes | 2.19% | 7.25% | **1.15%** | **5.24%** |
| Model D – VGG-19 | No | 10.96% | 27.58% | 3.51% | 12.58% |
| Model D – VGG-19 | Yes | 5.46% | 18.25% | 5.43% | 17.67% |

The best result is Model C (DenseNet-121) with augmentation and 64 × 256 input: 1.15% CER and 5.24% WER.

Augmentation lowered the error for most models, but not for Model D (VGG-19) at 64 × 256, where CER rose from 3.51% to 5.43%.

The authors compare their best model's 94% word accuracy with 76% from an earlier HMM-based study by Assabie and Bigün. They acknowledge that the datasets and methods differ, so this is not a controlled comparison.

Table 5 reports parameter counts and inference speed:

| Model | Parameters (32 × 128) | Parameters (64 × 256) | Seconds/image (32 × 128) | Seconds/image (64 × 256) |
|---|---:|---:|---:|---:|
| Model A | 17,462,893 | 19,035,757 | 1.22 × 10⁻³ | 2.40 × 10⁻³ |
| Model B | 36,432,045 | 36,432,045 | 1.20 × 10⁻³ | 2.10 × 10⁻³ |
| Model C | 24,628,461 | 24,628,461 | 3.20 × 10⁻³ | 8.40 × 10⁻³ |
| Model D | 28,208,365 | 29,781,229 | 1.42 × 10⁻³ | 2.62 × 10⁻³ |

## Strengths and limitations

### Strengths stated or shown by the paper

- Introduces HARD-I as a publicly available handwritten Amharic word-image dataset.
- Evaluates four CNN feature extractors within a common recurrent and CTC framework.
- Compares Bi-LSTM and Bi-GRU configurations and tests image resolution and augmentation.
- Reports both recognition quality and computational cost.
- Shows examples of substitution, insertion and deletion errors.

### Limitations and my observations

- HARD-I consists of segmented word images, so it does not test recognition from full text lines or pages.
- The data comes from 60 writers, but the split is not documented as writer-disjoint. Generalization to unseen writers is therefore not established.
- The data comes from four source documents and 70 pages. More writers, document types and writing conditions would make the evaluation stronger.
- The authors themselves name visually similar Fidel characters, disconnected character parts and cursive handwriting as sources of error.
- The 94% against 76% comparison with the HMM study is not a fair benchmark, because the datasets and methods differ.
- Augmentation did not help every model (VGG-19 at 64 × 256).
- The paper's optimizer description is inconsistent (SGD and Adam).
- The authors name evaluation on larger word and text-line datasets as future work.

## Relevance to Our Project

AHWR-Net is a close architectural reference because it uses a CRNN with CTC: CNN features, a bidirectional recurrent layer, and CTC transcription. Our model has the same structure, with a 6-layer CNN and a 2-layer BiLSTM (hidden size 256, dropout 0.2) where AHWR-Net uses a 2-layer Bi-GRU (hidden size 512, dropout 0.5).

The main difference is the recognition unit. AHWR-Net reads one segmented word image at a time, while a line-level system must read longer sequences and keep word boundaries. Its 1.15% CER should therefore not be compared directly with a line-level CER on Fidel or AHL-D 29K.

HARD-I could support extra word-level experiments, but it does not replace evaluation on line-level data. For a fair comparison, we should state the input unit, the split method, and whether test writers are excluded from training.

The paper's discussion of look-alike Fidel characters and disconnected strokes is also relevant to our character-level error analysis.
