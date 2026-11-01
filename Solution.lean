module

public import Erdos195Odd

public section

/-!
# Proved solution

Comparator checks that each declaration below has exactly the statement of its counterpart in
`Challenge.lean` and uses only the permitted axioms. The proofs live in `Erdos195Odd/Basic.lean`.
-/

theorem Erdos195Odd.main_result :
    ∃ f : ℕ ≃ ℤ, ∀ i j k l : ℕ, i < j → j < k → k < l → ∀ a d : ℤ, Odd d →
      ¬ (f i = a ∧ f j = a + d ∧ f k = a + 2 * d ∧ f l = a + 3 * d) :=
  Erdos195Odd.exists_enum_no_odd_ap

theorem Erdos195Odd.main_result_list :
    ∃ f : ℕ ≃ ℤ, ¬ ∃ l : List ℕ, ∃ a d : ℤ, Odd d ∧
      (l.map f = (List.range 4).map (fun n => a + n • d) ∨
        l.map f = (List.range 4).reverse.map (fun n => a + n • d)) ∧
      l.Pairwise (· < ·) :=
  Erdos195Odd.exists_enum_no_odd_ap_list
