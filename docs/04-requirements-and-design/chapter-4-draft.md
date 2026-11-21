# CHAPTER FOUR: REQUIREMENTS ANALYSIS AND DESIGN

> Skeleton based on guideline Section 7 and Table 11.1. Chapter 4 carries the
> two biggest FYP I criteria: Objectives and requirements (20) and Analysis and
> design (25). The **requirements specification must be approved by the
> advisor** at the requirements baseline gate (weeks 5 to 7) **before design
> starts** (Section 7.3). Diagrams must match the real proposed system (7.5).

## 4.1 Introduction

## 4.2 Analysis of the Current Situation

_How people currently digitise handwritten Amharic (from fact finding), and
what existing tools offer. Evidence, not assumption._

## 4.3 Stakeholders and Users

## 4.4 Functional Requirements

_Clear, testable statements, each with an ID and a priority, traceable to an
objective (Section 7.1)._

| ID | Requirement | Priority (High / Medium / Low) | Source (fact finding / objective) | Objective |
|---|---|---|---|---|
| FR-01 | The user shall be able to capture an image of handwritten Amharic text with the device camera. | High | | |
| FR-02 | The user shall be able to upload an existing image from the device gallery. | High | | |
| FR-03 | | | | |

## 4.5 Non-Functional Requirements

_Each with a measurable target (Section 7.2). Consider performance, usability,
reliability, security, maintainability, compatibility, localisation (Amharic UI
and fonts), and behaviour with poor connectivity (Section 6.4)._

| ID | Attribute | Requirement with measurable target | Objective |
|---|---|---|---|
| NFR-01 | Performance | _e.g. recognition result returned within N seconds for a single-line image on a 3G/4G connection for 95% of requests_ | |
| NFR-02 | Accuracy | _e.g. CER on the held-out test set at or below the target set in the objectives_ | |
| NFR-03 | | | |

## 4.6 Requirements Baseline

_Date approved by the advisor, and a pointer to the change log for later changes._

## 4.7 System Models

_Use UML 2.x (Section 7.4): use-case diagram with descriptions, activity
diagrams, sequence diagrams for recognise / correct / export, class diagram.
Store sources and exports in `diagrams/`. Captions go below figures (11.7)._

## 4.8 System Architecture

_From `architecture.md`: mobile, backend, recognition, correction, database,
file storage. Component and deployment diagrams._

## 4.9 Database Design

_Relational schema, data dictionary, constraints, indexing, retention of
uploaded images (Section 8.2)._

## 4.10 Model and Data Design

_Recognition pipeline, preprocessing, model architectures, correction pipeline,
and the evaluation design (Section 9)._

## 4.11 User Interface Design

_Wireframes for capture/upload, review and edit, export, history._

## 4.12 Security and Privacy Design

_Authentication, input validation, HTTPS, storage of user images, OWASP Top 10 (Section 8.3)._
