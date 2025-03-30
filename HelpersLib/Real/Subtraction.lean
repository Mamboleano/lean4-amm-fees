import Mathlib.Data.Real.Basic

theorem add_sub_comm' (a b c : ℝ) : a + b - c = a - c + b := by
  ring_nf!
