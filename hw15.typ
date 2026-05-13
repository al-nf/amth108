// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 15"
#let student = "Alan Fung"
#let date    = "11 May 2026"
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

#let problem(num, breakable: false, body) = {
  v(8pt)
  block(
    breakable: breakable,
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

#problem(16)[
  Let X denote the amount in pounds of polyurethane cushioning found in a car.
  The density for X is given by
  $
    f(x) = 1/(x ln 2) quad 25 <= x <= 50
  $

  Find the mean, variance, and standard deviation for X.

  $
    mu = integral_25^50 1/(ln 2) d x = 25/(ln 2) = 36.1\
    sigma^2 = integral_25^50 x/(ln 2) d x = [x^2 / (2 ln 2)]_25^50 = 1352.5\
    sigma = 36.8
  $
]
#problem(18)[
  The density for a random variable X distributed
  uniformly over (a, b) is
  $
    f(x) = 1/(b-a) quad a < x < b
  $
  Show that 
  $
    E[X] = (a+b)/2, quad "Var" X = (b-a)^2 /12
  $

  $
    E[X] = integral_a^b x f(x) d x = [x^2/(2(b-a))]_a^b = (b^2 - a^2)/(2(b-a)) = (a+b)/2\
    E[X^2] = integral_a^b x^2 f(x) d x = [x^3/(3(a-b))]_a^b = (b^3 - a^3)/(3(a-b)) \
    "Var" X = (b^3-a^3)/(3(b-a)) - (a+b)^2/4 = (a^2 + a b + b^2)/3 - (a^2 + 2 a b + b^2)/4 = (a^2 - b^2)/12
  $
]
#problem(19)[
  Let $theta$ denote the direction in radians of the flight of a
  bird whose sense of direction has been disoriented as described in Exercise 6.
  Assume that $theta$ is uniformly distributed over the interval $[0, 2pi]$. Use the results
  of Exercise 18 to tind the mean, variance, and standard deviation of $theta$.

  $
    mu = 2pi/2 = pi\
    sigma^2 = pi^2 / 12\
    sigma = pi/sqrt(12)
  $
]
#problem(24)[
  Assume that the increase in demand for electric power in millions of kilowatt
  hours over the next 2 years in a particular area is a random variable whose
  density is given by
  $
    f(x) = x^3/64 quad 0 < x < 4
  $
  #part("a",
    [
      Verify that this is a valid density.
    ],
    [
      $
        integral_0^4 x^3/64 d x = [x^4/4^4]_0^4 = 4^4/4^4 = 1
      $
    ]
  )
  #part("b",
    [
      Find the expression for the cumulative distribution for X, and use it to find
      the probability that the demand will be at most 2 million kilowatt hours.
    ],
    [
      $
        F(x) = integral_0^x f(tau)d tau = (x/4)^4\
        F(2) = (1/2)^4 = 0.0625
      $
    ]
  )
  #part("c",
    [
      If the area only has the capacity to generate an additional 3 million
      kilowatt hours, what is the probability that demand will exceed supply?
    ],
    [
      $
        P[x >= 3] = 1 - P[x <= 3] = 1 - F(3) = 1 -(3/4)^4 = 0.684
      $
    ]
  )
  #part("d",
    [
      Find the average increase in demand.
    ],
    [
      $
        1/4 [x^3/64]_0^4 = 1/4 "million" k W h
      $
    ]
  )
]
#problem(28)[
  Show that for $alpha > 0$ and $beta > 0$,
  $
    integral_0^infinity 1/(Gamma(alpha)beta^alpha) x^(alpha-1)e^(-x/beta) d x = 1
  $
  thereby showing that the function given in Definition 4.3.2 is a density for a
  continuous random variable.

  $
    I := integral_0^infinity 1/(Gamma(alpha)beta^alpha) x^(alpha-1)e^(-x/beta) d x\
    z := x/beta -> I = integral_0^infinity 1/(Gamma(alpha)(x/z)^alpha)x^(alpha-1) e^(-z) d x\
    I = integral_0^infinity z^alpha/(x e^z Gamma(alpha))d x\
    I = integral_0^infinity z^alpha/(beta z e^z Gamma(alpha))d x\
    d z = (d x)/beta -> d x = beta d z
    I = integral_0^infinity (z^(alpha-1) e^(-z))/Gamma(alpha)d z\
    I = Gamma(alpha)/Gamma(alpha) = 1
  $
]
#problem(4.14)[
  Let T be an exponentially distributed random variable. What is the probability that T falls
  within 2σ of the mean?

  $
    integral_(-beta)^(3 beta) 1/beta e^(-x/beta) d x =  [-e^(-x/beta)]_(-beta)^(3beta) = -e^(-3) + e^(-1) = 0.318
  $
]
#problem(4.15)[
  Let X be an exponentially distributed random variable with parameter β = 3. What is the
  moment generating function, mean, and variance for the random variable Y where Y = 3X?

  $
    f(x) = 3e^(-3x)\
    m_y (t) = E[e^(y t)] = E[e^(3x t)]\
    m_y (t) = integral_0^infinity 3e^(-3x) e^(3x t) d x\
    m_y (t) = integral_0^infinity 3e^(-3(1-t)x) d x\
    m_y (t) = 3/(-3(1-t)) (-e^0) = 1/(1-t)\
    mu_y = dot(m_y)(0) = 1 \
    sigma^2_y = dot.double(m_y)(0) - mu_y^2 = 2 - 1 =1 
  $

]
#problem(4.16)[
  Assume that muscle fatigue is exponentially distributed. That is, the time T that it takes to
  completely exhaust a muscle follows an exponential distribution. If the muscles I use for running
  will go for 100 minutes, on average, before fatigue sets in, what is the probability that the onset
  of fatigue occurs between 90 and 110 minutes?

  $
    mu = 100\
    P = integral_90^110 1/100e^(-x/100) d x = [-e^(-x/100)]_90^110 = -e^(-1.1) + e^(-0.9) = 0.0737 
  $
]
#problem(4.17)[
  With respect to the previous problem, I’ve noticed that ten percent of the time, I can run t
  minutes or longer. What is t?

  $
    0.1 = integral_t^infinity 1/100 e^(-x/100) d x\
    e^(-t/100) = 0.1\
    t = -100ln(0.1) = 230 "minutes"
  $
]
#problem(4.18)[
  The latest eThing is built up from an B-module and three U-modules. The cost of the B-module
  is \$25 and never varies. The U-modules, on the other hand, are constructed from parts whose
  cost is constantly changing with the market. Each day the cost to buy a U-module changes
  and long term observation reveals that the cost is continuously uniformly distributed over the
  interval \$10 to \$15. Assuming that the U-modules in my finished eThing were all bought on the
  same day, what are the mean and variance of the cost of materials to build an eThing? What
  is the probability that the cost to build an eThing will exceed \$67?

  $
    e = b + 3u\
    mu_B = 25 quad sigma^2_B = 0\
    mu_U  = 12.5 quad sigma^2_U = 25/12\
    P[e >= 67] = P[b + 3u >= 67] = P[3u >= 42] = P[u >= 14] = 4/5
  $
]
#problem(4.19)[
  With the rennaisance of unusual music, sales of Sackbutts, Serpents, Ocarinas, Sarousaphones,
  and Opheclydes are going off the charts. The company statistician believes that the gross
  revenue (in thousands of dollars) is a random variable following a Gamma distribution with
  α = 16√n and β = 5, where n is the size of the sales force. If cost of selling is \$8,000 per sales
  person (salary, travel expenses, client meeting costs, etc.) how large should the sales force be
  in order to maximize expected profits (Profits = Gross Revenues - Total Sales Costs)?

  $
    "Profits" = E[X] - 8000n\
    "Profits" = alpha beta - 8000n\
    "Profits" = 80sqrt(n) - 8000n\
    d/(d n)"Profits" := 80/sqrt(n) - 8000 = 0\
    80/sqrt(n) = 8000\
    n = 10\
  $
]
