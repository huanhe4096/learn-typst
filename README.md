# OHDSI Symposium Typst Template

This repository contains a minimal Typst starter for an OHDSI symposium-style
submission.

## Files

- `template.typ`: reusable layout and metadata wrapper
- `main.typ`: example submission using the template
- `refs.bib`: sample BibTeX references for citations and bibliography

```math
\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)
```

## Usage

Edit the metadata in `main.typ`:

- title
- authors
- affiliations
- keywords
- abstract

Then replace the placeholder body sections with your content.

Use citations directly in the text with BibTeX keys, for example:

```typst
This study builds on prior OHDSI work @hripcsak2015.
```

With the default `vancouver-superscript` style, both examples render inline as
superscript reference numbers, while the bibliography uses `1.`, `2.`, `3.`
numbering.

Render the bibliography at the end with:

```typst
#references-section("refs.bib")
```

## Build

```bash
typst compile main.typ
```

If the symposium provides stricter formatting later, update `template.typ`
without changing the document content structure.
