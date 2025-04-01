import Mathlib.Data.Real.Basic

theorem div_add_div_comm_fact_denum {a b c d : ℝ} (hd : d ≠ 0) :
  a / b + c / (b * d) = (a * d + c) / (b * d)  := by
  rw [add_div, mul_comm]
  simp
  rw [mul_comm d b, mul_div_mul_right a b hd]

theorem div_sub_div_comm_fact_denum {a b c d : ℝ} (hd : d ≠ 0) :
  a / b - c / (b * d) = (a * d - c) / (b * d) := by
    rw [sub_div, mul_comm]
    simp
    rw [mul_comm d b, mul_div_mul_right a b hd]

theorem min_div_mul_div_simp_comm_fact {a b c d e: ℝ} (hc : c ≠ 0) :
- (a / (b * c)) * ((d * c)/ (e)) = - ((a * d) / (b * e)) := by
  simp
  rw [div_mul_eq_mul_div, mul_div, div_div]
  ring_nf!
  rw [mul_assoc _ c, mul_inv_cancel, mul_one]
  exact hc
