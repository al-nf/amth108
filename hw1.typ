// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 1"
#let student = "Alan Fung"
#let date    = "2026-03-31"
// -----------------------------------------------------

// top
#let header = {
  grid(
    columns: (1fr, 1fr),
    align(left)[*#course* — #name],
    align(right)[#student · #date],
  )
  line(length: 100%, stroke: 0.5pt)
  v(4pt)
}

#let problem(num, body) = {
  v(8pt)
  block(
    breakable: false,
    stroke: 0.5pt + luma(180),
    radius: 10pt,
    inset: (x: 8pt, y: 12pt),
    width: 100%,
  )[
    *#num)*
    #v(2pt)
    #body
  ]
}

#let part(letter, question, answer) = {
  v(4pt)
  [*#letter.* #question]
  pad(left: 1em)[#answer]
}

#let qed = {
  v(1em)
  align(right, sym.qed)
}
// -----------------------------------------------------

// ==================== DOCUMENT =======================
#set page(margin: (x: 2.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true)

#header

// ── Problem 10 ───────────────────────────────────────
#problem(10)[
  #part("a",
    [How many experimental conditions are to be studied?],
    [$4 times 3 = 12$ conditions]
  )
  #part("b",
    [If each experimental condition is replicated 5 times, how many
     experiments will be conducted on a given gas?],
    [$12 times 5 = 60$ experiments]
  )
  #part("c",
    [How many experiments must be conducted to obtain five replications
     on each experimental condition for each of six different gases?],
    [$60 times 6 = 360$ experiments]
  )
]

// ── Problem 13 ───────────────────────────────────────
#problem(13)[
  #part("a",
    [How many states are possible?],
    [$2^5 = 32$ states]
  )
  #part("b",
    [How many states are possible in which the engine is inoperable?],
    [$2^4 = 16$ states]
  )
  #part("c",
    [How many states represent at least a partially successful
     (first three operable) mission?],
     [$2^2 = 4$ states]
  )
  #part("d",
    [How many states represent a totally successful mission?],
    [$1$ state]
  )
]

// ── Problem 14 ───────────────────────────────────────
#problem(14)[
  #part("a",
    [How many gray levels can be quantized using a 4-bit code?],
    [$2^4 = 16$ gray levels]
  )
  #part("b",
    [How many bits are necessary to code a pixel quantized to 32 gray levels?],
    [$log_2(32) = 5$ bits]
  )
]

// ── Extra 1 ──────────────────────────────────────────
#problem("Extra 1")[
  *Claim:* $P(E) + P(E^c) = 1$ for $E$, the collection of $n$ equally likely outcomes.

  *Proof:* $E$ consists of $k$ outcomes. Then $E^c$ contains $n - k$ outcomes, so

  $
    P(E) + P(E^c)
      = frac(k, n) + frac(n - k, n)
      = frac(k + n - k, n)
      = frac(n, n)
      = 1. #qed
  $
]

// ── Extra 2 ──────────────────────────────────────────
#problem("Extra 2")[
  Two six-sided dice are rolled and their faces summed.
  The number of permutations for each sum is:

  #align(center)[
    #table(
      columns: (auto, auto),
      align: center,
      table.header([Sum], [Permutations]),
      [2],  [1],
      [3],  [2],
      [4],  [3],
      [5],  [4],
      [6],  [5],
      [7],  [6],
      [8],  [5],
      [9],  [4],
      [10], [3],
      [11], [2],
      [12], [1],
      [Total], [36],
    )
  ]

  $
    P("even") = 18/36 = 0.5, quad P("odd") = 18/36 = 0.5
  $

  The sum is equally likely to be even or odd.
]

// ── Extra 3 ──────────────────────────────────────────
#problem("Extra 3")[
  Let us list all outcomes where the upturned faces differ by exactly one:

  #align(center)[
    #table(
      columns: (auto, auto),
      align: center,
      table.header([Die 1], [Die 2]),
      [1],[2], [2],[3], [3],[4], [4],[5], [5],[6],
      [6],[5], [5],[4], [4],[3], [3],[2], [2],[1],
    )
  ]

  There are 10 such outcomes out of 36 equally likely possibilities:

  $
    P(|"Die"_1 - "Die"_2| = 1) = 10/36 approx 27.8%
  $
]
