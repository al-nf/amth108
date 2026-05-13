// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 7"
#let student = "Alan Fung"
#let date    = "20 Apr. 2026"
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

#problem(2.29)[
  To navigate on Lake Latte (fed by the Decaf and the Vanilla Rivers) at least two of the three
  radio navigation beacons must be working. If the probability that a beacon is working is p and
  the operational status of each station is independent of the other two, what is the probability
  of being able to navigate on the lake? What is the probability that beacon #2 is working if
  navigation on the lake is possible?

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
      draw.content("v.a", [.12])
      draw.content("v.b", [.12])
      draw.content("v.c", [.12])
      draw.content("v.ab", [.04])
      draw.content("v.ac", [.04])
      draw.content("v.bc", [.04])
      draw.content("v.abc", [.008])
      draw.content("v.not-abc", [.512])
    })
  ]

  $
    P("nav") = .128\
    P("2 works" | "nav") = P("2 works" "nav")/P("nav") = (P("2 works")P("nav")) / P("nav") = .12
  $
]
#problem("2.30")[
  A rat is placed into the set of rooms depicted at left. When the rat hears a bell it
  moves to the other room, or not, depending
  on whimsy. The probability that the rat will
  move to room B given that it is in room A is
  1/3. The probability that the rat will move
  to room A given that it is in room B is 1/2.
  The rat is initially placed into room B.\
  What is the probability that the rat is in room B after the bell has rung twice?

  $
    1/2(2/3) + 1/2(1/2) = 1/3 + 1/2 = 5/6
  $
]

#problem(2.31)[
  With respect to the previous problem, if the rat is observed to be in room B after two bells
  what is the probability that the rat was in room B after one bell?

  $
    P("B after 1" | "B after 2") = P("B after 1") * P("B after 2"|"B after 1")/P("B after 2") = 1/2 * (1/2)/(5/6) = 1/4 * 6/5 = .3
  $
]

#problem(2.32)[
  Each day our oil market analysts issue their forcast for the change in the price of oil at the
  close of trading for each of the next two days. (Assume that the daily change in the oil price is
  limited to one of +\$1, \$0, or − \$1.)
  Early on Monday afternoon, they issue the following two day report

  tuesday:\
  up 1: .6\
  unchanged: .05\
  down 1: .35\

  wednesday:\
  up 1: .25\
  unchanged: .2\
  down 1: .55

  $
    P("up") = .6(.25 + .2) + .05(.25) = .28
  $
  It's more likely that oil stays the same or goes down, so we won't buy oil.
]

#problem(2.33)[
  The famed Dutch philosopher H. D. Holland was once cited by a Detroit traffic cop for failing
  to stop in the name of love – a supreme insult to such a renowned thinker. Professor Holland
  is a poor driver and the chances that he actually came to a full stop is only 0.15. On the other
  hand, the cop’s ability to see truth is only .70. Given that a ticket was issued, what is the
  probability that Professor Holland actually stopped?

  $
    P("ticket") = .64\
    P("stop") = .15 * .7 / .64 = .164
  $
]

#problem(35)[
  A test has been developed to detect a particular type of arthritis in 
  individuals over 50 years old. From a national survey it is known that
  approximately 10% of the individuals in this age group suffer from this form of
  arthritis. The proposed test was given to individuals with confirmed arthritic
  disease, and a correct test result was obtained in 85% of the cases. When the
  test was administered to individuals of the same age group who were known
  to be free of the disease, 4% were reported to have the disease. What is the
  probability that an individual has this disease given that the test indicates its
  presence?

  $
    .1(.85) / (.1(.85) + .9(.04)) = .70
  $
]

#problem(37)[
  As society becomes dependent on computers, data must be communicated via
  public communication networks such as satellites, microwave systems, and
  telephones. When a message is received, it must be authenticated. This is done
  by using a secret enciphering key. Even though the key is secret, there is al-
  ways the possibility that it will fall into the wrong hands, thus allowing an
  unauthentic message to appear to be authentic. Assume that 95% of all mes-
  sages received are authentic. Furthermore, assume that only .1% of all unau-
  thentic messages are sent using the correct key and that all authentic messages
  are sent using the correct key. Find the probability that a message is authentic
  given that the correct key is used.

  $
    .95(1) / (.95(1) + .5(.001)) = .999
  $
]
#problem(41)[
  A computer center has three printers, A, B, and C, which print at different
  speeds. Programs are routed to the first available printer. The probability that
  a program is routed to printers A, B, and C are .6, .3, and .1, respectively. 
  Occasionally a printer will jam and destroy a printout. The probability that
  printers A, B, and C will jam are .01, .05, and .04, respectively. Your program is
  destroyed when a printer jams. What is the probability that printer A is
  involved? Printer B is involved? Printer C is involved?

  $
    P(A) = (.6(.01))/(.6(.01) + .3(.05) + .1(.04)) = 0.038\
    P(B) = (.3(.05)/(.6(.01) + .3(.05) + .1(.04)) = 0.0938\
    P(C) = (.1(.04))/(.6(.01) + .3(.05) + .1(.04)) = 0.025\
  $
]
