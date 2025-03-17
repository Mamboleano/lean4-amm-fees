import HelpersLib.PReal.Basic

namespace PReal

theorem div_common_fact_cancel (a b c : ℝ>0) : a * b / (a * c) = b / c := by
  field_simp

theorem div_add_factor_num_den (a b c: ℝ>0) : a/b = (a*c)/(b*c) :=
  by simp

theorem div_add_div_same (a b c : ℝ>0) : a / c + b / c = (a + b) / c := by
  conv =>
    lhs
    rw [div_eq_mul_inv, div_eq_mul_inv]
    rw [← right_distrib]
    rw [←div_eq_mul_inv]

theorem mul_div_mul_cancel (a b c : ℝ>0) : a*b / (a * c) = b / c := by
  simp
