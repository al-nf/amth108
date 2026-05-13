// --------------------- metadata  --------------------- 
#let course  = "Probability & Statistics"
#let name    = "Homework 6"
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

#problem(25)[
  A study of major flash floods that occurred over the last 15 years indicates that
  the probability that a flash flood warning will be issued is .5 and that the
  probability of dam failure during the flood is .33. The probability of dam failure
  given that a warning is issued is .17. Find the probability that a flash flood
  warning will be issued and a dam failure will occur.

  $
    P(W F) = P(F|W)P(W) =.17(.5) = .085
  $
]

#problem(26)[
  The ability to observe and recall details is important in science.
  Unfortunately, the power of suggestion can distort memory. A study of recall is 
  conducted as follows: Subjects are shown a film in which a car is moving along
  a country road. There is no barn in the film. The subjects are then asked a 
  series of questions concerning the film. Half the subjects are asked, “How fast
  was the car moving when it passed the barn?” The other half is not asked the
  question. Later each subject is asked, “Is there a barn in the film?” Of those
  asked the first question concerning the barn, 17% answer “yes”; only 3% of
  the others answer “yes.” What is the probability that a randomly selected
  participant in this study claims to have seen the nonexistent barn? Is claiming to
  see the barn independent of being asked the first question about the barn?

  $
    P(Y) = P(Y A) + P(Y A^c) = .5(.17) + .5(.03) = .1
  $
  Since $P(Y A) = .085 != .1 = P(Y)$, the two events are not independent.
]

#problem(31)[
  A foundry is producing cast iron parts to be used in the automatic 
  transmissions of trucks. There are two crucial dimensions to the part, A and B. 
  Assume that if the part meets specifications on dimension A then there is a 98%
  chance that it will also meet specifications on dimension B. There is a 95%
  chance that it will meet specifications on dimension A and a 97% chance that
  it will meet specifications on dimension B. A part is randomly selected and
  inspected. What is the probability that it will meet specifications on both dimensions?

  $
    P(A B) = P(B | A)P(A) = .98(.95) = .93
  $
]

#problem(2.8)[
  Everything printed in the Daily Screamer is in (1) boldface or (2) italics or (3) both boldface
  and italics. In today’s edition, I notice that if something is in boldface, then the chances of
  it also being in italics is 30%. Moreover, if something is in italics, then the chances of it also
  being in boldface is 20%. What is the probability that something in the Daily Screamer is in
  boldface?

  $
    P(B|I) = .2, quad P(I|B) = .3\
    P(B) + P(I) - P(B I) = 1\
    10/3 P(B I) + 10/2 P(B I) - P(B I) = 1\
    P(B I) = 3/22\
    P(B) = P(B I)/P(I|B) = 5/11
  $
]

#problem("2.10")[
  In any given day in the winter, the probability of snow is 0.2. In addition, on any given day
  in the winter, the probability of an automobile accident is 0.1 (note: these two events are not
  necessarily independent). If the data collected shows that the probability of having an accident
  given that it snowed is 0.4,
  #part(1,
    [
      What is the probability of an accident, given that it is not snowing?
    ],
    [
      $
        P(A|S^c) = P(A S^c)/P(S^c) = .02/.8 = .025
      $
    ]
  )
  #part(2,
    [
      What is the probability that it is not snowing, given that an accident occurred?
    ],
    [
      $
        P(S^c | A) = P(S^c A)/P(A) = .02/.1 = .2
      $
    ]
  )
]

#problem(2.37)[
  A communications circuit is known to have an availability of 0.99 (that is, 99% of the time,
  the circuit is operational). The FAA leases three such circuits between San Francisco, CA
  and Hillsboro, MO and two more such circuits betweeen Hillsboro, MO and Washington, DC.
  Communications between San Francisco and Washington are said to be up if at least one
  SF↔MO and one MO↔DC circuit are available. If all circuits fail independently of the others,
  what is the probability that SF↔DC communications are up?

  $
    1 - (1 - .99^3)(1-.99^2) = 1 - .0297(.0199) = 1 - .0006 = .9994
  $
]

#problem("Extra 1")[
  Let A(n) be the event "light bulb still functions after n hours of use".
  Suppose P[A(1000)]=0.6 and P[A(1200)]=0.5. One such light bulb has been
  burning for 1000 hrs. What is the probability the light bulb will still
  be burning after 1200 hrs?

  $
    P(A(1200) | P(A(1000)) = P(A(1000) A(1200)/P(A(1000))) = P(A(1200))/P(A(1000)) = .5/.6 = .83
  $
]

#problem("Extra 2")[
  Suppose that events A and B are independent. Show that events A^c
  and B^c must also be independent.

  $
    P(A B) = P(A)P(B)
    P(A^c B^c) = P(A union B)^c = 1 - P(A union B)\
    = 1 - (P(A) + P(B) - P(A B)) = 1 - (P(A) + P(B) - P(A)P(B))\
    = (1-P(A))(1-P(B)) = P(A^c) P(B^c)
  $
  Since $P(A^c B^c) = P(A^c)P(B^c)$, the complements of A and B are independent.
]

#problem("Extra 3")[
  To establish that three events are independent (1) the equation
  P[ABC]=P[A]P[B]P[C] must be established; and (2) it must be the case
  that the events A, B, and C are independent in pairs (i.e. A and B
  are independent, A and C are independent, and B and C are independent).
  If A, B, and C are three independent with P[A]=0.2, P[B]=0.2, and
  P[C]=0.2, determine the probabilities of the eight atomic regions
  of a 3 circle Venn diagram for the events A, B, and C.

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



]
