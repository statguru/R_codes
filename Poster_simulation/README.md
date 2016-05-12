INTRODUCTION

Consider a random experiment and an event A. Suppose that it is possible to repeat the experiment a large number of times under essentially similar conditions. Denote f(A) as the number of occurrences  of A in n repetitions. 
Then f(A)/n is called the relative frequency of A. A kind of regularity is observed when a large number of repetitions is considered together and it is an observed fact that the relative frequencies stabilize to a certain value as n becomes large. This kind of regularity in a random experiment is known as STATISTICAL REGULARITY.  The limiting value of f(A)/n as   
n  ∞, is called the probability of the event A, provided the limit exists. Now, it is not possible to repeat the experiment manually under essentially similar conditions. For that reason, we perform the experiment using SIMULATION technique with the help of statistical programming language ‘ R ’

WHAT IS SIMULATION?

Simulation is a way to model random events, such that simulated outcomes closely match real-world outcomes. 
By observing simulated outcomes, researchers gain insight on the real world.
WHY DO WE USE SIMULATION?
Some situations do not lend themselves to precise mathematical treatment. Others may be difficult, time-consuming, or expensive to analyze. In these situations, simulation may approximate real-world results; yet, require less time, effort, and/or money than other approaches.

EXAMPLE  1
A population consists of 200 people, among them there are 125 males and 75 females. A sample of size 30 is drawn without replacement. Find the probability that the sample will contain at least 10 females.
BY CLASSICAL DEFINITION OF PROBABILTY: 
Given, that the size of the population = 200
No. of males = 125
No. of females = 75
Assuming that the events of this random experiment are mutually exclusive, exhaustive and equally likely.
According to the problem, the sample is drawn without replacement. Hence, all possible outcomes of this experiment will be 200C30 .
Now let A be the event denoting that the sample will contain at least 10 females.
So, clearly favourable cases for the event A will be , ∑_(i=10)^30▒ 75Ci × 125C30-i . 
By classical definition of probability,
P(A)=  (∑_(i=10)^30▒ 75Ci × 125C30-i ) / 200C30 
 =  0.76 (approx.)

THEORETICAL VALUE	SIMULATED VALUE
0.76	0.758

EXAMPLE  2

An unbiased die is thrown 3 times. Let a, b and c denotes the outcome of the first, second and third throws
 respectively. Consider the equation ax2+bx+c=0. Find the probability that the roots of the equation will 
 be real.

 BY CLASSICAL DEFINITION OF PROBABILTY: 

 In the problem an unbiased die is thrown three times and the outcomes are observed.
Assuming that the events of this random experiment are mutually exclusive, exhaustive and equally likely.
Now, for real roots of the equation,
ax2+bx+c = 0
b2 – 4ac ≥ 0             		 (*)
Defining (*) as an event B, where a, b and c are the first, second and third outcome of the die respectively.
The all possible cases along with its favourable cases are given in the table below. (The favourable cases are shown in red ) 
Clearly, from the table there are 216 all possible cases and 43 outcomes are favourable to the event B.
Hence, by classical definition of probability,

P(B) = 43/216  = 0.2 (approx)



THEORETICAL VALUE	SIMULATED VALUE
0.20	0.201

EXAMPLE  3

Imagine that a chess player, whom we’ll call A, has been challenged to a curious sort of match by two of 
his competitors, whom we’ll call B and C. A is challenged to play three sequential games alternating 
between B and C, with the first game being with the player A’s choice. That is, A could play either BCB 
(we’ll call this sequence 1) or CBC (and this will be sequence 2). From experience with B and C, A knows
 that C is the stronger player (the tougher for A to defeat). Indeed, from experience, A attaches
 probabilities p and q to his likelihood of winning any particular game against B and C, respectively,
 where q < p. The rule of this peculiar match is that to win the challenge (i.e., to win the match) 
 A must win two games in a row. (This means in particular, that even if A wins the first and third
 games - two out of three games – A still loses the match) So, which sequence should A choose to give 
 himself the best chance of winning the match?

 BY CLASSICAL DEFINITION OF PROBABILTY: 

 For A to win the match, there are just two ways to do so. Either he wins the first two games (and the third game is then irrelevant) or he loses the first game and wins the final two games. Let P1 and P2 be the probability A wins the match playing sequence 1 and sequence 2 respectively. Then, making the usual assumption of independence from game to game, we have,
For sequence 1 : P1 = pq + (1-p)qp
For sequence 2 : P2 = qp + (1-q)pq
Therefore,
P2 – P1 = [qp + (1-q)pq] – [pq + (1-p)qp]
	     = (1-q)pq  – (1-p)qp
	     = pq (p - q) > 0 ,
because q < p . So, sequence 2 always, for any p > q , gives the greater probability for A winning the challenge match, even though sequence 2 requires A to play his stronger opponent twice.


The following table compares the estimates of P1 and P2 produced by simulation technique, for some selected values of p and q, to the numbers produced by the theoretical calculations we calculated earlier.
	THEORETICAL	SIMULATED
p	q	P1	P2	P1	P2
0.9	0.8	0.792	0.864	0.794	0.866
0.9	0.4	0.396	0.576	0.397	0.578
0.6	0.2	0.192	0.204	0.191	0.203
0.4	0.3	0.064	0.076	0.063	0.075
0.4	0.1	0.168	0.216	0.166	0.216

CONCLUSION

Thus we see that with the help of SIMULATION technique, we can perform the random experiment a large number 
of times under essentially similar conditions, which is much less time consuming and lastly we can compute 
the probability of a particular event with much ease. 


