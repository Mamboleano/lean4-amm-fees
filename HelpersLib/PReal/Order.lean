import HelpersLib.PReal.Basic
import HelpersLib.PReal.Subtraction
import HelpersLib.PReal.Division

namespace PReal

@[simp] theorem lt_add_right (x y: ℝ>0):
  x < x+y := by
  rw [← toReal_lt_toReal_iff]
  simp [y.toReal_pos]

@[simp] theorem lt_add_left (x y: ℝ>0):
  x < y+x := by
  rw [add_comm y x]
  exact lt_add_right x y

@[simp] theorem lt_add_iff_lt_cancel(x y z: ℝ>0):
  x + z < x + y ↔ z < y := by
  simp only [add_lt_add_iff_left]

theorem lt_self_iff_mul_fact_lt_one(x y: ℝ>0):
  x*y < x ↔ y < 1 := by
  simp only [mul_lt_iff_lt_one_left']

theorem gt_add_right (x y: ℝ>0):
  x+y > x := by
  simp only [gt_iff_lt]
  exact lt_add_right x y

theorem div_lt_add_denum (x y z: ℝ>0):
  x/(y+z) < x/y := by
  simp only [div_eq_mul_inv, mul_lt_mul_iff_left]
  apply inv_lt_inv'
  exact lt_add_right y z

theorem lt_iff_exists_add {x y: ℝ>0} (h: x < y):
  ∃ (z: ℝ>0), y = x+z := by
    exists (y.sub x h)
    rw [← toReal_eq_toReal_iff]
    simp

theorem lt_iff_exists_add' {x y: ℝ>0}:
  x < y ↔ ∃ (z: ℝ>0), y = x+z := by
    apply Iff.intro
    . intro lt
      exists y.sub x lt
      rw [add_y_sub_y]
    . intro ⟨z, hz⟩
      rw [hz]
      exact lt_add_right _ _

-- x - (y+z) = (x - y) - z
theorem sub_sub' (x y z: ℝ>0) (h: y+z < x):
  x.sub (y+z) h = (x.sub y (by calc y < y + z := by simp
                                    _ < x := h)).sub z (
    by rw [← toReal_lt_toReal_iff] at h ⊢
       simp at h
       simp [h]
       rw [lt_sub_iff_add_lt']
       exact h
  ) := by
  unfold sub
  rw [← toReal_eq_toReal_iff]
  simp [sub_sub]

theorem lt_imp_sub_lt (x y z: ℝ>0) (h: z < x) (h': x < y):
  x.sub z h < y := by
  calc x.sub z h < x.sub z h + z := lt_add_right _ _
       _         = x             := sub_y_add_y _ _ _
       _         < y             := h'

theorem x_sub_y_lt_x_sub_z_iff (x y z: ℝ>0) (h: z < x) (h': y < x):
  x.sub y h' < x.sub z h ↔ z < y := by
  simp_rw [← toReal_lt_toReal_iff]
  simp [-toReal_lt_toReal_iff]

@[simp] theorem add_sub (x y: ℝ>0):
  (x+y).sub y (by simp) = x := by
  rw [← toReal_eq_toReal_iff]
  simp

theorem sub_lt_iff (x y z: ℝ>0) (h: y<x):
  x.sub y h < z ↔ x < z+y := by
  simp_rw [← toReal_lt_toReal_iff]
  simp [sub_lt_iff_lt_add]

theorem add_lt_iff (x y z: ℝ>0) (h: x < z):
  x + y < z ↔ y < z.sub x h := by
  simp_rw [← toReal_lt_toReal_iff]
  simp [sub_lt_iff_lt_add]
  rw [add_comm]
  exact lt_sub_iff_add_lt.symm

theorem sub_sub'' (x y z: ℝ>0) (h1: z < y) (h2: y.sub z h1 < x): -- x - (y - z) = x - y + z = x + z - y
  x.sub (y.sub z h1) h2 = (x+z).sub y ((sub_lt_iff _ _ _ _).mp h2) := by
  rw [← toReal_eq_toReal_iff]
  simp [sub_sub_eq_add_sub]

@[simp]
theorem sub_of_add (x y: ℝ>0):
  (x+y).sub y (by simp) = x := by
  rw [← toReal_eq_toReal_iff]
  simp

theorem div_lt_div_same_num (a b c : ℝ>0) (hbc : b > c): a / b < a / c := by
    rw [div_lt_div_iff']
    simp
    exact hbc

theorem div_lt_div_same_denum (a b c : ℝ>0) (hab : a < b) : a / c < b / c := by
  rw [div_lt_div_iff']
  simp
  exact hab

theorem div_lt_div (a b c d : ℝ>0) (h_lt : a*d < b*c) : a / c < b / d := by
  rw [div_add_factor_num_den a c d, div_add_factor_num_den b d c ]
  rw [mul_comm d c]
  exact div_lt_div_same_denum (a*d) (b*c) (c*d) h_lt

theorem div_lt_div_denum_right (a b c : ℝ>0) : a / (b * c) < d / (e * c) ↔ a / b < d / e := by
  rw [div_eq_mul_inv, div_eq_mul_inv]
  conv =>
    lhs
    rw [mul_inv, mul_inv]
    rw [←mul_assoc, ←mul_assoc]
  rw [mul_lt_mul_right]
  rw [div_eq_mul_inv, div_eq_mul_inv]

theorem add_pos_of_Real (a b : ℝ>0) : (↑a : ℝ) + (↑b: ℝ) > 0 := by
  simp
  rw [←PReal.add_toReal]
  exact toReal_pos (a+b)

theorem mul_pos_of_Real (a b : ℝ>0) : (↑a : ℝ) * (↑b: ℝ) > 0 := by
  simp
  rw [←PReal.mul_toReal]
  exact toReal_pos (a*b)

theorem neg_sub_ne_zero_pos {a b : ℝ} (h : a < b): (a - b) ^ 2 > 0 := by
  have hh : a - b < 0 := by simp [h]
  exact sq_pos_of_neg hh
