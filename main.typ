#import "template.typ": submission, references-section
#show: doc => submission(
  title: "Towards Flexible and Automated Data Conversion to OMOP CDM Through an Agent Skill-based Approach",
  authors: (
    (
      name: [Huan He],
      // name: [Huan He#super[\*]],
      affiliations: ("1",),
    ),
    (
      name: [Vipina K. Keloth],
      // name: [Vipina K. Keloth#super[\*]],
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


= Background

Transforming heterogeneous clinical data into the OMOP Common Data Model (CDM) is a prerequisite for many cohort-based observational studies and downstream analytics, especially in the context of multi-site research. @hripcsak2015 @biedermann2021 
In practice, clinical study data are often assembled from multiple source formats and systems, such as registries, electronic health records (EHRs), insurance claims, SDTM datasets, surveys, or FHIR resources, each with different schemas, coding systems, and completeness patterns. @voss2015
To map registry data, linked national health datasets, and FHIR-based data to the OMOP CDM, it usually requires an extract-transform-load (ETL) pipeline which provides source profiling, vocabulary mapping to standard concepts, restructuring into OMOP domains, and validation of person-level and temporal consistency. @oja2023 @peng2025

However, OMOP ETL development still remains labor-intensive because source schemas vary across institutions, concept mapping requires careful alignment to standard vocabularies, and referential consistency must be maintained across clinical event tables.
In practice, building an ETL pipeline usually involves multiple stages, including source profiling, mapping design, implementation, iterative testing and validation, evaluation of data quality and fidelity, and final deployment for downstream analyses.
These steps also require multiple types of domain knowledge, including familiarity with the OMOP CDM, source data structures and conventions, phenotype and vocabulary mapping, and practical programming and data engineering skills. @papez2021
These challenges make ETL development difficult to standardize and reuse.

To address this problem, we propose an agent skill-based approach for flexible and repeatable OMOP ETL development.
With our customized agent skill `create-omop-etl`, coding agents such as Claude Code and Codex can use OMOP dictionary knowledge and evaluation procedures to dynamically generate ETL pipelines tailored to the input source data.

#figure(
  caption: [Overall description of the method and workflow.],
  rect(
    width: 100%,
    height: 2in,
    stroke: 0.8pt + gray,
    radius: 4pt,
    inset: 0pt,
  )[
    #align(center + horizon)[
      #text(fill: gray)[Overall method and workflow figure]
    ]
  ],
)


= Methods

We implemented an Agent Skill to support OMOP CDM v5.4 ETL pipeline development.
As shown in Figure 1, the workflow begins by inspecting source schema information or sample records to identify relevant OMOP domains and required fields.
The agent then produces an explicit source-to-OMOP mapping plan that specifies how source tables and fields correspond to OMOP tables and columns.
After the mapping plan is reviewed, the workflow generates ETL artifacts, including Python transformation scripts and SQL loading scripts.
The skill also incorporates basic validation logic to check concept mapping completeness, referential integrity, and temporal consistency, while preserving original source values for traceability.

= Results

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.2em,
  row-gutter: 0pt,
  [
    #figure(
      caption: [Representative datasets for validation.],
      box(width: 100%)[
        #set text(size: 10pt)
        #table(
          columns: (30%, 23%, 47%),
          align: (left, right, left),
          inset: 2pt,
          stroke: 0.4pt,
          [#strong[Dataset Name]],
          [#strong[\# Records]],
          [#strong[Example]],

          [Dataset A],
          [TBD],
          [Registry export],

          [Dataset B],
          [TBD],
          [EHR extract],

          [Dataset C],
          [TBD],
          [FHIR resources],
        )
      ],
    )
  ],
  [
    #figure(
      caption: [Example summary of ETL generation outputs.],
      box(width: 100%)[
        #set text(size: 9pt)
        #table(
          columns: (34%, 25%, 41%),
          align: (left, center, left),
          inset: 2pt,
          stroke: 0.4pt,
          [#strong[Output Artifact]],
          [#strong[Generated]],
          [#strong[Notes]],

          [Mapping plan],
          [Yes],
          [Yes],

          [Python ETL script],
          [Yes],
          [Yes],

          [Validation report],
          [Yes],
          [Partial],
        )
      ],
    )
  ],
)

Table 1 summarizes representative datasets used to examine the workflow across multiple source formats and validation scenarios.
Table 2 provides a compact example of the generated ETL artifacts and review status to illustrate how results can be presented side by side.
This workflow demonstrated the feasibility of using an Agent Skill to support OMOP ETL design and implementation in a more structured manner.
Instead of relying only on ad hoc manual scripting, the skill makes mapping assumptions explicit, scaffolds ETL generation around common OMOP domains, and produces reusable transformation and validation components.
The approach is particularly useful for rapidly organizing pipelines for core domains such as PERSON, VISIT_OCCURRENCE, CONDITION_OCCURRENCE, DRUG_EXPOSURE, and MEASUREMENT while keeping unresolved mappings visible for later refinement.

The project repository is available at
#link("https://github.com/BIDS-Xu-Lab/omop-etl-skill")[https://github.com/BIDS-Xu-Lab/omop-etl-skill]


= Conclusion

An Agent Skill provides a practical and lightweight approach for supporting OMOP ETL development.
By structuring schema interpretation, mapping specification, code generation, and validation into a single workflow, it can reduce manual effort and improve transparency in the data conversion process.
Future work will focus on expanding domain coverage, strengthening vocabulary-assisted concept mapping, and conducting more formal evaluations in real-world data conversion settings.


// generate references section
#references-section("refs.bib")
