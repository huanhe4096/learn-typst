#import "template.typ": submission, references-section

#show: doc => submission(
  title: "Towards Flexible and Automated Data Conversion to OMOP CDM Through an Agent Skill-based Approach",
  authors: (
    (
      name: [Huan He#super[\*]],
      affiliations: ("1",),
    ),
    (
      name: [Vipina K. Keloth#super[\*]],
      affiliations: ("1",),
    ),
    (
      name: "Lingfei Qian",
      affiliations: ("1",),
    ),
    (
      name: "Vincent J Zhang",
      affiliations: ("1",),
    ),
    (
      name: "Yujia Zhou",
      affiliations: ("1",),
    ),
    (
      name: "Na Hong",
      affiliations: ("1",),
    ),
    (
      name: "Hua Xu",
      affiliations: ("1"),
    ),
  ),
  affiliations: (
    (
      id: "1",
      name: "Department of Biomedical Informatics and Data Science, Yale School of Medicine, New Haven, CT",
    ),
  ),
  doc,
)

#align(center)[
  #text(size: 10pt)[\* These authors contributed equally as co-first authors.]
]

= Background

Transforming heterogeneous clinical data into the OMOP Common Data Model (CDM)
is a prerequisite for many OHDSI-based observational studies and downstream
analytics. However, OMOP ETL development remains labor-intensive because source
schemas vary across institutions, concept mapping requires careful alignment to
standard vocabularies, and referential consistency must be maintained across
clinical event tables. These challenges make ETL development difficult to
standardize and reuse. To address this problem, we explored an agent-based
skill that organizes OMOP ETL work into a structured and repeatable workflow.
@hripcsak2015 @ohdsi2024


= Methods

We implemented an Agent Skill to support OMOP CDM v5.4 ETL pipeline
development. The workflow begins by inspecting source schema information or
sample records to identify relevant OMOP domains and required fields. The agent
then produces an explicit source-to-OMOP mapping plan that specifies how source
tables and fields correspond to OMOP tables and columns. After the mapping plan
is reviewed, the workflow generates ETL artifacts, including Python
transformation scripts and SQL loading scripts. The skill also incorporates
basic validation logic to check concept mapping completeness, referential
integrity, and temporal consistency, while preserving original source values
for traceability.

= Results

This workflow demonstrated the feasibility of using an Agent Skill to support
OMOP ETL design and implementation in a more structured manner. Instead of
relying only on ad hoc manual scripting, the skill makes mapping assumptions
explicit, scaffolds ETL generation around common OMOP domains, and produces
reusable transformation and validation components. The approach is particularly
useful for rapidly organizing pipelines for core domains such as PERSON,
VISIT_OCCURRENCE, CONDITION_OCCURRENCE, DRUG_EXPOSURE, and MEASUREMENT while
keeping unresolved mappings visible for later refinement.

The project repository is available at
#link("https://github.com/BIDS-Xu-Lab/omop-etl-skill")[https://github.com/BIDS-Xu-Lab/omop-etl-skill]


= Conclusion

An Agent Skill provides a practical and lightweight approach for supporting
OMOP ETL development. By structuring schema interpretation, mapping
specification, code generation, and validation into a single workflow, it can
reduce manual effort and improve transparency in the data conversion process.
Future work will focus on expanding domain coverage, strengthening
vocabulary-assisted concept mapping, and conducting more formal evaluations in
real-world data conversion settings.


// generate references section
#references-section("refs.bib")
