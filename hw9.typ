// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 9"
#let student = "Alan Fung"
#let date    = "27 Apr. 2026"
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

//book
#problem(14)[
  In an experiment to graft Florida sweet orange trees to the root of a sour orange
  variety, a series of five trials is conducted. Let X denote the number of grafts
  that fail. The density for $X$ is given in this table:

  #align(center)[
    #table(
      columns: (auto, auto, auto, auto, auto, auto, auto), 
      align: center,
      table.header([x], [0], [1], [2], [3], [4], [5]),
      [f(x)], [.7],  [.2], [.05], [.03], [.01], [0]
    )
  ]

  #part("a",
    [
      Find $E[X]$.
    ],
    [
      $E[X] = 0(.7) + 1(.2) + 2(.05) + 3(.03) + 4(.01) + 5(0) = .2 + .1 + .9 + .04 = 1.24$
    ]
  )
  #part("b",
    [
      Find $mu_x$.
    ],
    [
      $mu_x = E[X] = 1.24$
    ]
  )
  #part("c",
    [
      Find $E[X^2]$.
    ],
    [
      $E[X^2] = 0^2(.7) + 1^2(.2) + 2^2(.05) + 3^2(.03) + 4^2(.01) + 5^2(0) = .2 + .2 + .27 + .16 = .73$
    ]
  )
  #part("d",
    [
      Find Var $X$.
    ],
    [
      Var $X$ = $E[X^2] = .73$
    ]
  )
  #part("e",
    [
      Find $sigma_x^2$.
    ],
    [
      $sigma_x^2 = E[X^2] = .73$
    ]
  )
  #part("f",
    [
      Find the standard deviation for $X$.
    ],
    [
      $sigma_x = sqrt(.73) = .854$
    ]
  )
  #part("g",
    [
      What physical unit is associated with $sigma_x$?
    ],
    [
      The standard deviation
    ]
  )
]
#problem(17)[
  The probability $p$ of being able to log on to a computer from a remote terminal
  at any given time is .7. Let $X$ denote the number of attempts that must be made
  to gain access to the computer. Find $E[X]$. Can you express $E[X]$ in terms of $p$?

  $E[X] = sum_(x=1)^infinity x(.7)(.3)^(x-1) = .7(1 + 2(.3) + 3(.3^2) + ...)$\
  $.3E[X] = .3(.7)(1 + 2(.3) + 3(.3^2) +...)$\
  $E[X] - .3E[X] = .7E[X] = .49(1 + 2(.3) + ...) = .49sum_(k=1)^infinity k(.3)^(k-1) = .49 (1/(1-.3k)) = p^2(k/(.7k)) = p^2(1/p) = p$ \
  $E[X] = p/p = 1$
  
]

//notes
#problem("3.30")[
  On a standard Roulette wheel are found the numbers from 1 through 36 and two additional
  numbers labelled 0 and 00. If a player bets on a single number (0, 00, or 1 – 36) and that
  number comes up, the player wins 35 times their wager (that is, the player pays d, wins, and
  receives 35d back). Is this a fair game (that is, one in which the expected value of the payout
  after a spin of the wheel equals 0)?

  $E[X] = 1/38(34d - 37d)$. That is, out of 38 outcomes, you gain 34d if you win (1/38) and lose d if you lose (37/38). Since $E[X] eq.not 0$, the game is not fair.
]
#problem(3.31)[
  The shooter in a game of craps pays 20 scudi to play. If he wins (rolls a 7 or 11 on the first roll
  or makes his point) he wins 40 scudi. Is this a fair game?
]

#problem("Extra 1")[
  Two dice are rolled. Let $X$ represent the absolute
  value of the difference between the upturned faces. For
  example, if the roll is a 3,6, $X = |3-6| = 3$. The density
  and distribution functions (the density was worked out in
  one of the previous homeworks). Determine the expected
  value of X and variance of X.
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto, auto, auto, auto), 
      align: center,
      table.header([x], [0], [1], [2], [3], [4], [5]),
      [f(x)], [12/36],  [10/36], [8/36], [6/36], [4/36], [2/36]
    )
  ]

  $
    E[X] = 10/36 + 16/36 + 18/36 + 16/36 + 10/36 = 20/36 + 32/36 + 16/36 = 68/36 = 1.89
  $

  $
    E[X^2] = 10/36 + 32/36 + 54/36 + 64/36 + 50/36 = (104 + 106)/36 = 5.83
  $
]
#problem("Extra 2")[
  A rectangular box is divided in half by a partition
  creating two rooms, A and B. Room A is partially filled
  with energetic hydrogen atoms flying all around. The
  partition has a hole in it that permits the atoms to
  move room A to room B. In front of the hole in room A
  stands Maxwell's Demon who swats at every atom that looks
  like it has a chance of getting through the hole (call these
  offending atoms). The demon is able to send the first
  atom back into room A with a probability of p=0.65. The
  demon tires after each swat attempt and this reduces his
  swating success probability by a factor of 2 on each
  ensuing swat ($P["2nd swat successful"]=p/2$; $P["3rd swat successful"]=
  p/4$; $P["n-th attempt successful"]=p/2^(n-1)]$).

  On average, how many swats does the demon take before
  sending an atom back into room A and what is the variance of
  the swat success count?
  
  $f(1) = .65, f(2) = (.65)/2, f(3) = (.65)/4, ...$\
  $E[X] = sum_(k=1)^infinity k p ((1-p)/2)^(k-1)$ \
  $(1-p) E[X] = sum_(k=1)^infinity k p (1-p)^k / 2^(k-1)$\
  $p E[X] = p - p(1-p) + p(1-p) - p(1-p)^2 + 3/4 p(1-p)^2 - 3/4 p(1-p)^3 + 1/4 p(1-p)^3 - 1/4p(1-p)^4 + ... = p - 1/4 p(1-p)^2 - 1/2 p(1-p)^3 - 3/32 p(1-p)^4 ...$\
  $E[X] = 1 - 1/4(1-p)^2 - 1/2 (1-p)^3 - 3/32 (1-p)^4 = ???$

]
