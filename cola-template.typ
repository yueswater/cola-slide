// =============================================================================
// cola-template.typ — Coca-Cola-Branded Typst Presentation Template
//
// Built on top of the `definitely-not-isec-slides` package and the Touying
// slide framework.  Provides a full-featured branded theme with:
//
//   • Slide layouts  — title slide, section divider, and regular content slide
//   • Theme wrapper  — `cola-theme` wires up global text/link/code styles
//   • Caption system — auto-numbered figure and table captions (圖 / 表)
//   • Layout helpers — two-column grids, image placeholder slots
//   • Table helper   — `table-block` with red header row and caption
//   • Text utilities — inline emphasis, callout annotations, footnote blocks
//
// Typical usage
// ─────────────
//   #import "cola-template.typ": *
//   #show: cola-theme.with(...)
//   #cola-title-slide(title: "...", ...)
//   #cola-slide[content]
// =============================================================================

// ─── Imports ──────────────────────────────────────────────────────────────────
#import "@preview/definitely-not-isec-slides:1.0.1": *
#import "@preview/touying:0.6.1": components, config-page, touying-slide, touying-slide-wrapper, utils
#import "@preview/tiaoma:0.3.0"

// ─── Counters ─────────────────────────────────────────────────────────────────

/// Auto-incrementing counter for figure captions; initialised to 1 by `cola-theme`.
#let fig-counter = counter("cola-figure")

/// Auto-incrementing counter for table captions; initialised to 1 by `cola-theme`.
#let tab-counter = counter("cola-table")

// ─── Typography Constants ─────────────────────────────────────────────────────
// Centralised font-size values for every text role in the presentation.
// Change a value here to restyle that role everywhere it appears.

/// Base body text for regular slide content.
#let cola-font-size-body = 20pt

/// Top-left slide title on regular slides.
#let cola-font-size-slide-header-title = 26pt

/// Top-right institute label on regular slides.
#let cola-font-size-slide-header-institute = 13.5pt

/// Default footer text size before local footer overrides.
#let cola-font-size-slide-footer-base = 15pt

/// Slide number inside the footer badge.
#let cola-font-size-slide-footer-number = 12pt

/// Footer text next to the slide number.
#let cola-font-size-slide-footer-text = 13pt

/// Institute label in the title slide footer.
#let cola-font-size-title-slide-footer-institute = 13.3pt

/// Main presentation title on the title slide.
#let cola-font-size-title-slide-title = 40.5pt

/// Subtitle below the main title on the title slide.
#let cola-font-size-title-slide-subtitle = 28.3pt

/// Author list on the title slide.
#let cola-font-size-title-slide-authors = 19pt

/// Extra line below the author list on the title slide.
#let cola-font-size-title-slide-extra = 20pt

/// Section slide title in the center of the page; overridden to 50pt before `cola-section-slide`.
#let cola-font-size-section-slide-title = 36pt

/// Section slide subtitle below the section title; overridden to 35pt before `cola-section-slide`.
#let cola-font-size-section-slide-subtitle = 20pt

/// Placeholder text inside empty image slots.
#let cola-font-size-image-slot = 18pt

/// Figure and table caption text.
#let cola-font-size-caption = 12pt

/// Default table header text.
#let cola-font-size-table-header = 16pt

/// Compact table header text for dense tables.
#let cola-font-size-table-header-compact = 16pt

/// Default table body text.
#let cola-font-size-table-body = 16pt

/// Bibliography text.
#let cola-font-size-bibliography = 17pt

/// Block code text.
#let cola-font-size-code-block = 13pt

// ─── Layout & Spacing Constants ───────────────────────────────────────────────
// Spacing, gap, and inset values used for slide structure and component layout.

/// Move regular slide header downward.
#let cola-slide-header-shift-y = 3em

/// Space between header and regular slide body.
#let cola-slide-body-top-space = 2.6em

/// Vertical gap between a figure and its caption.
#let cola-figure-caption-gap = 0.45em

/// Vertical gap between a table and its caption.
#let cola-table-caption-gap = 0.15em

/// Line height for table header text.
#let cola-table-header-leading = 1.2em

/// Line height for table body text.
#let cola-table-body-leading = 1.2em

/// Left and right padding for table header cells.
#let cola-table-header-cell-inset-x = 9pt

/// Top and bottom padding for table header cells.
#let cola-table-header-cell-inset-y = 12pt

/// Left and right padding for table body cells.
#let cola-table-body-cell-inset-x = 9pt

/// Top and bottom padding for table body cells.
#let cola-table-body-cell-inset-y = 16pt

// ─── Color Constants ──────────────────────────────────────────────────────────

/// Link text color across the presentation.
#let cola-color-link = rgb("e4154b")

/// Primary brand red; used for emphasis and interactive elements.
#let cola-red = rgb("e4154b")

/// Accent green; used for positive or expenditure emphasis.
#let cola-green = rgb("63a553")

// ─── Theme Internals ──────────────────────────────────────────────────────────
// Internal building blocks consumed by the slide layout machinery.
// Not intended for direct use in presentation source files.

/// Renders the institute name with a colored square badge to its right.
#let cola-theme-institute-label(self) = [
  #block[
    #text(size: cola-font-size-slide-header-institute, weight: "medium")[
      #self.store.institute
    ]
    #h(0.1cm)
    #box(inset: 0pt, outset: 0pt)[#square(
      width: 0.3cm,
      height: 0.3cm,
      outset: 0pt,
      inset: 0pt,
      stroke: none,
      fill: self.colors.primary,
    )]
  ]
]

/// Slide header grid: title on the left, institute badge on the right.
/// Used as the default `header` passed to `config-page`.
#let header(self) = {
  let hdr = if title != auto { title } else { self.store.header }

  show heading: set text(size: cola-font-size-slide-header-title, weight: "semibold")

  move(dy: cola-slide-header-shift-y)[
    #grid(
      columns: (self.page.margin.left, 1fr, 1cm, auto, 1.2cm),
      block(),
      heading(level: 1, outlined: outlined, hdr),
      block(),
      move(dy: -0.31cm, cola-theme-institute-label(self)),
      block(),
    )
  ]
}

/// Top-level theme wrapper.  Applies global text, link, bibliography, and code
/// styles, and resets the figure/table counters to 1.
#let cola-theme(..args, body) = definitely-not-isec-theme(..args)[
  #set text(size: cola-font-size-body)
  #show link: set text(fill: cola-color-link)
  #show bibliography: set text(cola-font-size-bibliography)
  #show bibliography: t => {
    show link: set text(fill: cola-color-link)
    t
  }
  #show raw.where(block: true): set text(size: cola-font-size-code-block)
  #set par(leading: 1.2em)
  #fig-counter.update(1)
  #tab-counter.update(1)
  #body
]

// ─── Slide Layouts ────────────────────────────────────────────────────────────
// Four slide types cover all common needs: a generic content slide (`slide` /
// `cola-slide`), a branded title slide, and a full-bleed section divider.

/// Generic slide with header, footer, progress bar, and an optional title
/// override.  `alignment` falls back to the theme's `default-alignment`.
#let slide(
  title: auto,
  alignment: none,
  outlined: true,
  ..args,
) = touying-slide-wrapper(self => {
  let info = self.info + args.named()

  let header(self) = {
    let hdr = if title != auto { title } else { self.store.header }

    show heading: set text(size: cola-font-size-slide-header-title, weight: "semibold")

    grid(
      columns: (self.page.margin.left, 1fr, 1cm, auto, 1.2cm),
      block(),
      heading(level: 1, outlined: outlined, hdr),
      block(),
      move(dy: -0.31cm, cola-theme-institute-label(self)),
      block(),
    )
  }

  let footer(self) = context {
    set block(height: 100%, width: 100%)
    set text(size: cola-font-size-slide-footer-base, fill: self.colors.footer)

    grid(
      columns: (self.page.margin.bottom - 1.68%, 1.3%, auto, 1cm),
      block(fill: self.colors.primary)[
        #set align(center + horizon)
        #set text(fill: white, size: cola-font-size-slide-footer-number)
        #utils.slide-counter.display()
      ],
      block(),
      block[
        #set align(left + horizon)
        #set text(size: cola-font-size-slide-footer-text)
        #info.at("footer", default: "")
      ],
      block(),
    )

    if self.store.progress-bar {
      place(bottom + left, float: true, move(dy: 1.05cm, components.progress-bar(
        height: 3pt,
        self.colors.primary,
        white,
      )))
    }
  }

  let self = utils.merge-dicts(self, config-page(
    header: header,
    footer: footer,
  ))

  set align(
    if alignment == none {
      self.store.default-alignment
    } else {
      alignment
    },
  )

  touying-slide(self: self, ..args)
})

/// Full-featured title slide: logo, left-side accent bar, subtitle, author
/// list, extra metadata line, and an optional download QR code.
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    let footer-institute = [
      #set text(size: cola-font-size-title-slide-footer-institute, weight: "medium")

      #let arrow-icon = [
        #move(dy: -0.05cm, dx: -0.05cm, rotate(45deg, square(
          fill: none,
          size: 0.18cm,
          stroke: (
            "top": self.colors.primary + 1.35pt,
            "bottom": none,
            "right": self.colors.primary + 1.35pt,
            "left": none,
          ),
        )))
      ]

      #v(-0.5cm)
      #box(arrow-icon) #h(0.1cm) #self.store.institute
    ]

    set page(footer: footer-institute, header: none)
    set block(below: 0pt, above: 0pt)

    place(top + right, dy: -1.9cm, dx: 0.78cm, [
      #self.store.logo
    ])

    v(0.8cm)

    block(width: 83%)[
      #let title = text(size: cola-font-size-title-slide-title, weight: "bold")[
        #info.at("title", default: "")
      ]

      #move(dx: 0.04em)[
        #grid(
          columns: (0.195cm, auto),
          column-gutter: 0.7cm,
          context [
            #let s = measure(title)
            #move(dy: -0.4cm, rect(
              fill: self.colors.primary,
              height: s.height + 0.65cm,
            ))
          ],
          title,
        )
      ]
    ]

    v(0.6cm)

    block(width: 70%)[
      #text(
        size: cola-font-size-title-slide-subtitle,
        fill: self.colors.primary,
        weight: "bold",
      )[#info.subtitle]
    ]

    v(1.48cm)

    block(width: 70%)[
      #set text(size: cola-font-size-title-slide-authors)
      #if type(info.authors) == array [
        #for author in info.authors [
          #author #h(1.1em)
        ]
      ] else [
        #info.authors
      ]
    ]

    v(0.95cm)

    block(width: 70%)[
      #text(size: cola-font-size-title-slide-extra)[#info.extra]
    ]

    if (
      self.info.at("download-qr", default: none) != none and self.info.at("download-qr", default: none) != ""
    ) {
      place(bottom + right)[
        #align(center + horizon)[
          #let s = 4.9cm
          #tiaoma.qrcode(self.info.download-qr, width: s, height: s)
        ]
      ]
    }
  }

  touying-slide(self: self, body)
})

/// Alias for `title-slide`; prefer this name in presentation source files.
#let cola-title-slide(..args) = title-slide(..args)

// These override the initial 36pt / 20pt values declared in Typography
// Constants.  Kept here so `cola-section-slide` picks up the correct sizes.
#let cola-font-size-section-slide-title = 50pt
#let cola-font-size-section-slide-subtitle = 35pt

/// Full-bleed section-divider slide.  Background, title fill, and subtitle
/// fill are all customisable; defaults to the brand red background.
#let cola-section-slide(
  title: none,
  subtitle: none,
  background: rgb("e4154b"),
  title-fill: white,
  subtitle-fill: white,
  ..args,
) = touying-slide-wrapper(self => {
  let body = {
    set page(fill: background)

    align(center + horizon)[
      #move(dy: -0.35cm)[
        #if title != none [
          #text(
            size: cola-font-size-section-slide-title,
            weight: "bold",
            fill: title-fill,
          )[#title]
        ]

        #if subtitle != none [
          #v(0.45cm)
          #text(
            size: cola-font-size-section-slide-subtitle,
            weight: "medium",
            fill: subtitle-fill,
          )[#subtitle]
        ]
      ]
    ]
  }

  let self = utils.merge-dicts(self, config-page(
    header: none,
    footer: none,
  ))

  touying-slide(self: self, body, ..args)
})

/// Convenience wrapper around `slide` that inserts standard top-space so the
/// body starts below the header area without manual `v()` calls.
#let cola-slide(title: auto, ..args, body) = slide(title: title, ..args)[
  #v(cola-slide-body-top-space)
  #body
]

// ─── Captions ─────────────────────────────────────────────────────────────────
// Auto-numbered caption system for figures and tables.
// Counters are reset to 1 when `cola-theme` is applied.

/// Internal caption renderer.  Steps counter `c`, then renders a centred line
/// with `prefix`, the counter value, and `caption` text, separated by `gap`.
#let caption-block(prefix, caption, c, gap) = context {
  let n = c.get().first()
  c.step()
  v(gap)
  align(center)[
    #text(size: cola-font-size-caption, fill: gray)[#prefix #n #h(0.4em) #caption]
  ]
}

/// Numbered figure caption formatted as 圖x：caption.
#let figure-caption(caption) = context {
  let n = fig-counter.get().first()
  fig-counter.step()
  v(cola-figure-caption-gap)
  align(center)[
    #text(size: 10pt, fill: gray)[圖#n：#caption]
  ]
}

/// Numbered table caption prefixed with 表 (Table).
#let table-caption(caption) = caption-block([表], caption, tab-counter, cola-table-caption-gap)

// ─── Figure & Layout Helpers ──────────────────────────────────────────────────
// Composable layout primitives for arranging images and captions on slides.

/// Rounded placeholder rectangle for images not yet available.
#let image-slot(title: [圖片待補]) = rect(
  width: 100%,
  height: 8.5cm,
  radius: 10pt,
  stroke: 1.2pt + rgb("d6d6d6"),
  fill: rgb("fafafa"),
)[
  #align(center + horizon)[
    #text(size: cola-font-size-image-slot, fill: gray)[#title]
  ]
]

/// Two-column grid with a slightly wider left column (1.05fr / 0.95fr).
#let two-col(left, right) = grid(
  columns: (1.05fr, 0.95fr),
  column-gutter: 1.1cm,
  left, right,
)

/// Image slot paired with a figure caption, stacked vertically.
#let figure-slot(caption, title: [圖片待補]) = [
  #image-slot(title: title)
  #figure-caption(caption)
]

/// Two-column layout with arbitrary content on the left and a captioned image
/// slot on the right.
#let two-col-figure(left, caption, title: [圖片待補]) = two-col(
  left,
  figure-slot(caption, title: title),
)

// ─── Tables ───────────────────────────────────────────────────────────────────

/// Styled data table with a red header row, configurable column widths and
/// cell insets, and an automatic numbered caption below.
#let table-block(
  caption,
  headers,
  rows,
  widths,
  header-size: cola-font-size-table-header,
  body-size: cola-font-size-table-body,
  header-leading: cola-table-header-leading,
  body-leading: cola-table-body-leading,
  header-cell-inset: (
    x: cola-table-header-cell-inset-x,
    y: cola-table-header-cell-inset-y,
  ),
  body-cell-inset: (
    x: cola-table-body-cell-inset-x,
    y: cola-table-body-cell-inset-y,
  ),
  body-align: center + horizon,
) = [
  #set text(size: body-size)
  #set par(leading: body-leading)

  #table(
    columns: widths,
    inset: body-cell-inset,
    stroke: (x, y) => 0.6pt + rgb("d7d7d7"),

    table.header(
      ..headers.map(h => table.cell(
        fill: rgb("e4154b"),
        inset: header-cell-inset,
        align: center + horizon,
      )[
        #set par(leading: header-leading)
        #text(size: header-size, fill: white, weight: "bold")[#h]
      ]),
    ),

    ..rows
      .flatten()
      .map(cell => table.cell(
        align: body-align,
        inset: body-cell-inset,
      )[
        #cell
      ]),
  )

  #table-caption(caption)
]

// ─── Text & Annotations ───────────────────────────────────────────────────────
// Inline emphasis helpers, absolute-position callout overlays, and footnote
// blocks for annotating slide content.

/// Bold red text for important or negative emphasis.
#let emph-red(body) = text(fill: cola-red, weight: "bold")[#body]

/// Bold green text for positive or expenditure emphasis.
#let emph-green(body) = text(fill: cola-green, weight: "bold")[#body]

/// Shorthand for `emph-red`; marks important figures inline.
#let impt(body) = text(fill: rgb("e4154b"), weight: "bold")[#body]

/// Shorthand for `emph-green`; marks expenditure figures inline.
#let expen(body) = text(fill: rgb("63a553"), weight: "bold")[#body]

/// Callout annotation placed at an absolute position.  Draws a line from
/// `(x, y)` by `(line-dx, line-dy)` and attaches a rounded label box.
#let cola-callout(
  body,
  x: 0cm,
  y: 0cm,
  line-dx: 2cm,
  line-dy: 0cm,
  box-dx: 0.15cm,
  box-dy: -0.25cm,
  color: cola-red,
  box-width: 4.2cm,
  text-size: 12pt,
) = [
  #place(
    top + left,
    dx: x,
    dy: y,
  )[
    #line(
      start: (0cm, 0cm),
      end: (line-dx, line-dy),
      stroke: 1pt + color,
    )
  ]

  #place(
    top + left,
    dx: x + line-dx + box-dx,
    dy: y + line-dy + box-dy,
  )[
    #rect(
      width: box-width,
      radius: 5pt,
      inset: (x: 7pt, y: 5pt),
      fill: white,
      stroke: 0.9pt + color,
    )[
      #text(size: text-size, fill: color, weight: "bold")[#body]
    ]
  ]
]

/// Floating image positioned absolutely inside a slide.
#let cola-floating-image-badge(
  image-path,
  x: 0cm,
  y: 0cm,
  width: 0.74cm,
  anchor: top + left,
) = place(anchor, dx: x, dy: y)[
  #image(image-path, width: width)
]

/// Superscript footnote marker for use inside slide content.
#let note-ref(n, color: black) = text(
  size: 8pt,
  fill: color,
  weight: "bold",
  baseline: -1em,
)[#n]

/// Footnote block pairing each `note-ref` marker with its explanation.
/// `items` is an array of `(marker, body)` or `(marker, body, color)` tuples.
#let note-block(
  items,
  color: black,
) = [
  #block(width: 8.5cm)[
    #v(0.5cm)

    #set text(size: 12pt, fill: black)
    #set par(leading: 1.1em)

    #for item in items [
      #let n = item.at(0)
      #let body = item.at(1)
      #let item-color = item.at(2, default: color)

      #grid(
        columns: (0.28cm, auto),
        column-gutter: 0.08cm,
        align(top)[
          #move(dy: 0.08cm)[
            #note-ref(n, color: item-color)
          ]
        ],
        [
          #body
        ],
      )
      #v(0.05cm)
    ]
  ]
]
