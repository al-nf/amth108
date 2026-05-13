// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 14"
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

#problem(4)[
  Some plastics in scrapped cars can be stripped out and broken down to recover
  the chemical components. The greatest success has been in processing the
  flexible polyurethane cushioning found in these cars. Let $X$ denote the amount of
  this material, in pounds, found per car. Assume that the density for $X$ is given by
  $
    f(x) = 1/(ln 2) 1/x quad 25 <= x <= 50
  $

  #part("a",
    [
      Verify that $f$ is a density for a continuous random variable.
    ],
    [
      $
        integral_(-infinity)^(infinity)f(x) d x = 1/(ln 2)integral_(25)^(50) 1/x d x= 1/(ln 2) [ln x]_(25) ^(50) = (ln 50)/(ln 2) - (ln 25)/(ln 2) = 1
      $
        So $f$ is a density function.
    ]
  )
  #part("b",
    [
      Use $f$ to find the probability that a randomly selected auto will contain
      between 30 and 40 pounds of polyurethane cushioning.
    ],
    [
      $
        1/(ln 2)integral_(30)^(40) 1/x d x= (ln 40 - ln 30)/(ln 2) = .415
      $
    ]
  )
  #part("c",
    [
      Sketch the graph of $f$, and indicate in the sketch the area corresponding to
      the probability found in part (b)
    ],
    [
      #canvas({
        plot.plot(
          size: (10, 4),
          x-min: 20, x-max: 55,
          y-min: 0, y-max: 0.08,
          x-tick-step: 5,
          y-tick-step: none,
          x-label: $x$,
          y-label: $f(x)$,
          axis-style: "school-book",
          {
            plot.add-fill-between(
              domain: (30, 40), samples: 200,
              style: (fill: gray.lighten(40%), stroke: none),
              x => 1 / (calc.ln(2) * x),
              x => 0,
            )

            plot.add(
              domain: (25, 50), samples: 300,
              style: (stroke: (paint: black, thickness: 0.8pt)),
              x => 1 / (calc.ln(2) * x)
            )
            plot.add-vline(25,
              min: 0,
              max: 0.058,
              style: (stroke: (paint: black, thickness: 0.6pt)),
            )
            plot.add-vline(50,
              min: 0,
              max: 0.029,
              style: (stroke: (paint: black, thickness: 0.6pt)),
            )

          }
        )
      })
    ]
  )
]
#problem(5)[
  A random variable X is said to be uniformly distributed over an
  interval $(a, b)$ if its density is given by
  $
    f(x) = 1/(b-a) quad a < x < b
  $
  
  #part("a",
    [
      Show that this is a density for a continuous random variable.
    ],
    [
      $
        integral_a ^b f(x) d x = 
        integral_a ^b 1/(b-a) d x = 1/(b-a) (b-a) = 1
      $
      So $f$ is a density function.
    ]
  )
  #part("b",
    [
      Sketch the graph of the uniform density.
    ],
    [
      #canvas({
        plot.plot(
          size: (10, 4),
          x-min: 0, x-max: 10,
          y-min: 0, y-max: 0.2,
          x-tick-step: 2,
          y-tick-step: none,
          x-label: $x$,
          y-label: $f(x)$,
          axis-style: "school-book",
          {
            plot.add-hline(0.1,
              min: 0,
              max: 10,
              style: (stroke: (paint: black, thickness: 0.6pt)),
            )
            plot.add-vline(10,
              min: 0,
              max: 0.1,
              style: (stroke: (paint: black, thickness: 0.6pt)),
            )
          }
        )
      })
      In this example, $a = 0, b = 10$.
    ]
  )
  #part("c",
    [
      Shade the area in the graph of part (b) that represents $P[X <= (a + b)/2]$.
    ],
    [
      #canvas({
        plot.plot(
          size: (10, 4),
          x-min: 0, x-max: 10,
          y-min: 0, y-max: 0.2,
          x-tick-step: 2,
          y-tick-step: none,
          x-label: $x$,
          y-label: $f(x)$,
          axis-style: "school-book",
          {
            plot.add-fill-between(
              domain: (0, 5), samples: 200,
              style: (fill: gray.lighten(40%), stroke: none),
              x => 0.1,
              x => 0,
            )
            plot.add-hline(0.1,
              min: 0,
              max: 10,
              style: (stroke: (paint: black, thickness: 0.6pt)),
            )
            plot.add-vline(10,
              min: 0,
              max: 0.1,
              style: (stroke: (paint: black, thickness: 0.6pt)),
            )
          }
        )
      })
    ]
  )
  #part("d",
    [
      Find the probability pictured in part (c).
    ],
    [
      $P[X <= (a+b)/2] = 0.5$
    ]
  )
  #part("e",
    [
      Let $(c, d)$ and $(e, f)$ be subintervals of $(a, b)$ of equal length. What is the
      relationship between $P[c <= X <= d]$ and $P[e <= X <= f]$? Generalize the idea
      suggested by this example, thus justifying the name “uniform” distribution.
    ],
    [
      $P[c <= X <= d]$ and $P[e <= X <= f]$ are the same. Since any two subintervals
      of equal length have the same probability distribution, we can call this distribution uniform.
    ]
  )
]
#problem(6, breakable: true)[
  If a pair of coils were placed around a homing pigeon and a magnetic field
  was applied that reverses the earth’s field, it is thought that the bird would become
  disoriented. Under these circumstances it is just as likely to fly in one
  direction as in any other. Let $theta$ denote the direction in radians of the bird’s
  initial flight. See Fig. 4.18. $theta$ is uniformly distributed over the interval [0, 27].

  #part("a",
    [
      Find the density for $theta$.
    ],
    [
      $f(theta) = 1/(2pi)$
    ]
  )
  #part("b",
    [
      Sketch the graph of the density. The uniform distribution is sometimes
      called the “rectangular” distribution. Do you see why?
    ],
    [
      #canvas({
        plot.plot(
          size: (10, 4),
          x-min: 0, x-max: 7,
          y-min: 0, y-max: 0.2,
          x-tick-step: 2,
          y-tick-step: none,
          x-label: $x$,
          y-label: $f(x)$,
          axis-style: "school-book",
          {
            plot.add-hline(0.159,
              min: 0,
              max: 6.28,
              style: (stroke: (paint: black, thickness: 0.6pt)),
            )
            plot.add-vline(6.28,
              min: 0,
              max: 0.159,
              style: (stroke: (paint: black, thickness: 0.6pt)),
            )
          }
        )
      })
      The density forms a rectangular shape.
    ]
  )
  #part("c",
    [
      Shade the area corresponding to the probability that a bird will orient
      within $pi/4$ radians of home, and find this area using plane geometry.
    ],
    [
      #canvas({
        plot.plot(
          size: (10, 4),
          x-min: 0, x-max: 7,
          y-min: 0, y-max: 0.2,
          x-tick-step: 2,
          y-tick-step: none,
          x-label: $x$,
          y-label: $f(x)$,
          axis-style: "school-book",
          {
            plot.add-hline(0.159,
              min: 0,
              max: 6.28,
              style: (stroke: (paint: black, thickness: 0.6pt)),
            )
            plot.add-vline(6.28,
              min: 0,
              max: 0.159,
              style: (stroke: (paint: black, thickness: 0.6pt)),
            )
            plot.add-fill-between(
              domain: (0, .785), samples: 200,
              style: (fill: gray.lighten(40%), stroke: none),
              x => 0.159,
              x => 0,
            )
          }
        )
      })
      $
        (pi/4)/(2pi) = 1/8
      $
    ]
  )
  #part("d",
    [
      Find the probability that a bird will orient within $pi/4$ radians of home by
      integrating the density over the appropriate region(s), and compare your
      answer to that obtained in part (c).
    ],
    [
      $
        integral_0 ^(pi/4) 1/(2pi) d x = (pi/4) / (2pi) = 1/8
      $
    ]
  )
  #part("e",
    [
      If 10 birds are released independently and at least seven orient within $pi/4$
      radians of home, would you suspect that perhaps the coils are not
      disorienting the birds to the extent expected? Explain, based on the probability
      of this occurring.
    ],
    [
      $
        P[x >= 7] = F_"binom" (10) - F_"binom" (6), "where" p = 1/8\
        F(10) - F(6) = 1 - 0.99949 = 0.00051
      $
      The probability of this occuring is very small, so I would expect that the coils do not work as advertised.
    ]
  )
]
#problem(11)[
  Consider the random variable of Exercise 6.
  #part("a",
    [
      Use Exercise 10 to find the cumulative distribution function $F$.
    ],
    [
      $F(x) = (x-a)/(b-a) = x/(2pi)$
    ]
  )
  #part("b",
    [
      Find $F''(x)$, and verify that your result is, as expected, the uniform density
    over the interval $[0, 2pi]$.
    ],
    [
      $F'(x) = f(x) = 1/(2pi)$, which is the density function.
    ]
  )
]
#problem(14, breakable: true)[
  In parts (a) and (b) proposed cumulative distributions are given. In each case,
  find the “density” that would be associated with each, and decide whether it
  really does define a valid continuous density. If it does not, explain what
  property fails.

  #part("a",
    [
      Consider the function $F$ defined by
      $
        cases(
          0 quad x < -1,
          x+1 quad -1 <= x <= 0,
          1 quad x > 0
        )
      $
    ],
    [
      The derivative of this function is:
      $
        cases(
          0 quad x < -1,
          1 quad -1 <= x <= 0,
          0 quad x > 0
        )
      $
      This is a valid density function: the integral from $-infinity$ to $infinity$ is 1 by inspection.
    ]
  )
  #part("b",
    [
      Consider the function $F$ defined by
      $
        cases(
          0 quad x < 0,
          x^2 quad 0 < x <= 1/2,
          x/2 quad 1/2 < x <= 1,
          1 quad x > 1
        )
      $
    ],
    [
      The derivative of this function is:
      $
        cases(
          0 quad x < 0,
          2x quad 0 < x <= 1/2,
          1/2 quad 1/2 < x <= 1,
          0 quad x > 1
        )
      $
      The integral of this function from $-infinity$ to $infinity$ is $1/4 + 1/4 = 1/2$, which is not 1. This function is not a density function.
    ]
  )
]

#problem(4.1)[
  The random variable $X$ has a continuous density function given by $f (x) = (3x^2)/8$ for $0 ≤ x ≤ 2$.
  Sketch a graph of the distribution function, $F (x)$, for the random variable $X$. What are $F (−1)$,
  $F (1)$, and $F (3)$? What are $E[X]$, $σ^2_X$, and $m_X (t)$?

  #canvas({
    plot.plot(
      size: (10, 4),
      x-min: 0, x-max: 2,
      y-min: 0, y-max: 1,
      x-tick-step: 1,
      y-tick-step: none,
      x-label: $x$,
      y-label: $F(x)$,
      axis-style: "school-book",
      {
        plot.add(
          domain: (0, 2), samples: 300,
          style: (stroke: (paint: black, thickness: 0.8pt)),
          x => x*x*x/8
        )
        plot.add-vline(2,
          min: 0,
          max: 1,
          style: (stroke: (paint: black, thickness: 0.6pt)),
        )
      }
    )
  })

  $
    F(-1) = 0, F(1) = 1/8 , F(3) = 1\
    E[X] = integral_0 ^ 2 (3x^3)/8 d x = 3/32 2^4 = 3/2\
    sigma^2_X = integral_0 ^ 2 (3x^4)/8 d x - (3/2)^2= 3/40 2^5 - 9/4= .15\
    m_X (t) = E[e^(x t)] = integral_0 ^2 (3x^2 e^(x t))/8 d x = 3/8 ([(x^2 e^(x t))/t]_0 ^2 -integral_0 ^2 (2x e^(x t))/ t d x) =\
    3/(2t) e^(2t) - 3/8[(2x e^(x t))/t^2]_0 ^2 - 3/4 integral_0 ^2 e^(x t)/t^2 d x = 3/(2t) e^(2 t) - 3/(2t^2) e^(2t) - 3/(2t^3) e^(2t) =\
    3/2 e^(2t) (1/t + 1/t^2 + 1/t^3)
  $

]
#problem(4.2)[
  The arrival of the city busses that trundle down my street is Poisson distributed. According to
  the published schedule, they arrive every 10 minutes. I arrive at the bus stop in the morning.
  What is the probability that a bus will come along in the next 3 minutes?

  $
    lambda = 10\
    P[t <= 3] = sum_(t=1) ^3(lambda^x e^(-lambda))/x! = 10e^(-10) + (10^2e^(-10))/2! + (10^3e^(-10))/3! = 0.01

  $
]

#problem("Extra 2")[
  Orders for coffee drinks at the local coffee bar
  appear on the store's printer following a Poisson process
  at a rate of 5 orders per hour during the middle of the
  afternoon. During the mid-afternoon hours of 2p--3p,
  what is the probability that orders appear in the first
  10 minutes and orders appear in the last 10 minutes but
  no orders are received in the intervening 40 minutes?

  $
    P[N >= 1, t < 10]P[N = 0, 10 < t < 50]P[N >= 1, 50 < t < 60]\
    (1 - e^(-5/6))(e^(-10/3))(1 - e^(-5/6)) = 0.011
  $
]
