// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 5"
#let student = "Alan Fung"
#let date    = "13 Apr. 2026"
// -----------------------------------------------------
#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-venn:0.1.4": venn2, venn3
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

#problem(2.28)[
  My local theatre company is going to stage _Cat on a Streetcar named Iguana_. After the first
  round of auditions, it is determined that 30% of the applicants can act, 60% look like Marlon
  Brando, and 52% can simultaneously tap dance while singing. There are 10% of the applicants
  who possess all three of these attributes and an additional 10% who possess none of these
  qualities. The casting director says that she’ll be happy with someone who possesses at least 2
  of these traits. If 100 people audition, how many satisfactory choices will the casting director
  have?
  #align(center)[
    #canvas({
      venn3(
        name: "v",
        a-fill: red,
        b-fill: blue,
        c-fill: yellow,
        ab-fill: purple,
        ac-fill: orange,
        bc-fill: green,
        abc-fill: gradient.conic(..color.map.rainbow),
        not-abc-fill: white,
      )
      draw.content("v.a", [])
      draw.content("v.b", [])
      draw.content("v.c", [])
      draw.content("v.ab", [])
      draw.content("v.ac", [])
      draw.content("v.bc", [])
      draw.content("v.abc", [10])
      draw.content("v.not-abc", [10])
    })
  ]
]

$
  .9 = P(A) + P(B) + P(C) - P(A B) - P(A C) - P(B C) + P(A B C)\
  = .30 + .6 + .52 - P("TWO") + 3(.1)
$
So the number of satisfactory candidates is (32 + 10) = 42.

#problem(2.36)[
  A communications circuit is known to have an availability of 0.99 (that is, 99% of the time, the
  circuit is operational). A total of n such circuits are going to be set up by the FAA between San
  Francisco and Los Angeles in such a way that the circuits will fail independently of each other.
  How many such parallel circuits must be set up to attain an overall availabililty of 0.99999?
  (Note: a famous failure involving FAA communications occured at the ARTCC located near
  Hinsdale, IL. The Hinsdale ATC center had primary and back-up communications circuits in
  place. Unfortunately, all of the cables ran out of the building through the same conduit. Enter,
  stage left, one (1) backhoe . . . !!!)

  $
    P("fail") = .01\
    .99999 = 1 - .01^n\
    1 - 10^(-5) = 1 - 10^(-2n)\
    2n = 5\
    n = 2.5
  $
  We need at least three parallel circuits to attain an overall availability of at least 0.99999.
]

#problem(2.37)[
  A communications circuit is known to have an availability of 0.99 (that is, 99% of the time,
  the circuit is operational). The FAA leases three such circuits between San Francisco, CA
  and Hillsboro, MO and two more such circuits betweeen Hillsboro, MO and Washington, DC.
  Communications between San Francisco and Washington are said to be up if at least one
  SF↔MO and one MO↔DC circuit are available. If all circuits fail independently of the others,
  what is the probability that SF↔DC communications are up?

  $
    P("up") = (1-.01^3)(1-.01^2) = 0.999999
  $
]

#problem("Extra 1")[
  Show that $binom(n, 0) + binom(n, 1) + ... + binom(n, n)$ counts the total number of subsets
  possessed by a set of $n$ elements.

  Let S be some set of elements sized $n$ = ${s_1, s_2, ..., s_n}$

  There is 1 0-element subset of $S$ - the empty set.\
  There are $n$ unique elements to attach to that, so there are $n$ 1-element subsets of $S$.\
  There are $n-1$ unique elements to attach to that, so there are $n(n-1)/2$ 2-element subsets of $S$.\

  By some informal induction, we can observe that there are $binom(n, k)$ k-element subsets of $n$, so if we add them all up we should get the above sum.
]

#problem("Extra 2")[
  Let $N_k$ represent the number of subsets possessed by a $k$ element set.
  Let $X_1$ be a 1 element set: ${a}$. There are two subsets of $X_1$: 
  namely, $X_1$ and the empty set. So $N_1=2$. Let $X_2$ represent a two
  elements set: ${a, b}$. There are four subsets of $X_2$: namely, the 
  empty set, ${a}, {b}$, and ${a,b}=X_2$. In this case $N_2=4$. 
  Let $X_k$ represent any set with $k$ elements and let $w$ be an element 
  that is different from any of the elements of $X_k$. 
  Let $X_{k+1}={w} union X_k$.
  What is the relationship between $N_{k+1}$ and $N_k$?

  $N_{k+1} = 2N_k$
]

#problem("Extra 3")[
  Establish that $binom(n, 0) + binom(n, 1) + ... + binom(n, n) = 2^n$.

  $
    N_n = 2N_(n-1) = 4N_(n-2) = ... = 2^n N_0 = 2^n
  $
]

#problem("Extra 4")[
  To determine if $k$ events, $E_1, E_2, ..., E_k$ are
  independent two conditions must be present:\
  (1) $P[E_1 E_2 ... E_k]=P[E_1]P[E_2] ... P[E_k]$\
  (2) All collections formed by selecting $k-1$ of these
  events are also a set of independent events.
  As an example, to show that three events $A, B, C$ are
  independent, one must establish (1) for the three events
  and then establish (1) for all pairs of events: $A,B; A,C;
  B,C$. Four verifications of (1) must be done.
  How many verifications of (1) must be done for the
  general case of n events?

  Since you need to verify (1) for every subset of ${E_1, E_2, ..., E_n}$, you need to perform $2^n$ verifications.
]
