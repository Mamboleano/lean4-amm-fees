import Mathlib.Data.Real.Basic


theorem div_neg_iff_neg (a b : ℝ) (h : 0 < b) : a / b < 0 ↔ a < 0 := by
  aesop
  . rw [div_lt_iff h, zero_mul] at a_1
    exact a_1
  . rw [div_lt_iff h, zero_mul]
    exact a_1

theorem mul_lt_mul_iff_div_lt_div {a b c d : ℝ} (ha : a > 0) (hc : c > 0) :
  a * b < c * d ↔ b / c < d / a := by
    conv =>
      lhs
      rw [mul_comm]
      rw [←lt_div_iff ha, ←mul_div]
      rw [←div_lt_iff' hc]
