# Data description (datasheet)

Required by guideline Sections 9.2 and 9.6. One section per dataset or resource.

## Fidel handwritten Amharic dataset

| Item | Detail |
|---|---|
| Source | https://huggingface.co/datasets/upanzi/fidel-dataset (cite the IJDAR paper too) |
| Licence and permissions | _To fill in from the dataset card_ |
| Subset used | `type == "handwritten"`, non-empty `line_text` (see `ml/src/data_prep.py`) |
| Size | 34,820 handwritten lines used so far (31,569 train / 3,251 validation) |
| Unit | Text line image |
| Writers | _Number of writers; split is writer-disjoint by `writer` field_ |
| Labels | How produced, by whom, any annotator agreement figures: _from the paper_ |
| Character set | 251 characters in the training vocabulary (see `results/metrics/config.json`) |
| Splits | Train / validation, writer-disjoint, seed 42. **Test split still to be created** |
| Preprocessing | Grayscale, resize to 64 × 512: _confirm and complete_ |

## AHL-D 29K (Amharic Handwritten Line Dataset)

| Item | Detail |
|---|---|
| Source | _To fill in_ |
| Licence and permissions | _To fill in_ |
| Size | _~29K lines_ |
| Splits | _To fill in_ |

## Amharic wordlist (`ml/data/raw/amharic_wordlist.txt`)

| Item | Detail |
|---|---|
| Source | Wikidict wordlist, `open-dict-data/wikidict-wordlist`, `am-wordlist_wiki.txt` |
| Licence | _Check the repository licence before redistributing it in this repo_ |
| Size | 11,017 entries, from Wikipedia article titles (many proper nouns) |

## Ethiopic script notes (Section 9.6)

- **Script:** Ethiopic (Fidel), Unicode block U+1200–U+137F
- **Normalisation:** Unicode NFC (used in the correction notebook). _Decide and
  document whether homophone characters are merged (for example ሀ/ሐ/ኀ, ሰ/ሠ,
  አ/ዐ, ጸ/ፀ), and how punctuation (።, ፣, ፤) and repeated spaces are handled._
- **Dialect coverage:** _State what the datasets cover; Amharic only, no Tigrinya or Ge'ez._
