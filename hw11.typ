// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 11"
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

#problem(34)[
  A discrete random variable is said to be uniformly
  distributed if it assumes a finite number of values with each value
  occurring with the same probability. If we consider the generation of a single
  random digit, then Y, the number generated, is uniformly distributed with each
  possible digit occurring with probability 1/10.
  
  #part("a",
    [
      Find the moment generating function for a discrete uniform random
      variable.
    ],
    [
      $m_x (t) = E[e^(x t)] = 1/n sum_(x=1) ^n e^(x t)$
    ]
  )
  #part("b",
    [
      Use the moment generating function to find $E[X]$, $E[X^2]$, and $sigma^2$
    ],
    [
      $E[X] = (d m_x (t))/(d t)|_(t=0) = sum_(x=1) ^n x/n = (n+1)/2$\
      \
      $E[X^2] = (d^2 m_x (t))/(d t^2)|_(t=0) = sum_(x=1) ^n x^2/n = ((n+1)(2n+1))/6$\
      \
      $sigma^2 = E[X^2] - E[X]^2 = ((n+1)(2n+1)-3(n+1))/6$
    ]
  )
  #part("c",
    [
      Find the mean and variance for the random variable Y, the number
      obtained when a random digit generator is activated once.
    ],
    [
      $mu_y = (n+1)/2, sigma^2_y=((n+1)(2n+1)-3(n+1))/6$.

      If $n = 10$, then $mu_y = 11/2, sigma^2_y = 33$
    ]
  )
]
#problem(25)[
  The zinc-phosphate coating on the threads of steel tubes used in oil and gas
  wells is critical to their performance. To monitor the coating process, an
  uncoated metal sample with known outside area is weighed and treated along with
  the lot of tubing. This sample is then stripped and reweighed. From this it is
  possible to determine whether or not the proper amount of coating was applied
  to the tubing. Assume that the probability that a given lot is unacceptable is .05.
  Let $X$ denote the number of runs conducted to produce an unacceptable lot.
  Assume that the runs are independent in the sense that the outcome of one run
  has no effect on that of any other.
  #part("a",
    [
      Verify that $X$ is geometric. What is “success” in this experiment? What is
      the numerical value of $p$?
    ],
    [
      $X$ is the number of runs it takes to produce an unacceptable lot, where the runs are independent.
      So $X$ is geometric, and success is defined as the production of an unacceptable lot, and $p = 1/n$
    ]
  )
  #part("b",
    [
      What is the exact expression for the density for $X$?
    ],
    [
      $f_X (n) = p(1-p)^(n-1)$
    ]
  )
  #part("c",
    [
      What is the exact expression for the moment generating function for $X$?
    ],
    [
      $m_X (t) = E[e^(X t)] = sum_(x=1) ^n e^(x t)p(1-p)^(x-1) = (p e^t)/(1 - q e^t)$
    ]
  )
  #part("d",
    [
      What are the numerical values of $E[X]$, $E[X^2]$, $sigma^2$, and $sigma$?
    ],
    [
      $E[X] = (d m_X (t))/(d t) |_(t=0) = 1/p = 20$

      $E[X^2] = (d^2 m_X (t))/(d t^2) |_(t=0) = q/p^2 = 380$

      $sigma^2 = E[X^2] - E[X]^2 = 20$

      $sigma = 4.47$
    ]
  )
  #part("e",
    [
      Find the probability that the number of runs required to produce an
      unacceptable lot is at least 3.
    ],
    [
      $1 - F(2) = 1 - (p q + p q^0)= .90$
    ]
  )
]
#problem(27)[
  Find the expression for the cumulative distribution function for the random
  variable of Exercise 25. Use this function to find the probability that at most
  three runs are required to produce an unacceptable lot.

  $F(X) = p + p q + p q^2 + ... = p (1 + q + q^2 + ...) = p * (1-q^x)/(1-q) = 1-q^x$

  $F(3) = 1 - q^3 = 1 - 0.95^3 = .14$
]
#problem(3.1)[
  What is the expected value of $Y = (U + 1)^2$ if $U$ is geometrically distributed with $p = 1/3$?

  $E[U] = 3, E[U^2] - E[U]^2 = (2/3)/(1/9) = 6 -> E[U^2] = 15$

  $E[(U+1)^2 = E[U^2] + 2E[U] + E[1] = 15 + 6 + 1  = 22$
]
#problem(3.3)[
  Every time the machine broke, the value of $X$ was recorded for posterity. What
  percentage of the time did $X$ fall within $1σ$ of the mean?

  $p = 2/3 -> mu = 3/2, sigma = sqrt(3) / 2$

  $F(sqrt(3)/2) = 1 - (1/3)^(mu + sigma) = 1 - (1/3)^2 = 8/9$
]
#problem(3.13)[
  I can win a lifesize, stuffed, plush replica of Rutherford B. Hayes if I can toss a 2 in diameter
  hard-plastic ring onto the neck of a single wine bottle from 20 feet away. The promoter running
  this game knows that on average it takes 10,000 tosses to win a prize. I pay \$20.00 for sixty
  rings. What are my chances of winning a stuffed Rutherford B. Hayes?

  $p = 1/10000. F(60) = 1 - (9999/10000)^60 = 0.006$
]
#problem(3.15)[
  I give some lucky people two spins each of the Wheel of Right Prices (they must spin twice).
  This wheel contains the 21 numbers 0, 5, 10, . . . , 95, 100. If the sum of the results of the two
  spins totals 100, the person wins a fabulous prize and is free to leave (otherwise they win nothing
  and must sit through a vacation condo sales pitch). The wheel is fair and each person’s spins
  are independent of each other and the other people’s spins. What is the probability of winning
  the big prize? What is the probability that, among a group of six people, someone will win the
  big prize?

  For each number in the sequence, there is only one way to sum to 100. So there are 21 ways of summing to 100, but $21^2$  ways to sum them in total. So the probability of success $p = 21/21^2 = 1/21$.

  Then, $F(6) = 1 - (20/21)^6 = 0.254$
]

#problem(3.17)[
  Let $m_X (t)$ be the moment generating function for a random variable $X$ and define
  $φ(t) = ln(m_X (t))$. What are $m_X (0)$, $m'_X (0)$, $φ(0)$, $φ'(0)$ and $φ''(0)$?

  $m_X (0) = 1$

  $m'_X (0) = mu_X$

  $φ(0) = ln(E[e^0]) = ln(E[1]) = 0$

  $φ'(0) = (m'_X (0))/(m_X (0)) = mu_X$

  $φ''(0) = (m''_X (0) m_x (0) - m'_X (0) m'_X (0))/ (m_X (0))^2 = sigma^2_X$
]
#problem(3.28)[
  The EverBitter Coffee Company knows that 10% of the beans in its one-pound bag of Wince
  blend coffee are quakers... beans that for some reason didn’t get fully roasted.
  These beans are greenish in color and are easy to detect by inspection. Kent Tastemuch’s job is to measure
  the quality of a bag of Wince by dumping a sample one-pound bag into a large box. He then
  shakes the box, selects a bean at random for test in the Green-or-not-green machine, returns
  the bean to the box, pulls out a second bean, tests, returns, and so on. Let C be the number
  of tests made before finding the first quaker. What is $P[20≤C≤25]$?

  $p = 0.1$

  $P[20 <= C <= 25] = F(25) - F(19) = (1 - .9^25) - (1 - .9^19) = .9^19 - .9^25 = 0.06$
]
#problem("Extra 1")[
  Determine the mean and variance of the variable in
  book problem 32 (pg 87) using the results from problem
  Notes-3 3.17.

  $m_X (t) = e^(2(e^t - 1))$

  $phi(t) = ln(m_X (t)) = 2(e^t-1)$

  $mu_X = phi'(0) = 2e^0 = 2$

  $sigma^2_X = phi''(0) = 2e^0 = 2$
]
