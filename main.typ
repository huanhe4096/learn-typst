#import "template.typ": submission, references-section

#show: doc => submission(
  title: "OHDSI Symposium Submission Title",
  authors: (
    (
      name: "Huan He",
      affiliations: ("1",),
    ),
    (
      name: "Vincent J Zhang",
      affiliations: ("1",),
    ),
    (
      name: "Lingfei Qian",
      affiliations: ("1",),
    ),
    (
      name: "Vipina K. Keloth",
      affiliations: ("1",),
    ),
    (
      name: "Ruey-Ling Weng",
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

This template should be used as a starting point for the submission. It should
be a background of your understanding of the current state of the literature /
science as it relates to the topic you are spotlighting in this brief report.
This report should be on something that is unpublished in the literature. If
you have a preprint on the topic and it is still not accepted in a peer-reviewed
publication, we welcome the content for submission as well. Make sure to
include a few citations of other people’s work. @hripcsak2015
@reps2021

This is a good place to explain why the problem you are solving is relevant to
the OHDSI community, and what analytic use case you are aiming to address.
Community infrastructure and documentation can also be cited directly. @ohdsi2024

= Objective

#lorem(100)


= Methods

#lorem(120)


= Results

#lorem(90)


= Conclusion

#lorem(120)


// generate references section
#references-section("refs.bib")
