# Ethical screening checklist (Appendix M)

Every proposal must complete this (Section 15.4). A "Yes" to **any of the first
five questions** requires written approval from the advisor and the Committee,
and referral to college or University ethics review where required. Get this
**before** any questionnaire or interview.

The answers below are a starting draft for the team to confirm.

| Question | Yes / No | Safeguards and notes |
|---|---|---|
| Does the project involve human participants (surveys, interviews, user tests)? | **Yes** | Requirements questionnaire / interviews (FYP I) and usability testing (FYP II). Informed consent, voluntary participation, anonymous responses, no personal data in the repository |
| Does it collect or process identifiable personal data? | _Team to decide_ | App users' uploaded images can contain names or other personal information. Define retention, access control and deletion. Questionnaires: avoid names and contact details |
| Does it use health, biometric, financial or education records? | _Likely No_ | Handwriting samples are not used for writer identification (out of scope). Confirm that no student records are digitised in testing |
| Does it involve minors or other vulnerable people? | _Team to decide_ | Beneficiaries include students. Restrict questionnaire and user tests to participants aged 18 or older |
| Does it use confidential data from a sponsor? | No | No sponsor |
| Does it collect data from websites or third-party platforms? | Yes | Fidel (Hugging Face), AHL-D 29K, Wikidict Amharic wordlist. Check and record each licence and terms of use |
| Does it involve security testing or offensive techniques? | No | |
| Does it involve hardware with a safety risk? | No | |
| Will project data be sent to an external AI service? | _Team to decide_ | TrOCR is run locally or on Colab/Kaggle. No user images or questionnaire data go to public AI services |
| Could the system cause harm or unfair treatment if it fails or is biased? | Low | Recognition errors could change meaning. Mitigated by the editable review step. Note possible performance differences across handwriting styles |

| Decision by | Outcome | Signature | Date |
|---|---|---|---|
| Advisor | | | |
| Committee | | | |
