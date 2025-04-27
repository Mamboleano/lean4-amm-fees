import HelpersLib.PReal.Basic

theorem add_neg_add_eq_add_sub (a b c : ℝ) : a + (-b + c) = a - b + c := by ring_nf

theorem add_sub_sub_eq_sub_add (a b c : ℝ) : a - b - c = a - (b + c) := by ring_nf!
