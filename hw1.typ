// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 1"
#let student = "Alan Fung"
#let date    = "6 Apr. 2026"
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
    radius: 4pt,
    inset: (x: 8pt, y: 12pt),
    width: 100%,
  )[
    *#num:*
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
  align(right, sym.qed)
}
// -----------------------------------------------------

// ==================== DOCUMENT =======================
#set page(margin: (x: 2.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true)

#header

#problem(10)[
  In investigating the Ideal Gas Law, experiments are to be run at four different
pressures and three different temperatures.
  #part("a",
    [How many experimental conditions are to be studied?],
    [$4 times 3 = 12$ conditions]
  )
  #part("b",
    [If each experimental condition is replicated (repeated) 5 times, how many
experiments will be conducted on a given gas?],
    [$12 times 5 = 60$ experiments]
  )
  #part("c",
    [How many experiments must be conducted to obtain five replications
     on each experimental condition for each of six different gases?],
    [$60 times 6 = 360$ experiments]
  )
]

#problem(13)[
  The Apollo mission to land humans on the moon made use of a system. For the system to operate successfully, all
five components shown must function properly. Let us identify each compo-
nent as being either operable (O) or inoperable (i). Thus the sequence OOOOi
denotes a state in which all components except the LEM engine are operable.
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

#problem(14)[
  The basic storage unit of a digital computer is a “bit.” A bit is a storage position that can be designated as either on (1) or off (0) at any given time. In
converting picture images to a form that can be transmitted electronically,
a picture element, called a pixel is used. Each pixel is quantized into gray
levels and coded using a binary code. For example, a pixel with four gray
levels can be coded using two bits by designating the gray levels by 00, 01,
10, and 11.
  #part("a",
    [How many gray levels can be quantized using a 4-bit code?],
    [$2^4 = 16$ gray levels]
  )
  #part("b",
    [How many bits are necessary to code a pixel quantized to 32 gray levels?],
    [$log_2(32) = 5$ bits]
  )
]

#problem("Extra 1")[
  Suppose that an experiment may proceed in any of $n$
possible, equally likely ways. Call each of these ways an
outcome. Let $E$ be a collection of $k$ of these outcomes
(think of this set as containing outcomes of interest).
Show that $P(E)+P(E^c)=1$ (here $E^c$ is the complement of
$E$ = set of outcomes not in $E$)

  *Proof:* If $n$ is the number of equally likely outcomes and $E$ consists of $k$ outcomes, then $E^c$ contains $n - k$ outcomes. So:

  $
    P(E) + P(E^c)
      = k/n + (n-k)/n
      = (k + n - k)/n
      = n/n
      = 1. quad #qed
  $
]

#problem("Extra 2")[
  Two dice are rolled and the values on the upturned
faces are added together. Which is more likely (has a
larger probability):

A: sum = even number or \
B: sum = odd number?

The number of permutations for each sum is:

  #align(center)[
    #table(
      columns: (auto, auto),
      align: center,
      table.header([Sum], [Permutations]),
      [0],  [0],
      [1],  [0],
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

#problem("Extra 3")[
  (continued from Extra 2) What is the probability
that the two numbers showing on the upturned faces differ by 1?

  Let us list all outcomes where the upturned faces differ by exactly one:

  #align(center)[
    #table(
      columns: (auto, auto),
      align: center,
      table.header([Die 1], [Die 2]),
      [1],[2],
      [2],[1],
      [2],[3],
      [3],[2],
      [3],[4],
      [4],[3], 
      [4],[5],
      [5],[4], 
      [5],[6],
      [6],[5], 
    )
  ]

  There are 10 such outcomes out of 36 equally likely possibilities:

  $
    P(|"Die"_1 - "Die"_2| = 1) = 10/36 approx 27.8%
  $
]
