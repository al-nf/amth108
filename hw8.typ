// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 8"
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
#problem(7)[
  Grafting, the uniting of the stem of one plant with the stem or root of another,
  is widely used commercially to grow the stem of one variety that produces fine
  fruit on the root system of another variety with a hardy root system. Most
  Florida sweet oranges grow on trees grafted to the root of a sour orange variety.

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
      Find $f(5)$.
    ],
    [
      $f(5)$ = 0.01
    ]
  )
  #part("b",
    [
      Find the table for $F$.
    ],
    [
      #align(center)[
        #table(
          columns: (auto, auto, auto, auto, auto, auto, auto), 
          align: center,
          table.header([x], [0], [1], [2], [3], [4], [5]),
          [F(x)], [.7],  [.9], [.95], [.98], [.99], [1]
        )
      ]
    ]
  )
  #part("c",
    [
      Use $F$ to find the probability that at most three grafts fail; that at least two
      grafts fail.
    ],
    [
      $F(3) = .98$, $F(5) - F(1) = .1$
    ]
  )
  #part("d",
    [
      Use $F$ to verify that the probability of exactly three failures is .03.
    ],
    [
      $F(3) - F(2) = .98 - .95 = .03 = f(3)$
    ]
  )
]
#problem(10)[
  It is known that the probability of being able to log on to a computer from a 
  remote terminal at any given time is .7. Let $X$ denote the number of attempts that
  must be made to gain access to the computer.
  #part("a",
    [
      Find the first four terms of the density table.
    ],
    [
      $.7, .3(.7), .3^2(.7), .3^3(.7)$
    ]
  )
  #part("b",
    [
      Find a closed-form expression for $f(x)$.
    ],
    [
      $f(x) = .7(.3^x)$
    ]
  )
  #part("c",
    [
      Find $P[X = 6]$.
    ],
    [
      $P[X=6] = f(6) = .7(.3^5) = .0017$
    ]
  )
  #part("d",
    [
      Find a closed-form expression for $F(x)$.
    ],
    [
      $F(x) = .7sum_(k=0)^(x-1) .3^k$
    ]
  )
  #part("e",
    [
      Use $F$ to find the probability that at most four attempts must be made to gain access to the computer.
    ],
    [
      $F(4) = .7sum_(k=0)^3 .3^k = .7(1 + .3 + .3^2 + .3^3) = .992$
    ]
  )
  #part("f",
    [
      Use $F$ to find the probability that at least five attempts must be made to
      gain access to the computer.
    ],
    [
      $F(infinity) - F(4) = 1 - .992 = .008$
    ]
  )
]
#problem(12)[
  Past experience shows that over time the rivets in bridge supports can become
  dangerously loose. Assume that X, the number of loose rivets found per 10 feet
  beam on bridges over 20 years old, has this cumulative distribution:
  #align(center)[
    #table(
      columns: (auto, auto, auto, auto, auto, auto, auto, auto), 
      align: center,
      table.header([x], [0], [1], [2], [3], [4], [5], [6]),
      [F(x)], [.05],  [.15], [.35], [.65], [.85], [.95], [1.0]
    )
  ]
  #part("a",
    [
      Find the density table for X.
    ],
    [
      #align(center)[
        #table(
          columns: (auto, auto, auto, auto, auto, auto, auto, auto), 
          align: center,
          table.header([x], [0], [1], [2], [3], [4], [5], [6]),
          [f(x)], [.05],  [.1], [.2], [.3], [.2], [.1], [.05]
        )
      ]
    ]
  )
  #part("b",
    [
      Verify that
      $
        f(x) = (6 - 2|x-3|) / 20: x = 1,2,3,4,5
      $
      $
        f(x) = (4-|x-3|)/20: x = 0 "or" 6
      $
    ],
    [
      $
        (4 - |0-3|) / 20 = 1/20 = .05= f(0)\
        (6 - 2|1-3|) / 20 = 1/10 = .1 = f(1)\
        (6 - 2|2-3|) / 20 = 1/5 = .2 = f(2)\
        (6 - 2|3-3|) / 20 = 3/10 = .3 = f(3)\
        (6 - 2|4-3|) / 20 = 1/5 = .2 = f(4)\
        (6 - 2|5-3|) / 20 = 1/10 = .1 = f(5)\
        (4 - |6-3|) / 20 = 1/20 = .05= f(6)\
      $
    ]
  )
]

//notes
#problem(3.18)[
  Let $X$ be a discrete random variable that takes the values $2.5, 3 1/3, 5, 10$ with
  density function given by $f(2.5) = 0.4, f(3 1/3) = 0.3,f(5) = 0.2, f (10) = 0.1$
  #part(1,
    [
      Sketch $F(x)$.
    ],
    [
      The graph of $F(x)$ should be $.4u(x-2.5) + .3u(x-3.33) + .2u(x-5) + .1u(x-10)$, where $u(x)$ is the unit step function.
    ]
  )
  #part(2,
    [
      $E[X] = ?$
    ],
    [
      $E[X] = .4(2.5) + .3(3 1/3) + .2(5) + .1(10) = 1 + 1 + 1 + 1 = 4$
    ]
  )
  #part(3,
    [
      $"var" X = ?$
    ],
    [
      $E[X^2] = .4(2.5)^2 + .3 (3 1/3)^2 + .2(5)^2 + .1(10)^2 = 2.5 + 3 1/3 + 5 + 10 = 20.833$
    ]
  )
  #part(4,
    [
      If our testing protocol prevents $X$ from taking the value 10, what is the probability that X now takes on the value 5?
    ],
    [
      $f(10) = 0$

      Now, $f(5) = (.2)/(.9) = 2/9$
    ]
  )
]
#problem(3.19)[
  Let X be a random variable whose distribution function takes the form:

  $F(x) = cases(
    0.0: x < −1,
    0.3: −1 ≤ x < 1,
    0.4: 1 ≤ x < 2,
    0.6: 2 ≤ x < 4,
    0.7: 4 ≤ x < 5,
    1.0: 5 ≤ x,
  )
  $
  #part(1,
    [
      Sketch a graph of the probability density function $f(x)$ for this random variable (from your
      graph it should be possible to determine the value of $f(x)$ for every $x$).
    ],
    [
      The graph of $f(x)$ should look like $.3delta(x+1) + .1delta(x-1) + .2delta(x-2)+.1delta(x-4) + .3delta(x-5)$, where $delta(x)$ is the unit impulse function.
    ]
  )
  #part(2,
    [
      What are the mean and variance of X?
    ],
    [
      $mu = .3(-1) + .1(1) + .2(2) + .1(4) + .3(5) = 2.1$\
      $sigma^2 = .3(-1)^2 + .1(1)^2 + .2(2)^2 + .1(4)^2 + .3(5)^2 = 10.3$
    ]
  )

]

#problem("Extra 1")[
  The random variable $X$ produces values $... -3, -2, -1, 1, 2, 3, ...$ with a density function
  given by $f(x)=k 2^(-|x|)$, where $k$ is a constant.

  #part(1,
    [
      What value of $K$ makes $f(x)$ into a density function?
    ],
    [
      If $sum_(i = -infinity)^(infinity) f(i) = 1, f(x)$ is a density function.\
      Suppose $K=1$. Then,\
      The sum of all $f(x)$ is $2 f(1)+2f(2) + ... = 1 + 1/2 + 1/4 +  1/8 + ...$\
      We can identify this as a geometric series, namely $sum_(k=0)^infinity (1/2)^k$.\
      This series converges to $1/(1-1/2)$ = 2.\
      Hence, $K = 1/2$.
    ]
  )
  #part(2,
    [
      Using K from (1), let $F(x)$ be the distribution function associated with $X$. Compute $F(-1), F(0), F(10)$
    ],
    [
      $
        F(-1) = 1/2 (2^(-1) + 2^(-2) + 2^(-3) + ...) = 1/4 + 1/8 + 1/16 + ... = 1/2.
      $
      $
        F(0) = F(-1) + f(0) = 1/2 + 0
      $
      $
        F(10) = 1/2 + (1/4 + 1/8 + 1/16 + ... + 1/2^11) approx 1.
      $
    ]
  )
  #part(3,
    [
      Find $P[-a <= X <= a]$.
    ],
    [
      $P[-a <= X <= a] = F(a) - F(-a-1)$
    ]
  )
]
#problem("Extra 2")[
  Suppose the random variable $Y$ is a constant $k$.
  #part(1,
    [
      What is the density function of $Y$?
    ],
    [
      $f(y) = 1 <=> y = k$
    ]
  )
  #part(2,
    [
      What is the distribution function of Y?
    ],
    [
      The distribution function of $Y$ is a step function $u(y-k)$.
    ]
  )
]
#problem("Extra 3")[
  Let X be a random variable that produces only the
  values $-1, 0 ,3, 4$ with a density function given by
  $f(-1)=0.15, f(0)=0.45, f(3)=0.1, f(4)=0.3$. Find the
  density function for the random variable $Y=X^3$.

  The density function of Y is given by the values $f(1)=0.15, f(0)=0.45, f(9)=0.1, f(64)=0.3.$
]
#problem("Extra 4")[
  A FAX machine is a
  photocopier that instead of printing the scanned image on
  paper, transmits the image via telephone to a remote FAX
  machine that then prints it. As of a few years ago, this
  was still used in the UK to send medical information from
  place to place. A doctor is going to FAX a prescription
  to a local pharmacy. Let p be the probability that the
  doctor's FAX machine is able to make contact with the
  pharmacy's FAX machine. If the doctor's FAX machine is
  unable to make contact, the sending FAX machine hangs up
  the phone and tries again. Assume that the sending FAX
  keeps trying to connect until the FAX on the receiving
  end answers and a connection is made. At this point the
  transmitting FAX stops trying to connect and sends the
  photo to the receiver. Assume that the attempts to
  connect are made independently of each other.


  What is the probability that a connection is
  made on the $n$th attempt for $n=1, 2, 3, ...$

  $p(1-p)^(n-1)$
]
