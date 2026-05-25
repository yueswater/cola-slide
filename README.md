![Slides](https://img.shields.io/badge/Coca--Cola%20Mini%20Project-Typst%20Slides-e4154b?style=flat-square)

# Coca-Cola Mini Project

This repository contains a Typst case presentation prepared for the Spring 2026 offering of [International Marketing Management](https://newdoc.nccu.edu.tw/teaschm/1142/schmPrv.jsp-yy=114&smt=2&num=351029&gop=01&s=1.html) at National Chengchi University, taught by Professor [Chien Wei, Chen](https://ib.nccu.edu.tw/zh_tw/Members/CHIEN-WEI-CHEN-40887967). The report focuses on channel observation and price-display analysis of Coca-Cola across four major retail channels in Taiwan: 7-Eleven, FamilyMart, PX Mart, and Carrefour.

# Project Structure

```text
.
├── Makefile                # Build and watch shortcuts
├── README.md               # Project notes and workflow
├── bibliography.bib        # Citation data for Typst bibliography
├── coca-cola.pdf           # Generated presentation output
├── coca-cola.typ           # Main deck content and slide order
├── cola-template.typ       # Local theme layer, helpers, and sizing tokens
├── figures/
│   └── coca-cola-logo.svg  # Cover logo asset
└── fonts/                  # Bundled fonts used by Typst
```

`coca-cola.typ` is intentionally kept focused on content. It mainly defines the deck metadata, the slide sequence, and the business narrative. Most visual decisions are pushed down into `cola-template.typ` so the content file stays readable.

`cola-template.typ` acts as the project-specific layer on top of the upstream slide package. This is where font sizes, caption spacing, table spacing, link color, counters, and reusable slide helpers are centralized.

# Build

Compile the slides with:

```sh
typst compile --font-path fonts --ignore-system-fonts coca-cola.typ coca-cola.pdf
```

Run the watcher with:

```sh
make watch
```

The build uses `--font-path fonts --ignore-system-fonts` so the output does not depend on whatever happens to be installed on the local machine.

# Design Logic

This deck uses Typst as a small layout system instead of treating the slide source as a single flat document. The structure is intentionally split between content and presentation logic.

- `#show: cola-theme.with(...)` in `coca-cola.typ` is the entry point for the whole deck. It injects global presentation settings such as fonts, colors, institute text, logo, and slide behavior.
- `#let cola-theme(..args, body)` in `cola-template.typ` wraps the upstream theme and overrides project-level rules like body text size, link color, bibliography size, code block size, and counter initialization.
- `#let slide(...)`, `#let title-slide(...)`, and `#let section-slide(...)` are local wrappers around the package primitives. This makes it possible to control header, footer, institute label, title hierarchy, and spacing from one file instead of editing every slide manually.
- Tables are normalized through `#table-block(...)`. In Typst terms, this helper centralizes `table(...)`, cell `inset`, paragraph `leading`, caption spacing, and header/body font sizes. The content file only needs to provide headers, rows, and column definitions.
- Figure and table captions use explicit `counter(...)` objects. The caption helper reads the current counter value, renders it, and then steps the counter so numbering starts at `1` and stays predictable.
- Column widths are passed directly into the helper and mapped to Typst `table(columns: ...)`, so each slide can still choose between fixed lengths like `4cm`, automatic sizing with `auto`, or proportional sizing with `fr`.

In practice, the design goal is simple: keep `coca-cola.typ` readable as presentation content, and keep `cola-template.typ` responsible for reusable Typst mechanics.

# Notes

- The PDF is tracked in this repository on purpose.
- The project uses `Alibaba Sans` for Latin text and `Noto Sans TC` for Traditional Chinese text.
