import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.Calculus.Deriv.Add
import Mathlib.Analysis.Calculus.Deriv.Pow
import Mathlib.Tactic

noncomputable section

open Real Set

def f (x : ℝ) : ℝ := -x ^ 2 + 2 * x

lemma f_deriv (x : ℝ) : HasDerivAt f (-2 * x + 2) x := by
  have h1 : HasDerivAt (fun x => -x ^ 2) (-2 * x) x := by
    simpa using (hasDerivAt_pow 2 x).neg
  have h2 : HasDerivAt (fun x => 2 * x) 2 x := by
    simpa using (hasDerivAt_id x).const_mul 2
  exact h1.add h2

lemma critical_point : ∃ x : ℝ, x = 1 := by
  -- Solve -2x + 2 = 0
  exact ⟨1, by norm_num⟩

lemma f_second_deriv (x : ℝ) : HasDerivAt (fun x => -2 * x + 2) (-2) x := by
  have h1 : HasDerivAt (fun x => -2 * x) (-2) x := by
    simpa using (hasDerivAt_id x).const_mul (-2)
  have h2 : HasDerivAt (fun _ => 2) (0 : ℝ) x := hasDerivAt_const x 2
  have := h1.add h2
  simp only [add_zero] at this
  exact this
