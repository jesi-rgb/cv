
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Jesús Rascón"
#let locale-catalog-page-numbering-style = context { "Jesús Rascón - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Sept 2025"
#let locale-catalog-language = "en"
#let design-page-size = "a4"
#let design-section-titles-font-size = 1.5em
#let design-colors-text = rgb(80, 80, 80)
#let design-colors-section-titles = rgb(34, 110, 72)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(34, 110, 72)
#let design-colors-connections = rgb(34, 110, 72)
#let design-colors-links = rgb(34, 110, 72)
#let design-section-titles-font-family = "Roslindale Deck"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.5em
#let design-section-titles-type = "moderncv"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = true
#let design-links-use-external-link-icon = true
#let design-text-font-size = 9pt
#let design-text-leading = 0.8em
#let design-text-font-family = "AT Name Sans Text"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Roslindale Deck"
#let design-header-name-font-size = 20pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "AT Name Sans Text"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = "·"
#let design-header-alignment = left
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "◆"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 1cm
#let design-page-bottom-margin = 1cm
#let design-page-left-margin = 1cm
#let design-page-right-margin = 1cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = true
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Jesús Rascón

// Print connections:
#let connections-list = (
  [#box(original-link("mailto:jesirgb@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)jesirgb\@gmail.com])],
  [#box(original-link("https://jesirgb.com/")[#fa-icon("link", size: 0.9em) #h(0.05cm)jesirgb.com])],
  [#box(original-link("https://linkedin.com/in/jesi-rgb")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)jesi-rgb])],
  [#box(original-link("https://github.com/jesi-rgb")[#fa-icon("github", size: 0.9em) #h(0.05cm)jesi-rgb])],
  [#box(original-link("https://youtube.com/@Design_Bits")[#fa-icon("youtube", size: 0.9em) #h(0.05cm)Design\_Bits])],
  [#box(original-link("https://x.com/jesi_rgb")[#fa-icon("x-twitter", size: 0.9em) #h(0.05cm)jesi\_rgb])],
)
#connections(connections-list)



== Experience


#two-col-entry(
  left-content: [
    #strong[Graphext], #emph[Design Engineer, Technical Producer]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Redesigned and built the #link("https://graphext.com")[landing page], migrating it from Webflow to NextJS 15. The page features carefully crafted mobile and desktop layouts, light and dark themes, smooth animations and a connection to a Notion database from which the Blog, the About page and other sections get their data from.],[Redesigned and built Tractor 2.0, the most comprehensive and easy tool for scraping social media data, helping bring back several clients in need for scraping and social media analysis. The product features a fast interface, delightful animations and an AI-powered query builder that help build complex queries that would otherwise be cumbersome to write.],[Created and maintained the #link("https://docs.graphext.com/")[documentation] almost from scratch, with special care in writing and screenshot composing. Helped reduce the number of support tickets and inbound questions.],[Managed the #link("https://www.youtube.com/@graphextlabs")[Youtube channel], creating tutorials ranging from very basic to somewhat complex topics regarding Graphext and how to use it properly.],)
  ],
  right-content: [
    Madrid, Remote

Feb 2024 – May 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Prisms Of Reality], #emph[Technical Content Creator]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Created 500+ mathematical animations using #link("https://www.manim.community/")[Manim]],[Helped manage a small team through tight deadlines by enhancing communication and improving async handoff between tasks],[Worked closely with the CEO to provide clarity and direction on the projects at hand],)
  ],
  right-content: [
    San Francisco, Remote

June 2023 – Feb 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Design Bits], #emph[Freelancer]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Consultancy in animation engineering for youtube channels, including Veritasium, Memeable Data and Reducible, earning 80+ million impressions combined],[Consultancy in web development for universities and small companies],[Consultancy in branding and marketing, creating brand guidelines and assets for youtube channels as well async],[Created a #link("https://www.youtube.com/@Design_Bits")[Youtube channel] talking about Computational Design, getting almost 700 subscribers from two highly produced videos.],)
  ],
  right-content: [
    Jaén, Córdoba, Remote

Sept 2021 – present
  ],
)



== Projects



#one-col-entry(
  content: [
    #link("https://conduitchat.app")[#strong[Conduit]]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A fast and cute AI chat app with one-of-a-kind branching features])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Built on Svelte, Drizzle and Typescript],[Novel branching features from excerpts or whole messages],[Keeps context of the conversation clean],[Special attention to design and UX],[#link("https://x.com/jesi_rgb/status/1935387735386177548")[Pitch demo]],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #link("https://tractor.graphext.com")[#strong[Tractor 2.0]]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A fast and easy tool for scraping social media data])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Download data from the available social media sources in seconds],[Hassle free experience, minimal setup],[Apify wrapper specialized in social media and SEO],[Great UI and UX, with special attention to details],[Built on Svelte and Typescript on top of Apify's enpoints],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #link("https://github.com/processing/p5.js/pull/5709")[#strong[22' Google Summer of Code]]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Implementation of native gif saving functionality for the p5.js graphics library])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Implemented a fast and efficient #link("https://github.com/processing/p5.js/pull/5709")[client-side GIF encoder]],[Wrote an #link("https://www.jesirgb.com/blog/gif-encoding")[article] that dives deep into the topic],[Developed a custom algorithm for finding similar pixels between frames in order to reference them and save space in the final result],[Implemented async UI feedback to reassure the process is working correctly for users],[Built in Javascript and using Matt Deslauriers gifenc library.],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #link("https://mapa-elecciones-two.vercel.app/")[#strong[Mapa Elecciones 2023]]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [An interactive map of the results of the 2023 Spanish elections])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Used Mapbox to render the election results on a per neighbourhood basis],[Overlay of mean 2018 salaries to compare against the election results],[Built on Svelte, Mapbox, inspired by eldiario.es],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #link("https://pangea-game.vercel.app/")[#strong[Pangea]]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [The classic country guessing game, redesigned])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Custom SVG processing for the country visualization],[When wrong, an arrow points to the correct country, hinting at the answer],[Built on Svelte and D3.js],)
  ],
)



== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[MS]],
  middle-content: [
    #strong[University of Granada], Data Science
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([8\/10 average],[Development of advanced data science algorithms from scratch, like k-NN or PCA.],[#strong[Coursework]: Advanced Statistics, Computer Vision, Advanced Data Science Algorithms],)
  ],
  right-content: [
    Granada, Spain

Sept 2020 – June 2021
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BS]],
  middle-content: [
    #strong[University of Jaén], Computer Science
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([7.5\/10 average, 1 subject passed with honors],[10\/10 final thesis on developing a custom vision neural net for detecting animals in camera trap images],[#strong[Coursework]: Computer Architecture, Algorithm Design, Artificial Intelligence, Heuristics and Metaheuristics, Computer Graphics, Algebra],)
  ],
  right-content: [
    Jaén, Spain

Sept 2016 – June 2020
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Languages:] JS\/TS, Python]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Technologies:] Svelte 5, NextJS 15, D3, TailwindCSS, React, Manim, LaTeX]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Development Software:] Neovim, Git, Browser Devtools, VSCode]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Production & Creativiy Software:] DaVinci Resolve, Affinity Suite, Figma, Logic Pro 11, Blender]
)


