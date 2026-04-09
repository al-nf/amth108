// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 3"
#let student = "Alan Fung"
#let date    = "13 Apr. 2026"
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

#problem(2)[
  The theft of precious metals from companies in the United States was and is
  a serious problem. The estimated probability that such a theft will involve a
  particular metal is given below: (Based on data reported in “Materials Theft,”
  Materials Engineering, February 1982, pp. 27-31.)\
  tin: 1/35 $quad$ platinum: 1/35 $quad$ nickel: 1/35\
  steel: 11/35 $quad$ gold: 5/35 $quad$ zinc: 1/35\
  copper: 8/35 $quad$ aluminum: 2/35 $quad$ silver: 4/35\
  titanium: 1/35\
  (Note that these events are assumed to be mutually exclusive.)
  #part("a",
    [
      What is the probability that a theft of precious metal will involve gold, silver, or platinum?
    ],
    [
      $
        (5+4+1)/35 = 10/35
      $
    ]
  )
  #part("b",
    [
      What is the probability that a theft will not involve steel?
    ],
    [
      $
        1-11/35=24/35
      $
    ]
  )
]

#problem(3)[
  Assuming the blood type distribution to be A: 41%, B: 9%, AB: 4%, O: 46%,
  what is the probability that the blood of a randomly selected individual will
  contain the A antigen? That it will contain the B antigen? That it will contain
  neither the A nor the B antigen?

  A antigen: $P(A) + P(A B) = 45%$\
  B antigen: $P(B) + P(A B) = 13%$\
  Neither: $P(O) = 46%$
]

#problem(6)[
  When a computer goes down, there is a 75% chance that it is due to an overload
  and a 15% chance that it is due to a software problem. There is an 85%
  chance that it is due to an overload or a software problem. What is the probability 
  that both of these problems are at fault? What is the probability that
  there is a software problem but no overload?

  $
    O := "overload event", S := "software problem event"\
    P(O) = .75 quad P(S) = .15 quad P(O union S) = .90\
    P(O S) = P(O) + P(S) - P(O union S) = .05
  $
  Since $P(O S)$ = .05, $P(S) - P(O S) = P(S) = .1$
]

#problem(8)[
  Experience shows that 25% of all complaints about home telephone lines
  involve static on the line. Fifty percent involve line deterioration. Thirty-five
  percent involve only line deterioration. What is the probability that a randomly
  selected complaint will involve both problems? Will involve neither problem?

  $
    P(D) = .5, quad P(S) = .25, quad P(D) - P(D S) = .35\
    P(D S) = P(D) - .35 = .15\
    1 - P(D) - P(S) + P(D S) = 1 - .5 - .25 + .15 = .4
  $
]

#problem(9)[
  Assume that in a particular military exercise involving two units, Red and
  Blue, there is a 60% chance that the Red unit will successfully meet its 
  objectives and a 70% chance that the Blue unit will do so. There is an 18% chance
  that only the Red unit will be successful. What is the probability that both
  units will meet their objectives? What is the probability that one or the other
  but not both of the units will be successful?

  $
    P(R) = .6, quad P(B) = .7, quad P(R) - P(R B) = .18\
    P(R B) = P(R) - .18 = .42\
    P(R) + P(B) - 2P(R B) = .6 + .7 - .42 - .42 = .46
  $
]

#problem(2.22)[
  I roll a pair of dice 24 times. Should I bet for or against a 12 appearing on one of the rolls?
  How about if I roll 25 times?

  The odds of a 12 appearing in one roll is 1/36. The odds that a 12 doesn't appear is 35/36.
  $
    (35/36)^24 = .509
  $
  So you are still less likely to see a 12 than not. It's slightly more probable to lose, so bet against it.
  $
    (35/36)^25 = .494
  $
  After 25 rolls, it is more likely to see a 12 than not. So now you should bet for it.
]

#problem(2.23)[
  I roll a die 4 times. I win if a six appears. To make this game more interesting, I decide to
  add a second die and target the appearance of a double six. I reason as follows: a double six is
  one-sixth as likely as a six — 1/36 compared to 1/6. I should be able to increase the number of
  rolls by a factor of 6 (now 24 rolls) and still maintain the same probability of winning. Is this
  true? (Probabilistic justification is required here!

  In the first game, the probability of winning in 4 rolls is:
  $
    1 - (5/6)^4 = .518
  $
  In the second game, we already know the probability of winning in 24 rolls from the last problem - .509.

  Since the two probabilities are unequal, the claim above is untrue.
]

#problem("Extra 1")[
  How many anagrams are there of the word UNCOPYRIGHTABLE?

  15 letters, no duplicates, including words that don't exist:
  $
    15!
  $
]

#problem("Extra 2")[
  How many anagrams are there of the word SYZYGY?

  Consider that the three Ys are somehow different:
  $
    6! = 720
  $

  But that would mean that SYZYGY and SYZYGY could be two separate anagrams (which they can't). Let's divide by the number of permutations we get from rearranging the Ys around:
  $
    6!/3! = 120
  $
  So the answer is that there are 120 anagrams of syzygy, which may or may not be real words.
]
