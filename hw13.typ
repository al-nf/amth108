// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 13"
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

#problem(44)[
  Assume that each time a metal detector at an airport signals, there is a 25%
  chance that the cause is change in the passenger’s pocket. During a given hour,
  15 passengers are stopped because of a signal from the metal detector.

  #part("a",
    [
      Find the probability that at least 3 persons will have been stopped due to
      change in their pockets.
    ],
    [
      $p = .25, n = 15, F(15)-F(2) = .92$
    ]
  )
  #part("b",
    [
      If 15 passengers are stopped by the detector, would it be unusual for none
      of these to have been stopped due to change in the pocket? Explain based
      on the probability of this occurring.
    ],
    [
      Yes, since the probability of that occuring is 0.013 from the table.
    ]
  )
]
#problem(62)[
  A particular nuclear plant releases a detectable amount of radioactive gases
  twice a month on the average. Find the probability that there will be at most
  four such emissions during a month. What is the expected number of emissions
  during a 3-month period? If, in fact, 12 or more emissions are detected during
  a 3-month period, do you think that there is a reason to suspect the reported
  average figure of twice a month? Explain, on the basis of the probability
  involved.

  $k = 2, F(4) = .947$

  The expected number of emissions during a 3-month period is $3k = 6$.

  $1 - F(12) = .009$, which would be enough of a reason for me to suspect that the reported average is wrong.
]
#problem(67)[
  Cast iron is an alloy composed primarily of iron together with smaller amounts
  of other elements, including carbon, silicon, sulfur, and phosphorus. The
  carbon occurs as graphite, which is soft, or iron carbide, which is very hard and
  brittle. The type of cast iron produced is determined by the amount and
  distribution of carbon in the iron. Five types of cast iron are identifiable. These are
  gray, compacted graphite, ductile, malleable, and white. In malleable cast iron
  the carbon is present as discrete graphite particles. Assume that in a particular
  casting these particles average 20 per square inch. Would it be unusual to see a
  1/4-inch-square area of this casting with fewer than two graphite particles?
  Explain, based on the probability involved.

  $k = 80/(1/4 "in"^2 ), f(0) + f(1) = e^(-80)(1 + 80)$ is very small, so it would be unusual.
]
#problem(3.24)[
  The arrival of the city busses that trundle down my street is Poisson distributed. According to
  the published schedule, they arrive every 10 minutes. What is the probability that exactly two
  such busses arrive within 3 minutes of each other?

  $k = (1 "bus")/(10 "min") = (.3 "bus")/(3 "min"), f(2) = e^(-.3) (.3^2)/4 = 0.017$
]
#problem(3.25)[
  I arrive at the bus stop in the morning. What is the probability that a bus will
  come along in the next 3 minutes?

  $f(1) = e^(-.3) (.3)/1 = .222$
]
#problem(3.26)[
  Which is more likely, that exactly two busses arrive in the next three minutes
  or that exactly one bus arrives in the next 1.5 minutes and exactly one bus arrives in the 1.5
  minutes after that?

  The first probability is the answer to 3.24.

  The second probability:

  $k = .15, f(1) = e^(-.15) .15 = .129, f(1)^2 = .017$

  The two probabilities are equal.
]
#problem(3.29)[
  By some miracle, a Smudgy Press book is found to have 90% of its pages free of typographic
  errors. Assuming that the distribution of the typographical errors per page is Poisson, what is
  the probability that a randomly selected page contains exactly one error?

  $k = (0.1 "error")/(1 "pages"), f(1) = e^(-0.1) 0.1 = .09$
]
#problem("Extra 1")[
  A software defect presents itself at a rate of 1
  appearance per week. What is the probability that this
  defect appears within the first 3 days of the week?

  $F(3) = 1/e sum_(i=0) ^3 1/i!$ 

  More: Doesn't appear for more than 3 weeks?

  1 - $F(21) = 1/e sum_(i=0) ^21 1/i! approx 0$ 
]
#problem("Extra 2")[
  I'm standing on a freeway overpass. On the freeway below I estimate that
  the cars are passing at a rate of 10 cars per minute. What is the probability
  that there will be a 45 second gap where no cars pass by? What is the probability
  that no cars pass by in the first 20 seconds followed by at least one car passing
  after the first 20 seconds have passed?

  $k = (7.5 "cars")/(45 s), f(0) = e^(-7.5) = 0.0005$

  $k = (3.33 "cars")/(20 s), f(0) f(1) = e^(-3.33) e^(-3.33) 3.33 = 0.004$
]
