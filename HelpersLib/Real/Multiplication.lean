import Mathlib.Data.Real.Basic

theorem Real.mul_mul_comm_last_second (a b c : ℝ) : a*b*c = a*c*b := by
  rw [mul_assoc, mul_comm b c, ←mul_assoc]
