# CHAPTER ONE: INTRODUCTION

> Start from the approved proposal (`../01-proposal/approved/`). Table 11.1
> requires these sections. The notes below list what the guideline expects
> that the approved proposal does not yet have.

## 1.1 Background

## 1.2 Statement of the Problem

_Section 5.1 wants: the existing condition, affected stakeholders, **evidence**
that the problem exists (from your fact finding or credible sources, with
citations), consequences, shortcomings of current approaches, and the specific
gap. The proposal's version has no citations or evidence yet._

## 1.3 Motivation

_Not in the proposal. Required by Table 11.1._

## 1.4 Objectives

_The headings "General Objective" and "Specific Objectives" have **no section
numbers** and are **not listed in the table of contents** (Section 5.2)._

**General Objective**

To design, develop and test a mobile application that recognizes handwritten
Amharic text from images and converts it into corrected, editable and
searchable digital text.

**Specific Objectives**

_Section 5.2 wants 4 to 7 objectives, numbered SO1, SO2, ..., each starting with
an action verb, each measurable, and no generic activities. The proposal has 11
bullets. Two of them ("Review existing literature..." and "Document the
complete development process and demonstrate...") are activities every project
does, which the guideline says not to list. Most others have no measurable
target._

_Changing an objective is a major change (Section 4.6): agree the rewording
with the advisor, record it in `../project-management/change-log.md`, and
keep the substance the same as the approved proposal. A possible consolidation,
with targets to be agreed with the advisor:_

- _SO1 Analyze the functional and non-functional requirements of the system from prospective users, existing tools and the literature._
- _SO2 Design the system architecture, database schema and mobile user interface._
- _SO3 Implement and compare a CRNN+CTC recognizer and a fine-tuned TrOCR model on the Fidel and AHL-D 29K datasets, reaching a CER of at most __% on a held-out, writer-disjoint test set, and report cross-dataset CER and WER._
- _SO4 Design and implement an Amharic NLP correction module that reduces the CER of the recognizer's output by at least __ percentage points on the same test set._
- _SO5 Implement and integrate a mobile front end, backend service and database that support image capture or upload, review, correction, storage and export._
- _SO6 Evaluate the integrated system through unit, integration and system testing against the requirements, and a usability evaluation with at least __ representative users (e.g. SUS score of at least __)._

## 1.5 Research Questions

_Not in the FYP proposal. The technical writing proposal already has five good
ones. Link each to an objective (Section 5.3) and state hypotheses for the
model comparison._

| RQ | Question | Linked objective | How it will be answered |
|---|---|---|---|
| RQ1 | Which model achieves lower CER and WER on handwritten Amharic text lines? | SO3 | |
| RQ2 | How much does NLP post-correction reduce recognition errors? | SO4 | |
| RQ3 | How well does each model generalise to a dataset it was not trained on? | SO3 | |

## 1.6 Scope and Limitations

## 1.7 Significance of the Project

_Also state the primary project category (AI and ML) and the complexity class
(High, required for a 4-member group, Sections 2.4 and 14.1)._

## 1.8 Organization of the Document

_One short paragraph per chapter._
