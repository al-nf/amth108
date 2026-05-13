// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 10"
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
#problem(32)[
  A discrete random variable has moment generating function $m_x (t) = e^(2(e^t-1))$
  #part("a",
    [
      Find $E[X]$
    ],
    [
      $E[X] = m_x(0) = 1$
    ]
  )
  #part("b",
    [
      Find $E[X^2]$
    ],
    [
      $E[X^2] = (d m_x(0))/(d t) = 2$
    ]
  )
  #part("c",
    [
      Find $sigma^2 "and" sigma$
    ],
    [
      $sigma^2 = E[X^2] = 2, sigma = sqrt(2)$
    ]
  )
]
#problem(34)[
   A discrete random variable is said to be uniformly distributed if it assumes a
   finite number of values with each value occurring with the same probability.
   If we consider the generation of a single random digit, then Y, the number generated,
   is uniformly distributed with each possible digit occurring with probability 1/10.
   In general, the density for a uniformly distributed random variable is given by 
   n a positive integer f(x) = 1/n.
   #part("a",
    [
      Find the moment generating function for a discrete uniform random
      variable.
    ],
    [
      $m_X (t) = E[e^(t X)] = 1/n sum_i e^(t w_i)$
    ]
  )
  #part("b",
    [
      Use the moment generating function to find $E[X]$, $E[X^2], "and" sigma^2$:
    ],
    [
      $E[X] = m_X (0) = 1/n sum_i w_i$\
      $E[X^2] = (d m_X (0)/d t) - E[X]^2 = 1/n (sum_i w_i^2 - (sum_i w_i)^2)$
      $sigma^2 = E[X^2]$
    ]
  )
  #part("a",
    [
      Find the mean and variance for the random variable Y, the number obtained
      when a random digit generator is activated once.
    ],
    [
      $mu_Y = (n(n+1))/2$\
      $sigma_Y^2 = (n(n+1)(2n+1))/6 - mu_Y^2$
    ]
  )
]
#problem(35)[
  Let the density for X be given by
  $
    f(x) = c e^(-x)
  $
  #part("a",
    [
      Find the value of c that makes this a density.
    ],
    [
      $e^(-1) + 2e^(-2) + 3e^(-3) + ... = 0.921$\
      So c approx 1/.921 = 1.086.
    ]
  )
  #part("b",
    [
      Find the moment generating function for X.
    ],
    [
      $m_X (t) = sum_i e^(t c e^(-x))$
    ]
  )
  #part("c",
    [
      Use m_Y (t) to find E[X].
    ],
    [
      $m_Y (0) = 1.086$
    ]
  )
]
