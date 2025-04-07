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

theorem mul_div_cancel_den {a b c : ℝ} (ha : a ≠ 0): a * (b / (a * c)) = b / c := by
  ring_nf!
  rw [mul_assoc a, mul_comm b, ←mul_assoc]
  simp [ha]

theorem div_gt_self {a b : ℝ} (ha : a > 0) (hb : b > 0) (hb' : b < 1): a / b > a := by
  ring_nf!
  aesop
  rw [one_lt_inv_iff]
  exact ⟨hb, hb'⟩
