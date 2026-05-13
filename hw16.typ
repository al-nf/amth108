// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 16"
#let student = "Alan Fung"
#let date    = "11 May 2026"
// -----------------------------------------------------
#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot
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

#problem(40)[
  The bulk density of soil is defined as the mass of dry solids per unit bulk
  volume. A high bulk density implies a compact soil with few pores. Bulk density
  is an important factor in influencing root development, seedling emergence,
  and aeration. Let X denote the bulk density of Pima clay loam. Studies show
  that X is normally distributed with $mu = 1.5$ and $sigma = .2 g/(c m^3)$.

  #part("a",
    [
      What is the density for X? Sketch a graph of the density function. Indicate
      on this graph the probability that X lies between 1.1 and 1.9. Find this
      probability.
    ],
    [
      f(x) is the density function of the normal distribution, with $mu = 1.5 quad sigma = .2 g/(c m^3)$.

      P[1.1 < X < 1.9] = 95% ($plus.minus 2 sigma$)
    ]
  )
  #part("b",
    [
      Find the probability that a randomly selected sample of Pima clay loam
      will have bulk density less than $.9 g/(c m^3)$.
    ],
    [
      $P[X < .9] = Phi(-3) = 0.001$
    ]
  )
  #part("c",
    [
      Would you be surprised if a randomly selected sample of this type of soil
      has a bulk density in excess of $2.0 g/(c m^3)$? Explain, based on the
      probability of this occurring.
    ],
    [
      $P[X > 2.0] = Phi(-2.5) = 0.006$, so I would be surprised.
    ]
  )
  #part("d",
    [
      What point has the property that only 10% of the soil samples have bulk
      density this high or higher?
    ],
    [
      $z = 1.282 -> (x - 1.5)/0.2 = 1.282 -> x =  1.76$
    ]
  )
  #part("e",
    [
      What is the moment generating function for X?
    ],
    [
      $e^(mu t + (sigma t)^2/2) = e^(1.5t + (0.04t^2)/2)$
    ]
  )
]
#problem(41)[
  Most galaxies take the form of a flattened disc, with the major part of the light
  coming from this very thin fundamental plane. The degree of flattening differs
  from galaxy to galaxy. In the Milky Way Galaxy most gases are concentrated
  near the center of the fundamental plane. Let X denote the perpendicular
  distance from this center to a gaseous mass. X is normally distributed with mean 0
  and standard deviation 100 parsecs. (A parsec is equal to approximately 19.2
  trillion miles.)

  #part("a",
    [
      Sketch a graph of the density for X. Indicate on this graph the probability
      that a gaseous mass is located within 200 parsecs of the center of the fun-
      damental plane. Find this probability.
    ],
    [
      X is normally distributed, with mean 0. The stated probability is $P [|X| > 2 sigma]$ = 95%
    ]
  )
  #part("b",
    [
      Approximately what percentage of the gaseous masses are located more
      than 250 parsecs from the center of the plane?
    ],
    [
      $P[|X| > 250] = 2Phi(-2.5)= 0.0124$
    ]
  )
  #part("c",
    [
      What distance has the property that 20% of the gaseous masses are at
      least this far from the fundamental plane?
    ],
    [
      $z = 1.28 -> x = 1.28(100) = 128 p c$
    ]
  )
  #part("d",
    [
      What is the moment generating function for X?
    ],
    [
      $e^(mu t + (sigma t)^2/2 = e^(5000t^2)$
    ]
  )
]
#problem(43)[
  Let X denote the time in hours needed to locate and correct a problem in
  the software that governs the timing of traffic lights in the downtown area of
  a large city. Assume that X is normally distributed with mean 10 hours and
  variance 9.

  #part("a",
    [
      Find the probability that the next problem will require at most 15 hours to
      find and correct.
    ],
    [
      $P[X < 15] = Phi(5/3) = 0.95$
    ]
  )
  #part("b",
    [
      The fastest 5% of repairs take at most how many hours to complete?
    ],
    [
      $z = -1.65 -> x = 5.1 "hr"$
    ]
  )
]
#problem(45)[
  The log-normal distribution is the distribution of a
  random variable whose natural logarithm follows a normal distribution. Thus
  if X is a normal random variable, then $Y = e^X$ follows a log-normal
  distribution. Complete the argument below, thus deriving the density for a log-normal
  random variable.

  Let X be normal with mean $mu$ and variance $sigma^2$. Let G denote the cumulative
  distribution function for $Y = e^X$, and let F denote the cumulative distribution
  function for X.

  #part("a",
    [
      Show that $G(y) = F(ln y)$.
    ],
    [
      $G(y) = P[Y <= y] = P[e^X <= y] = P[X <= ln y] = F(ln y)$
    ]
  )
  #part("b",
    [
      Show that $G'(y) = (F'(ln y))/y$.
    ],
    [
      $G'(y) = d/(d y) F(ln y) = F'(ln y) * 1/y = (F'(ln y))/y$
    ]
  )
  #part("c",
    [
      Show that the density for Y is given by 
      $
        g(y) = 1/(sqrt(2 pi) sigma y) e^(-1/2 ((ln y - mu)^2)/sigma^2)
      $
    ],
    [
      $g(y) = G'(y) = (F'(ln y))/y = f(ln y)/y$.
      Since $f$ is the density for the normal distribution:
      $
        g(y) = 1/y 1/(sqrt(2pi) sigma) e^(-1/2 (x-mu)^2 /sigma^2) = 1/(sqrt(2 pi) sigma y) e^(-1/2 ((ln y - mu)^2)/sigma^2)
      $
    ]
  )
]
#problem(4.8)[
  I make shafts that are used in aircraft engines. Each shaft I make has a diameter that is a
  normally distributed random variable with a mean of 2 cm and a standard deviation of 0.004
  cm. The FAA inspects every shaft and will reject a shaft whose diameter falls outside of the
  range 2 ± .006 cm. What proportion of my shafts get rejected?

  $P[2 - 0.006 < X < 2 + 0.006 = 2 Phi(-1.5) = 0.13$ 
]
#problem(4.9)[
  With respect to the previous problem, the FAA permits me to re-mill shafts whose diamters falls
  between 2.006 cm and 2.012 cm. What percentage of the shafts I produce may be re-milled?

  $P[2.006 < X < 2.012] = Phi(3) - Phi(1.5) = 0.066$
]
#problem(4.26)[
  O-rings are manufactured by forming a piece of wire into a circle, spot welding the ends together,
  and then coating the wire skeleton with vinyl. These O-rings will be used in an aircraft engine
  and the engine manufacturer requires the O-rings to have a diameter that lies between 0.9 and
  1.1 cm. The lengths of wire that my cutting machine can produce follow a normal distribution
  with mean π cm and variance 0.01. What is the probability that my O-rings will be acceptable
  to my customer?

  $
    D = L/pi -> mu_D = 1 quad sigma^2_D = 1/(100 pi^2) -> sigma_D = 1/(10 pi)\
    P[0.9 < D < 1.1] = Phi(3.14) = 0.998%
  $
]
#problem(4.27)[
   Let U be a normally distributed random variable with mean μ and variance σ2. Given a number
  r on $0 < r < 1$ determine the tail point $u_r$ (that is, solve $P [ U ≥ u_r ] = r$). 

  $
    P[U >= u_r] = r -> 1 - Phi(z(u_r)) = r -> z(u_r) = Phi^(-1) (1 - r) -> u_r - mu = sigma Phi^(-1) (1-r)\
    u_r = mu + sigma Phi^(-1) (1-r)
  $
]
#problem(4.28)[
  The thickness, X, of a small sheet of vinyl is a constant over a sheet but from sheet to sheet,
  the thickness follows a normal distribution with mean 1 and variance 1/9. One sheet is selected
  at random, cut into three identical, smaller pieces and laminated together to form a
  triple thickness piece of vinyl. What is the probability that the new laminate has a thickness that
  lies between 2 and 4?

  $
    Y = 3X -> mu_Y = 3 quad sigma^2_Y = 1\
    P[2 < Y < 4] = Phi(1) - Phi(-1) = 68%
  $
]
#problem(4.31)[
  The moment generating function for a random variable, X, is given by the expression $m_X (t) =
  e^t (1 + e^t)/2$. What are the mean and variance of X? Is the random variable X continuous or
  discrete?

  $
    m_X (t) = e^t / 2 + e^(2t) / 2\
    mu = 1/2 + 1 = 3/2\
    sigma^2 = 1/2 + 2 - (3/2)^2 = 5/2 - 9/4 = 1/4
  $

  Since $m_X (t)$ takes the form of a sum of multiples of exponentials, i.e. $sum e^(x t)$, so X is discrete.
]
