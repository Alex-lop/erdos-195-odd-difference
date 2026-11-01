# A permutation of ℤ with no monotone 4-term AP of odd common difference

*Partial progress on [Erdős Problem #195](https://www.erdosproblems.com/195). The problem itself remains open.*

## Background

A **permutation of ℤ** is a bijection $p:\mathbb N\to\mathbb Z$, read as the sequence $p(0),p(1),p(2),\dots$.
A **monotone $k$-term arithmetic progression** (k-AP) in it is a set of indices $i_1<\dots<i_k$ such that $p(i_1),\dots,p(i_k)$ is an increasing or decreasing arithmetic progression.

Erdős Problem #195 (Erdős–Graham) asks for the largest $k$ such that *every* permutation of $\mathbb Z$ contains a monotone $k$-AP. The answer is known to be $3$ or $4$:

- every permutation contains a monotone 3-AP (Davis–Entringer–Graham–Simmons, 1977);
- Adenwalla (2024) constructed a permutation of $\mathbb Z$ with no monotone 5-AP, improving Geneson's bound of 6.

For the positive integers, LeSaulnier and Vijay (2011) built a permutation of $\mathbb N$ with no monotone 4-AP of **odd** common difference. B. S. Ho (arXiv:2609.12780, 2026) then built one with no monotone 4-AP at all (Erdős #196). Ho's construction depends on all values being nonnegative and does not carry over to $\mathbb Z$. Thompson (arXiv:2609.13350, 2026) avoids 4-APs that *start* in any prescribed finite set and records that the full $\mathbb Z$ question is still open.

This note proves the $\mathbb Z$-analogue of LeSaulnier–Vijay.

**Theorem 1.** There is an explicit permutation of $\mathbb Z$ with no monotone 4-term arithmetic progression of odd common difference.

Theorem 1 does **not** decide #195. Monotone 4-APs of *even* difference do occur in the permutation below (for example $2,4,6,8$).

## The construction

Call $x\in\mathbb Z\setminus\{0\}$ **fast** if $x>0$ is even or $x<0$ is odd, and **slow** otherwise. Define the key

$$\kappa(0)=0,\qquad \kappa(x)=\begin{cases}|x|/4 & x \text{ fast},\\ |x| & x \text{ slow},\end{cases}$$

and order $\mathbb Z$ by $x\prec y \iff (\kappa(x),x)<(\kappa(y),y)$ lexicographically.

**Lemma 1 (enumeration).** Every $x$ has finitely many $\prec$-predecessors. Consequently, listing $\mathbb Z$ in $\prec$-order defines a bijection $p:\mathbb N\to\mathbb Z$ with $p(i)\prec p(j)$ whenever $i<j$.

*Proof.* We have $\kappa(y)\ge |y|/4$, so $y\prec x$ implies $|y|\le 4\kappa(x)$. A strict total order on an infinite set in which every element has finitely many predecessors has order type $\omega$. $\square$

The sequence begins $0,-1,2,-3,1,4,-5,6,-7,-2,8,-9,10,-11,3,12,\dots$

Write $s(x)\in\{\text{fast},\text{slow}\}$. Since $x$ is fast iff $[x\text{ even}]\oplus[x<0]$, two facts follow:

- **(F1)** if $x,y\neq 0$ have the same sign and opposite parity, then $s(x)\neq s(y)$;
- **(F2)** if $x,y\neq 0$ have opposite signs and opposite parity, then $s(x)=s(y)$.

## The key lemma

**Lemma 2.** Let $x_0,x_1,x_2,x_3$ be an arithmetic progression whose common difference $h$ is odd (of either sign). Then $\kappa(x_0)\le\kappa(x_1)\le\kappa(x_2)\le\kappa(x_3)$ is impossible.

*Proof.* Suppose the three inequalities hold. Write $\kappa_i=\kappa(x_i)$, $m_i=|x_i|$ and $g=|h|\ge 1$. Because $h$ is odd, the parities of the terms alternate.

*Case A: some $x_i=0$.* Every $y\ne0$ has $\kappa(y)>0$, so the zero must be $x_0$, and then $x_t=th$.
- If $h>0$: $x_1=h$ is positive and odd, hence slow, so $\kappa_1=g$. But $x_2=2h$ is positive and even, hence fast, so $\kappa_2=g/2<\kappa_1$.
- If $h<0$: $x_2=2h$ is negative and even, hence slow, so $\kappa_2=2g$. But $x_3=3h$ is negative and odd, hence fast, so $\kappa_3=3g/4<\kappa_2$.

From now on no term is $0$. The terms are monotone, so their sign changes at most once.

*Case B1: all four terms have the same sign.* Then the magnitudes form an AP with difference $\pm g$.
- If the magnitudes decrease, $x_0$ and $x_2$ have the same sign and parity, hence the same status, and $m_0>m_2$. So $\kappa_0>\kappa_2$.
- If the magnitudes increase, the statuses alternate by (F1).
  - If $x_0$ is slow, then $x_2$ is slow and $x_3$ is fast. The inequality $\kappa_2\le\kappa_3$ says $m_2\le m_3/4$, i.e. $3m_2\le g$, but $m_2>g$.
  - If $x_0$ is fast, then $x_1$ is slow and $x_2$ is fast. The inequality $\kappa_1\le\kappa_2$ gives $3m_1\le g$, but $m_1>g$.

*Case B2: the sign changes between $x_0$ and $x_1$.* Then $m_0+m_1=g$ and $m_{t+1}=m_t+g$ for $t\ge1$. By (F2), $s(x_0)=s(x_1)$. By (F1), $s(x_2)\ne s(x_1)$ and $s(x_3)\ne s(x_2)$.
- If $x_1$ is fast, then $x_2$ is slow and $x_3$ is fast. The inequality $\kappa_2\le\kappa_3$ gives $3m_2\le g$, but $m_2=m_1+g>g$.
- If $x_1$ is slow, then $x_0$ is slow and $x_2$ is fast. The inequality $\kappa_0\le\kappa_1$ gives $g-m_1\le m_1$, so $m_1\ge g/2$. The inequality $\kappa_1\le\kappa_2$ gives $4m_1\le m_1+g$, so $m_1\le g/3$. These are incompatible.

*Case B3: the sign changes between $x_1$ and $x_2$.* Then $m_0=m_1+g$, $m_1+m_2=g$ and $m_3=m_2+g$. By (F1), (F2), (F1) the statuses have the pattern $(X,Y,Y,X)$ with $X\ne Y$.
- If $x_0$ is slow and $x_1$ is fast: $\kappa_0\le\kappa_1$ gives $m_0\le m_1/4<m_1<m_0$.
- If $x_0$ is fast and $x_1$ is slow, then $x_2$ is slow and $x_3$ is fast. The inequality $\kappa_1\le\kappa_2$ gives $m_1\le m_2$. The inequality $\kappa_2\le\kappa_3$ gives $3m_2\le g=m_1+m_2$. So $2m_2\le m_1\le m_2$, forcing $m_2\le 0$.

*Case B4: the sign changes between $x_2$ and $x_3$.* Then $x_0$ and $x_2$ have the same sign and parity, hence the same status, and $m_0>m_2$. So $\kappa_0>\kappa_2$.

Every case gives a contradiction. $\square$

## Proof of Theorem 1

Suppose $i<j<k<l$ and $p(i),p(j),p(k),p(l)$ is an arithmetic progression with odd difference $h$; take $h<0$ for a decreasing one. By Lemma 1, $p(i)\prec p(j)\prec p(k)\prec p(l)$. Since $\prec$ compares $\kappa$ first, the keys are non-decreasing along this progression, which contradicts Lemma 2. $\square$

## Remarks

1. **The constant 4 is not special.** Fast elements may get key $|x|/\lambda$ for any $\lambda>3$ with the same proof. The construction fails for every $\lambda<3$. Take $g$ odd and large, an odd $x_1$ with $g/2<x_1<g/(\lambda-1)$, and $x_0=x_1-g$. Then $x_0,x_1,x_1+g,x_1+2g$ have statuses slow, slow, fast, slow and strictly increasing keys. *(Not formalized.)*
2. **Even differences.** $2,4,6,8$ are all fast, with increasing keys. So the permutation has monotone 4-APs of even difference, and the theorem is genuinely restricted to odd differences.
3. **Transplanting Ho's construction to ℤ.** Ho's ℕ construction extends finite "safe" words, whose completion by a fixed binary order is 4-AP-free. On ℤ his binary order has a least element, $-1=\dots111_2$. Once a negative integer $x$ is placed, a whole residue class $x+2^k\mathbb Z$ is blocked for ever: a safe word that begins with $-1$ cannot contain anything else. Using the negabinary digit order instead removes the least element. In computer experiments, however, it produces violations such as $(-9,2,13,24)$: an odd number placed early with a large magnitude, followed by an even number $b$, leaves $2b-a$ and $3b-2a$ in the tail in monotone order. Ho's inequality $2b-a\le 2b$, which rules this out on ℕ, fails on ℤ. *(Informal observations, not formalized.)*

## Formal verification

Theorem 1 is formalized in Lean 4 with Mathlib (`Erdos195Odd.main_result` and `Erdos195Odd.main_result_list`; see the repository README). The Lean proof uses the same order. Instead of the counting argument of Lemma 1, it encodes $(\kappa(x),x)$ injectively into $\mathbb N$ and enumerates the image with `Nat.Subtype.orderIsoOfNat`. Lemma 2 is checked by `omega` over all sign and parity cases.

## Credits

The construction and the proofs above were found, written and formalized by Claude (Anthropic's Claude Opus 5.5, in Claude Code), in work directed by Alex Lopez.
