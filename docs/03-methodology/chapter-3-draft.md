# CHAPTER THREE: METHODOLOGY

> Skeleton based on guideline Sections 6 and 9 and Table 11.1 ("Development or
> research method, tools, data, work plan, risk management"). Chapter 3 is
> worth 15 of the 100 examiner marks in FYP I. Examiners want the method
> **justified against alternatives** and **applied to every specific objective**.

## 3.1 Introduction

## 3.2 Development Methodology

_Agile, as in the proposal. Justify it against at least one alternative
(Waterfall, prototyping, design science). Explain how the research part
(model experiments) and the development part (app, backend) run as parallel
iterations, and what one iteration looks like (length, review with the advisor)._

## 3.3 Methodology per Specific Objective

_One row per SO: how it will be achieved and how success will be measured (Section 6.1)._

| Objective | Activities | Method / technique | Success measure | Output |
|---|---|---|---|---|
| SO1 | | | | |
| SO2 | | | | |
| SO3 | | | | |
| SO4 | | | | |
| SO5 | | | | |

## 3.4 Fact-Finding Methods

_Questionnaire, interviews, observation, review of existing apps: who, how
many, why that number, and the instruments (put them in
`../04-requirements-and-design/fact-finding/`). Note that the ethical screening
and approval must come first (Section 15.4)._

## 3.5 Data

_For each dataset (Fidel, AHL-D 29K): source, size, writers, licence and
permissions, how it will be split (train / validation / **test**, writer-disjoint),
preprocessing, Amharic script normalisation choices (Section 9.6)._

## 3.6 Model Development and Experimental Design

_Section 9.1: why ML is needed instead of a rule-based approach; the task, inputs, outputs and success criteria._

- _Baseline(s): at least one, evaluated under the same conditions (Section 9.1)._
- _CRNN+CTC (primary) and TrOCR (comparison): architecture summary, tokenizer and vocabulary adaptation for Fidel._
- _NLP correction: approach, resources, how leakage from evaluation ground truth is avoided._
- _Training budget, seeds, hyperparameter tuning on validation only, never on test (Section 9.3)._
- _Within-dataset and cross-dataset evaluation._

## 3.7 Evaluation Metrics

_CER, WER (with definitions as numbered equations), parameter count, inference
time per line, and the significance test you will use when claiming one model
is better (Section 9.4)._

## 3.8 Tools and Technologies

_Flutter, FastAPI, PyTorch, Hugging Face Transformers, PostgreSQL, Git. Give a
reason for each choice and the alternatives considered. State hardware and compute
(Colab / Kaggle / local GPU) and who provides them (Section 6.4)._

## 3.9 Work Plan

_Gantt chart or work breakdown structure aligned with Table 16.1: tasks,
dependencies, milestones, responsible person, outputs (Section 6.2)._

## 3.10 Risk Management

_Summarise the risk register (`../project-management/risk-register.md`) and
the fallback for each high risk (Section 6.3)._
