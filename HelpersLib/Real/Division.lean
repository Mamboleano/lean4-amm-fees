import Mathlib.Data.Real.Basic

theorem div_add_div_comm_fact_denum {a b c d : ℝ} (hd : d ≠ 0) :
  a / b + c / (b * d) = (a * d + c) / (b * d)  := by
  rw [add_div, mul_comm]
  simp
  rw [mul_comm d b, mul_div_mul_right a b hd]
