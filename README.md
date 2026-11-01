# Erdős #195, odd differences: a permutation of ℤ with no monotone 4-term AP of odd difference

> **Status: partial result.** This repository does **not** solve [Erdős Problem #195](https://www.erdosproblems.com/195), which is still open. It proves, and formally verifies in Lean 4, the special case of odd common differences.

## The result

**Theorem.** There is an explicit bijection $p:\mathbb N\to\mathbb Z$ with no indices $i<j<k<l$ such that $p(i),p(j),p(k),p(l)$ is an arithmetic progression with **odd** common difference, increasing or decreasing.

Here is the construction. Call $x\neq 0$ *fast* if $x>0$ is even or $x<0$ is odd. Give $x$ the key $|x|/4$ if it is fast and $|x|$ otherwise. List $\mathbb Z$ by increasing key, breaking ties by value:

```
0, -1, 2, -3, 1, 4, -5, 6, -7, -2, 8, -9, 10, -11, 3, 12, ...
```

The heart of the proof is a short case analysis. Keys can never be non-decreasing along a 4-term progression with odd difference. The full argument is in [`docs/proof.md`](docs/proof.md).

**Context.** Erdős #195 asks for the largest $k$ such that every permutation of $\mathbb Z$ contains a monotone $k$-term AP; the answer is 3 or 4 (Davis–Entringer–Graham–Simmons; Geneson; Adenwalla). The theorem here is the $\mathbb Z$-analogue of LeSaulnier–Vijay's 2011 result for $\mathbb N$. The full $\mathbb N$ question (Erdős #196) was settled by B. S. Ho (arXiv:2609.12780). The full $\mathbb Z$ question remains open; Thompson (arXiv:2609.13350) handles progressions starting in a fixed finite set. The theorem here does **not** settle #195: monotone 4-APs with even difference, such as `2, 4, 6, 8`, do occur in this permutation.

## Lean formalization

| File | Contents |
| --- | --- |
| [`Challenge.lean`](Challenge.lean) | The statements to audit (Mathlib-only, proofs `sorry`). |
| [`Solution.lean`](Solution.lean) | The same statements, proved. |
| [`Erdos195Odd/Basic.lean`](Erdos195Odd/Basic.lean) | The construction (`enum : ℕ ≃ ℤ`) and the proofs. |

```lean
theorem Erdos195Odd.main_result :
    ∃ f : ℕ ≃ ℤ, ∀ i j k l : ℕ, i < j → j < k → k < l → ∀ a d : ℤ, Odd d →
      ¬ (f i = a ∧ f j = a + d ∧ f k = a + 2 * d ∧ f l = a + 3 * d)
```

`Erdos195Odd.main_result_list` states the same fact in the shape of `HasMonotoneAP f 4` from
[google-deepmind/formal-conjectures](https://github.com/google-deepmind/formal-conjectures/blob/a64e959c32c270df4dd0d96d2027481f15750534/FormalConjectures/ErdosProblems/195.lean), restricted to odd differences.

- Lean `v4.33.1`, Mathlib `v4.33.1`.
- No `sorry` outside `Challenge.lean` and no `native_decide`. Both theorems depend only on `propext`, `Classical.choice` and `Quot.sound` (checked with `#print axioms`).
- The statements in `Challenge.lean` and `Solution.lean` elaborate to identical terms (checked with `pp.all`). The repository follows the [Palomar](https://palomar-registry.org) layout, with `comparator.json` and `formalization.yaml`. It has **not** been submitted to the registry yet; submissions go through https://submit.palomar-registry.org/.

To build:

```sh
lake exe cache get   # download Mathlib build files
lake build
```

## Use of AI

This work was done by **Alex Lopez using Claude** (Anthropic's Claude Opus 5.5, running in Claude Code). Claude:

- screened open Erdős problems;
- ran the search that found the construction;
- wrote the proof and this repository;
- wrote the Lean formalization.

The Lean kernel checks the main theorem. The prose in `docs/proof.md` and the informal remarks in it have only been checked by Claude and numerically, not by an independent human referee.

## License

Apache-2.0; see [LICENSE](LICENSE).
