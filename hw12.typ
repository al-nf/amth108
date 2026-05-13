// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 12"
#let student = "Alan Fung"
#let date    = "4 May 2026"
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

#problem(37)[
  Albino rats used to study the hormonal regulation of a metabolic pathway are
  injected with a drug that inhibits body synthesis of protein. The probability that
  a rat will die from the drug before the experiment is over is .2. If 10 animals are
  treated with the drug, how many are expected to die before the experiment
  ends? What is the probability that at least eight will survive? Would you be
  surprised if at least five died during the course of the experiment? Explain, based
  on the probability of this occurring.

  $p = .2$

  $10 * .2 = 5$ are expected to die.

  $F(2) = 0.302$

  $F(5) = 0.026$, so I would be surprised if at least five died.
]
#problem(39)[
  In humans, geneticists have identified two sex chromosomes, R and Y. Every
  individual has an R chromosome, and the presence of a Y chromosome distin-
  guishes the individual as male. Thus the two sexes are characterized as RR
  (female) and RY (male). Color blindness is caused by a recessive allele on the
  R chromosome, which we denote by r The Y chromosome has no bearing on
  color blindness. Thus relative to color blindness, there are three genotypes for
  females and two for males: (table)

  A child inherits one sex chromosome randomly from each parent.
  #part("a",
    [
      A carrier of color blindness parents a child with a normal male. Construct
      a tree to represent the possible genotypes for the child. Use the tree to find
      the probability that a given child will be a color-blind male.
    ],
    [
      Rr x RY -> RR, RY, rR, rY. The probabiltiy that a given child will be a color-blind male is 1/4.
    ]
  )
  #part("b",
    [
      If the couple has five children, what is the expected number of color-blind
      males? What is the probability that three or more will be color-blind
      males?
    ],
    [
      The expected number of color-blind males is $1/4 * 5 = 5/4$.
      The probability that three or more will be color-blind males is 1 - .896 = .104 (from the table).
    ]
  )
]
#problem(40)[
  In scanning electron microscopy photography, a specimen is placed in a 
  vacuum chamber and scanned by an electron beam. Secondary electrons emitted
  from the specimen are collected by a detector, and an image is displayed on a
  cathode-ray tube. This image is photographed. In the past a 4x5-inch camera
  has been used. It is thought that a 35-mm camera can obtain the
  same clarity. This type of camera is faster and more economical than the 4x5-inch variety.

  #part("a",
    [
      Photographs of 15 specimens are made using each camera system. These
      unmarked photographs are judged for clarity by an impartial judge. The
      judge is asked to select the better of the two photographs from each pair.
      Let X denote the number selected taken by a 35-mm camera. If there is
      really no difference in clarity and the judge is randomly selecting
      photographs, what is the expected value of X?
    ],
    [
      $0.5(15) = 7.5$
    ]
  )
  #part("b",
    [
      Would you be surprised if the judge selected 12 or more photographs taken
      by the 35-mm camera? Explain, based on the probability involved.
    ],
    [
      Yes - $binom(15, 12) .5^12(.5)^3$ is very small, so the cumulative distribution of X  from 12 to 15 is also very small.
    ]
  )
  #part("c",
    [
      If $X >= 12$, do you think that there is reason to suspect that the judge is not
      selecting the photographs at random?
    ],
    [
      The probability of $X >= 12$ occuring is so low that I would be convinced that it was not random.
    ]
  )
]
#problem(3.4)[
  The Sticks-like-Glue (“’cuz it is”) adhesive company claims the probabililty that their adhesive
  fails to bond is p = 0.01. I’m using Sticks-like-Glue adhesive to lay 100 tiles in my kitchen.
  Assume that the ability to bond to the subfloor is independent from tile to tile and that Sticks-
  like-Glue, Inc. is correct in their assertion of their adhesive’s bonding probability. What is the
  probability that after the job is done, there will be at most 2 loose floor tiles?

  $P[X <= 2] = F(2) = f(2) + f(1) + f(0) = binom(100, 2) .01^2(.99)^98 + binom(100, 1) .01(.99)^99 + binom(100, 0) .99^100$
]
#problem(3.12)[
  The EverBitter Coffee Company has improved and now knows that 1% of the beans in its
  one-pound bag of Wince blend coffee are quakers... beans that for some reason didn’t get fully
  roasted. These beans are greenish in color and are easy to detect by inspection. Kent Tastemuch
  is still providing quality control services for EverBitter. The old procedure to measure the
  quality of a bag of Wince is still followed: dump a sample one-pound bag into a large box,
  shake the box, select a bean at random for test in the Green-or-not-green machine, return the
  bean to the box, pull out a second bean, test, return, and so on. What is the probability that
  Kent finds at least one quaker after 50 tests? How many quakers should Kent expect to find in
  50 tests? What is the standard deviation of the number of quakers expected in 50 tests?

  $p = 0.01, n = 50$

  $P[X >= 1] = 1 - f(0) = 1 - binom(50, 0) .99^50 = .395$

  $E[X] = 50 * .01 = .5$

  $sigma = sqrt(50 * .01 * .99) = .704$
]
#problem(3.21)[
  My Scando-Germanic friend, Odd Zahlen, often brings a die to class to answer multiple-choice
  final exam questions. Each multiple-choice question on this particular examination consists of
  three choices, and Odd decides to pick answer (a) if a 1 or 2 appears on a roll of the die, to pick
  (b) if a 3 or 4 appears on the die, or to pick (c) if a 5 or 6 appears. Assume that the correct
  answers are uniformly distributed among the choices (a), (b), and (c). What is the probability
  of obtaining exactly 5 correct answers on a ten question examination using this method?
  
  $p = 1/3, P[X = 5] = binom(10, 5) (1/3)^5 (2/3)^5$ 
]
#problem(3.22)[
  Suppose that the die is biased and the probabilities of each face change to
  $P [1] = 1/12, P [2] = P [3] = P [4] = P [5] = 1/6$, and $P [6] = 3/12$. Assuming that a correct
  answer is just as likely to be (a), (b), or (c), what is the probability now of obtaining exactly 5
  correct answers on a ten question examination using the die method?

  $p = 3/12 (1/3) + 1/3 (1/3) + 5/12 (1/3) = 1/3$ Since the probability of being correct is still $1/3$, the answer is still the same.
]
#problem(3.27)[
  The US Drug Enforcement Agency estimates that 98% of all \$100 dollar bills in circulation
  contain trace elements of illegal narcotics arising from the drug trade. A bank teller’s drawer
  contains \$20,000 in \$100 dollar bills. What is the mean and standard deviation of the number
  of clean \$100 dollar bills in the drawer?

  $p = .02, n = 2000, mu = 40, sigma = sqrt(2000 * .02 * .98) = 6.26$
]
#problem("Extra 1")[
  Let X represent the number of defect free
  microprocessors that the Ace IC Manufacturing company
  will produce in today's production run. Suppose that
  today's production run is slated to make 25 ICs and that
  the quality of each IC is independent of all other
  microprocessors produced today. From past history,
  the success rate of these microprocesors is 0.8.
  What is the probability that the value X falls within
  $2 sigma_X$ of the mean ($mu_X$)?

  $p = 0.8, n = 25, mu_X = 20, sigma_X = sqrt(25 * .8 * .2) = 2$

  P[$mu_X - 2 sigma_X <= mu_X <= mu_X +2 sigma_X$] = $F(4) - F(-4)$
]
