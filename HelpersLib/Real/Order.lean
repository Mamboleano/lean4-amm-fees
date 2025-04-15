import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt

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

lemma mul_lt_iff_lt_div (a b c : ℝ) (hb : 0 < b) : a * b < c ↔ a < c / b := by
  conv =>
    lhs
    rw [←lt_div_iff hb]

lemma sqrt_mul_lt_sqrt {a b c : ℝ} (ha : 0 < a) (hb : 0 < b) : (Real.sqrt a) * b < (Real.sqrt c) ↔ a * b^2 < c := by

  conv =>
    lhs
    rw [←Real.sqrt_sq (le_of_lt hb)]
  rw [←Real.sqrt_mul (le_of_lt ha)]
  have hpos: 0 < a * b ^ 2 := by
    apply mul_pos
    . exact ha
    . rw [sq_pos_iff]
      exact ne_of_gt hb
  rw [Real.sqrt_lt_sqrt_iff (le_of_lt hpos)]

lemma sqrt_lt_sqrt_mul {a b c : ℝ} (ha : 0 < a) (hb : 0 < b) (hc : 0 < c): (Real.sqrt a) < (Real.sqrt c) * b ↔ a < c * b^2 := by

  conv =>
    lhs
    rw [←Real.sqrt_sq (le_of_lt hb)]
  rw [←Real.sqrt_mul (le_of_lt hc)]
  rw [Real.sqrt_lt_sqrt_iff (le_of_lt ha)]
