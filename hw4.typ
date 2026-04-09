// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 4"
#let student = "Alan Fung"
#let date    = "13 Apr. 2026"
// -----------------------------------------------------
#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-venn:0.1.4": venn2, venn3
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

#problem(2.6)[
  At the foundary, the new nail machine makes 2-inch carpentry nails. Perfect nails are straight,
  have a dull finish, and are silver colored. The QA department has amassed the following data
  concerning flaws:\
  bent 12 %\
  shiny finish 15 %\
  non-silver 12 %\
  bent & shiny finish 8 %\
  bent & non-silver 6 %\
  shiny finish & non-silver 11 %\
  bent & shiny finish & non-silver 6 %\
  What is the probability that the machine will produce a perfect nail?

  Let's define our regions:\
  #text(fill: red)[A = bent]\
  #text(fill: blue)[B = shiny]\
  #text(fill: yellow)[C = silver]\
  (assume values are normalized to 1)
  #align(center)[
    #canvas({
      venn3(
        name: "v",
        a-fill: red,
        b-fill: blue,
        c-fill: yellow,
        ab-fill: purple,
        ac-fill: orange,
        bc-fill: green,
        abc-fill: gradient.conic(..color.map.rainbow),
        not-abc-fill: white,
      )
      draw.content("v.a", [0])
      draw.content("v.b", [5])
      draw.content("v.c", [80])
      draw.content("v.ab", [6])
      draw.content("v.ac", [4])
      draw.content("v.bc", [2])
      draw.content("v.abc", [2])
      draw.content("v.not-abc", [1])
    })
  ]

  A perfect nail is not bent, not shiny, and silver, so we are looking for $P(A^c B^c C)$, which is the yellow region.
  The probability of producing a perfect nail is: 
  $
    1 - .06 -.05-.04 -.02-.02-.01 = 80%
  $

]
#problem(2.7)[
  Over in the Agronomy department, a nutritional experiment is being conducted on a group
  of Wabbits to make them more docile. \
  Forty-three percent of the Wabbits in this group are Wascally,\
  10% of the Wabbits are Killer Wabbits and are a subclass of Wascally Wabbits.\
  With respect to the third classification (Were-Wabbits)\
  12% of the population are only Were-,\
  10% are both Wascally and Were-, and\
  5% are Killer, Wascally, and Were-.\
  The rest of the Wabbits are Normal.\
  Are there more Normal Wabbits than Wascally Wabbits?

  Let's define our regions:\
  #text(fill: red)[A = Wascally]\
  #text(fill: blue)[B = Were-]\
  #text(fill: yellow)[C = Killer]\

  Let us remember that all Killer Wabbits are Wascally.
  #align(center)[
    #canvas({
      venn3(
        name: "v",
        a-fill: red,
        b-fill: blue,
        c-fill: yellow,
        ab-fill: purple,
        ac-fill: orange,
        bc-fill: green,
        abc-fill: gradient.conic(..color.map.rainbow),
        not-abc-fill: white,
      )
      draw.content("v.a", [28])
      draw.content("v.b", [12])
      draw.content("v.c", [0])
      draw.content("v.ab", [5])
      draw.content("v.ac", [5])
      draw.content("v.bc", [0])
      draw.content("v.abc", [5])
      draw.content("v.not-abc", [45])
    })
  ]

  The proportion of Normal Wabbits is:
  $
    1 - .28-.05-.12-.05-.05 = .45.
  $
  Since the proportion of Wascally Wabbits is .43, there are more Normal Wabbits than Wascally Wabbits.
]
#problem(2.24)[
  Three powders, A: Eye of Newt, B: Black Cat Bone, and C: Powdered Instant Polyjuice Potion
  (in the convenient single serving packet), are to be mixed with water and poured into a cauldron.
  Initially, the solutions, in pairs, react to form three new compounds (called AB, AC, and BC).
  These reactions are incomplete in the sense that after all reactions have stopped, the cauldron
  contains water and some amount of A, B, C, AB, AC, BC, and nothing else. But not for long.
  Shortly, a third reaction occurs between AB, AC, and BC to produce ABC: non-dairy coffee
  creamer. Again, the reactions are incomplete. When the dust settles, the cauldron contains
  water and seven types of molecules (the six listed above and ABC) in these proportions:\
  8% residual A,\
  54% combined A,\
  5% residual B,\
  49% combined B,\
  5% residual C,\
  45% combined C,\
  43% combined AB,\
  the remainder being water.\
  Note: a residual X molecule is a molecule that contains only X, a combined X molecule is a
  molecule that contains X and possibly other molecules.


  Let's draw another Venn diagram:

  #text(fill: red)[A = Eye of Newt]\
  #text(fill: blue)[B = Black Cat Bone]\
  #text(fill: yellow)[C = Powdered Instant Polyjuice Potion]\

  #align(center)[
    #canvas({
      venn3(
        name: "v",
        a-fill: red,
        b-fill: blue,
        c-fill: yellow,
        ab-fill: purple,
        ac-fill: orange,
        bc-fill: green,
        abc-fill: gradient.conic(..color.map.rainbow),
        not-abc-fill: white,
      )
      draw.content("v.a", [8])
      draw.content("v.b", [5])
      draw.content("v.c", [5])
      draw.content("v.ab", [7])
      draw.content("v.ac", [3])
      draw.content("v.bc", [1])
      draw.content("v.abc", [36])
      draw.content("v.not-abc", [35])
    })
  ]

  #part("a",
    [
      What percentage of the cauldron is water?
    ],
    [
      $35%$
    ]
  )
  
  #part("b",
    [
      After a day, the heavy molecules (everything but water and the A, B, and C residual molecules)
      have settled to the bottom of the cauldron. What is the probability that a heavy molecule is non-dairy creamer?
    ],
    [
      The probability that a heavy molecule is non-dairy creamer is
      $
        P(A B C | "heavy")= 36/(36 + 7 + 3 + 1) = 77%
      $.
    ]
  )

]
#problem(2.25)[
  A new snack-food shop, called Nuclear Pickles, has been opened in my neighborhood. But
  the menu is somewhat limited. You can have either Pickles or Brussels Sprouts (but not both,
  and there are no other choices), heated in a microwave oven or not, with or without catsup.
  (Yum!) Data records indicate that half of the customers prefer Warmed Pickles with Catsup.
  Additionally, other choice preferences are as follows:

  #align(center)[
    #table(
      columns: (auto, auto),
      align: center,
      table.header([Item], [Prob]),
        [Orders pickles], [0.83],
        [Warm Pickles], [0.53],
        [Snack Warmed], [0.56],
        [Warmed Snack with Catsup], [0.52],
        [With Catsup], [0.72],
        [Pickles with Catsup], [0.60],
    )
  ]
  Do the patrons prefer warmed or cold Brussels Sprouts?

  Let's define our regions:\
  #text(fill: red)[A = Pickles]\
  #text(fill: blue)[B = Warmed]\
  #text(fill: yellow)[C = Catsup]\

  #align(center)[
    #canvas({
      venn3(
        name: "v",
        a-fill: red,
        b-fill: blue,
        c-fill: yellow,
        ab-fill: purple,
        ac-fill: orange,
        bc-fill: green,
        abc-fill: gradient.conic(..color.map.rainbow),
        not-abc-fill: white,
      )
      draw.content("v.a", [20])
      draw.content("v.b", [1])
      draw.content("v.c", [10])
      draw.content("v.ab", [3])
      draw.content("v.ac", [10])
      draw.content("v.bc", [2])
      draw.content("v.abc", [50])
      draw.content("v.not-abc", [4])
    })
  ]

  Brussels Sprouts are a snack, but not a pickle. 3% of patrons prefer warmed Brussels Sprouts,
  while 14% of patrons prefer cold Brussels Sprouts. So patrons prefer cold Brussels Sprouts.
]
#problem(2.27)[
  Each day I am besieged by telephone calls from Tele-marketers (T-M), Acquaintances (Acq),
  and close Family members (Fam). The probability of receiving a call from someone in each
  of these groups is\
  0.30 (T-M),\
  0.40 (Acq),\
  0.25 (Fam)\
  respectively. I’ve also noticed that the probability of\
  (1) being called by a tele-marketer/acquaintance is 0.15 and\
  (2) being called by a tele-marketer/family member is 0.05 (the slash indicates a person who possesses both qualities).\
  If, by definition, a person can’t simultaneously be an acquaintance and a family member,

  Let's define our regions:\
  #text(fill: red)[A = Telemarketer]\
  #text(fill: blue)[B = Acquaintance]\
  #text(fill: yellow)[C = Family]\

  #align(center)[
    #canvas({
      venn3(
        name: "v",
        a-fill: red,
        b-fill: blue,
        c-fill: yellow,
        ab-fill: purple,
        ac-fill: orange,
        bc-fill: green,
        abc-fill: gradient.conic(..color.map.rainbow),
        not-abc-fill: white,
      )
      draw.content("v.a", [10])
      draw.content("v.b", [25])
      draw.content("v.c", [20])
      draw.content("v.ab", [15])
      draw.content("v.ac", [5])
      draw.content("v.bc", [0])
      draw.content("v.abc", [0])
      draw.content("v.not-abc", [30])
    })
  ]

  #part("a",
    [
      What is the probability that I will be called by an unknown tele-marketer? 
    ],
    [
      $10%$
    ]
  )

  #part("b",
    [
      What is the probability that someone outside of these groups phones?
    ],
    [
      $30%$
    ]
  )
]
