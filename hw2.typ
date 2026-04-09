// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 2"
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


#problem(1)[
  One environmental hazard recently identified is overexposure to airborne asbestos.
  In a sample of 10 public buildings over 20 years old, three were found
  to be insulated with materials that produced an excess number of airborne asbestos bodies.
  What is the approximate probability that another building of
  this type will have this problem? What method are you using to assign this
  probability?
  
  The sample probability is 3/10. By extrapolating the sample statistics to the population, we can approximate that another similar building has a 3/10 probability of producing an excess number of airborne asbestos bodies.
]

#problem(18)[
  A contractor has 8 suppliers from which to purchase electrical supplies. He will
  select 3 of these at random and ask each supplier to submit a project bid. In
  how many ways can the selection of bidders be made? If your firm is one of the
  8 suppliers, what is the probability that you will get the opportunity to bid on
  the project?


  We find that there are 8 choose 3 combinations in total, and 7 choose 3 combinations that do not include my firm.
  $
    n = binom(8, 3)\
    P = 1 - binom(7,3)/binom(8,3) = 1 - 5/8 = 3/8
  $
]

#problem(21)[
  A firm employs 10 programmers, 8 systems analysts, 4 computer engineers,
  and 3 statisticians. A “team” is to be chosen to handle a new long-term project.
  The team will consist of 3 programmers, 2 systems analysts, 2 computer engineers,
  and 1 statistician.
  #part("a",
    [In how many ways can the team be chosen?],
    [
      $
        binom(10, 3) times binom(8, 2) times binom(4, 2) times binom(3, 1) = 60480
      $
    ]
  )
  #part("b",
    [If the customer insists that one particular engineer with whom he or she
    has worked before be assigned to the project, in how many ways can the
    team be chosen?],
    [
      One computer engineer is already assigned, so we only have to choose 1 from 3.
      $
        binom(10, 3) times binom(8, 2) times binom(3, 1) times binom(3, 1) = 30240
      $
    ]
  )
]

#problem(30)[
  A firm offers a choice of 10 free software packages to buyers of their new home
  computer. There are 25 packages from which to choose. In how many ways can
  the selection be made? Five of the packages are computer games. How many
  selections are possible if exactly three computer games are selected?

  The number of ways the selection can be made is:
  $
    binom(25, 10) = 3268760
  $

  If exactly three out of five computer games are selected, then the number of selections is:
  $
    binom(5, 3) times binom(20, 7) = 775200
  $
]

#problem(1.1)[
  A group of 10 people are candidates for a clinical study. From this group, 6 people are chosen
  to participate in a trial. From a second group of 7 people (the control candidates) two people
  are chosen as controls for this trial. In how many ways can these 8 people (6 participants and
  2 controls) be selected for this trial?

  We can just multiply the ways the participants can be selected by the ways the controls are selected.
  $
    binom(10, 6) times binom(7, 2) = 4410
  $
]

#problem(1.5)[
  At Tree-Top airlines, 15 people are qualified to work in the cockpit of our new (well, just out
  of storage, anyway) Douglas DC-10s. All 15 of these people are qualified to fly DC-10s but 5
  of them have logged more than 20,000 flying hours on these planes and are considered senior
  pilots. Airline rules require that a cockpit crew for these planes contain three people, at least
  one of which is a senior DC-10 pilot. How many 3 person DC-10 qualified crews can be formed
  from the available personnel? How many 3 person groups are not qualified to fly DC-10s?

  To find the total number of qualified crews, we need at least one senior pilot:
  $
    binom(5, 1) times binom(10, 2) + binom(5, 2) times binom(10, 1) + binom(5, 3) = 335.
  $

  To find the number of unqualified groups, we choose 3 non-senior pilots:
  $
    binom(10, 3) = 120
  $

]

#problem(1.13)[
  In how many ways can Hayes High School, home of the fighting Rutherfords, play an 11 game
  football season that comprises 5 ties, 2 wins (but not on consecutive games), and 4 losses?

  To get the number of ways that the fighting Rutherfords can win twice unconsecutively, we can subtract the number of ways they can win consecutively if they win twice from the total number of ways they can win twice.

  $
    (binom(11, 2) - 10) times binom(9, 5) = 5670
  $
]

#problem(1.14)[
  A president, treasurer, and secretary (all different) are elected from a club of 9 members. How
  many choices of club officers are there if there are no restrictions imposed as to who can serve?
  How many choices of club officers are there if there are two specific club members who refuse
  to serve together? How many choices of club officers are there if one club member refuses to
  serve unless they can be president?

  The number of choices of club officers without restrictions is simple:
  $
    ""_9P_3 = 9!/6! = 504
  $

  If two specific members refuse to serve together, there are 6 ways they can be assigned to a team. Then there can be 7 other choices for the third officer.
  $
    504 - 6 times 7 = 462
  $
  If one member will not serve unless they are president, they can be in 2 other roles, with 8 other choices for president and 7 other choices for the last role.
  $
    504 - 2 times 8 times 7 = 392
  $
]

#problem("1.20")[
  How many Zip-codes are there whose digits are in strictly increasing order?

  A zip code with strictly increasing digits has unique digits and order does not matter.
  That is just a combination, so:
  $
    binom(10, 5) = 252
  $
]
