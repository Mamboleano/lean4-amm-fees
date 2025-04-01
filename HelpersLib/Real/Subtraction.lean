import Mathlib.Data.Real.Basic

theorem add_sub_comm' (a b c : ℝ) : a + b - c = a - c + b := by
  ring_nf!

theorem sub_eq_neg_sub_inv {a b : ℝ} : a - b = - (b - a) :=
  by simp
