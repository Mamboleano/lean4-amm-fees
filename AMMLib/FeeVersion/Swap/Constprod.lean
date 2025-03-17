import AMMLib.FeeVersion.Swap.Basic
import AMMLib.FeeVersion.Swap.Additivity
import HelpersLib.PReal.Division
import HelpersLib.PReal.Multiplication

variable (φ : ℝ>0)

noncomputable def SX.fee.constprod: SX :=
  λ (x r0 r1: ℝ>0) => (φ * r1)/(r0 + (φ * x))

theorem SX.fee.constprod.outputbound: SX.outputbound (SX.fee.constprod φ) := by
  unfold SX.outputbound
  intro x r0 r1
  unfold fee.constprod
  rw [← PReal.toReal_lt_toReal_iff]
  field_simp
  rw [_root_.div_lt_iff _ ]
  ring_nf!
  field_simp
  aesop

  . have h' : (↑φ.val: ℝ) > 0 := by exact (φ).prop
    have h'': (↑(φ.val): ℝ) * (↑x : ℝ) > 0 := by aesop
    have h''': (↑r0 : ℝ) > 0 := by aesop
    exact add_pos h''' h''

theorem SX.fee.constprod.homogeneous:
  homogeneous (fee.constprod φ) := by
  unfold homogeneous
  intro a x r0 r1
  unfold fee.constprod
  rw [← mul_assoc, mul_comm φ a, mul_assoc]
  rw [← mul_assoc φ a x, mul_comm φ a, mul_assoc]
  rw [← left_distrib, div_eq_mul_inv, inv_mul', div_eq_mul_inv]
  rw [← mul_assoc, mul_assoc a (φ * r1) a⁻¹, mul_comm (φ*r1) a⁻¹, ← mul_assoc]
  rw [mul_inv_self, one_mul]
  rw [← div_eq_mul_inv]


theorem SX.fee.constprod.strictmono:
  SX.strictmono (SX.fee.constprod φ) := by
  unfold SX.strictmono
  intro x r0 r1 x' r0' r1'
  intro ⟨a,b,c⟩
  have a' : φ * x' ≤ φ * x := by simp [mul_le_mul, a]
  have c' : φ * r1 ≤ φ * r1' := by simp [mul_le_mul, c]
  unfold SX.fee.constprod
  have h': r0'+(φ.val * x') ≤ r0+(φ.val * x) := add_le_add b a'
  if h: x' < x ∨ r0' < r0 ∨ r1 < r1'
  then
    simp only [h, ite_true]
    rw [div_lt_div_iff']
    rcases h with hh | hh | hh
    .
      have aa : (φ * x') < (φ * x) := by simp [Right.mul_lt_mul, a', hh]
      have h'': (φ * x' + r0') < (φ * x + r0) := by exact add_lt_add_of_lt_of_le aa b

      rw [add_comm, add_comm (φ * x)] at h''
      rw [mul_comm, mul_comm (φ * r1')]

      exact mul_lt_mul_of_lt_of_le h'' c'
    .
      have h'': (r0' + φ.val * x') < (r0 + φ.val * x) := by exact add_lt_add_of_lt_of_le hh a'

      rw [mul_comm, mul_comm (φ * r1')]
      exact mul_lt_mul_of_lt_of_le h'' c'
    .
      have c'' : φ * r1 < φ * r1' := by
        rw [mul_comm, mul_comm  φ r1']
        simp [mul_lt_mul, hh]

      exact mul_lt_mul_of_lt_of_le c'' h'

  else
    simp only [h, div_le_iff_le_mul, ite_false, ge_iff_le]
    refine mul_inv_le_iff_le_mul.mp ?_
    rw [← div_eq_mul_inv, div_le_div_iff']
    exact mul_le_mul' c' h'

theorem SX.fee.constprod.beta_simp :
  ∀ (x y r0 r1: ℝ>0) (h: x*((SX.fee.constprod φ) x r0 r1) < r1),
  SX.fee.constprod φ y (r0 + x) (PReal.sub r1 (x * SX.fee.constprod φ x r0 r1) (h))
    = φ*r1*r0 / ((r0 + φ*x) * (r0 + x + φ*y))
    := by

    intro x y r0 r1 h

    unfold SX.fee.constprod
    ring_nf!
    norm_cast
    rw [PReal.mul_sub']
    simp_rw [← mul_div_assoc]
    rw[PReal.sub_div]
    rw [div_div]
    simp_rw[left_distrib _ r0]
    simp_rw [← mul_assoc φ, ← mul_assoc (φ*x), ← mul_assoc (φ*r1)]
    field_simp
    conv in φ * x * φ * r1 =>
      rw [mul_assoc, mul_comm φ r1, mul_mul_mul_comm, mul_comm x φ, ← mul_assoc]
    simp

    . rw [left_distrib]
      rw [← mul_assoc, ←mul_assoc]
      rw [mul_comm φ x, mul_mul_mul_comm, mul_comm r1 φ, ←mul_assoc]
      conv =>
       lhs; rw [mul_comm x φ]
      simp

theorem SX.fee.constprod.extended_additivity (sw1: Swap (SX.fee.constprod φ) s a t0 t1 x) (sw2: Swap (SX.fee.constprod φ) (sw1.apply) a t0 t1 y): SX.fee.extended_additivity φ (SX.fee.constprod φ) sw1 sw2:= by

  unfold extended_additivity
  rw [SX.fee.z_eq_z_extended]
  unfold z_extended
  simp
  set r0 := AMMs.r0 s.amms t0 t1 sw1.exi with hr0
  set r1 := AMMs.r1 s.amms t0 t1 sw1.exi with hr1
  simp_rw[←hr1]
  repeat conv in (AMMs.r0 s.amms t0 t1 (_ : AMMs.init s.amms t0 t1)) =>
      rw [← hr0]
  conv =>
    rhs

    rw [beta_simp]
    unfold SX.fee.constprod
    repeat rw [← mul_div_assoc]
    rw [PReal.div_add_factor_num_den (x * (φ * r1)) _ (r0 + x + φ * y)]

    conv in _ + _ =>
      rw [PReal.div_add_div_same]
      rw [← mul_assoc x φ r1, mul_comm x φ]

    rw [mul_comm]
    rw [mul_div, mul_div]
    rw [div_div, div_div]
    rw [mul_assoc, mul_comm (φ * r1 * x * (r0 + φ * x + φ * y) + φ * r0 * r1 * y) _]

    rw [mul_comm (r0 + φ*x) _, mul_assoc (r0 + x + φ*y)]
    rw [PReal.mul_div_mul_cancel]
    rw [←mul_assoc (r0 + φ * x) _ _]
    rw [mul_comm (r0 + φ * x + φ * y) _]
    rw [mul_mul_comm_last_first (r0 + φ * x) _ _]
    rw [mul_assoc _ (r0 + φ * x + φ * y) _, mul_assoc (φ * r1 * x * (r0 + x + φ * y) + φ * r0 * r1 * y)]
    conv =>
      enter [2]
      rw [mul_assoc, mul_assoc, ← mul_assoc r1, mul_comm r1, mul_assoc x, ←mul_assoc φ, ← mul_assoc (φ*x)]
      rw [mul_mul_mul_comm_last_first φ r0 r1 y, mul_assoc (y*r0), mul_assoc y]
      rw [←mul_assoc r0, mul_mul_comm_last_first r0 r1 φ]

    rw [PReal.mul_div_mul_cancel]
    rw [mul_assoc (φ*r1)]
    rw [mul_mul_mul_comm_third_second, mul_assoc (φ*r1)]
    rw [← left_distrib (φ*r1)]

    rw [mul_comm r0 y, add_assoc r0, left_distrib x, left_distrib x, ←add_assoc]
    rw [← mul_assoc x φ y, mul_mul_comm_last_first x φ y]
    rw [add_assoc _ (y*φ*x) _, mul_assoc y, ←left_distrib y, mul_comm y]
    rw [add_comm (x*r0), ←left_distrib x, mul_comm x, ← left_distrib, mul_comm _ (x+y)]

    rw [←mul_assoc, mul_comm _ (x+y), mul_assoc]
    rw [mul_comm _ (x+y), mul_assoc (x+y)]
    rw [PReal.mul_div_mul_cancel]

    rw [add_comm _ r0, mul_comm (φ*r1)]
    rw [mul_comm _ ((r0 + φ*x))]
    rw [PReal.mul_div_mul_cancel]

  unfold SX.fee.constprod
  simp
  rw[left_distrib]

theorem SX.fee.constprod.z_factor_gt_1 (sw1: Swap (SX.fee.constprod φ) s a t0 t1 x) (sw2: Swap (SX.fee.constprod φ) (sw1.apply) a t0 t1 y) (hφ : φ < 1):
  z φ sw1 sw2 > 1 := by

  unfold z
  simp
  set r0 := AMMs.r0 s.amms t0 t1 sw1.exi

  conv =>
    lhs
    rw [add_comm r0 (φ*x), add_assoc, right_distrib]
    rw [left_distrib]
    conv in φ * x * (r0 * y) =>
      rw [mul_comm φ x, mul_comm, ←mul_assoc]
    rw [add_comm _ (r0*y*x*φ)]
    rw [left_distrib (r0 + φ*y)]
    rw [add_assoc, ← add_assoc (φ * x * (x ^ 2 + r0 * x + φ * x * y)) _ _, ← right_distrib, ←add_assoc (φ*x), add_comm (φ*x)]
    rw [←add_assoc, add_comm (r0*y*x*φ)]
    rw [add_assoc, add_comm (r0*y*x*φ), ←add_assoc]


  conv =>
    rhs
    rw [mul_assoc]
    rw [right_distrib, ←mul_assoc y, left_distrib y, right_distrib (y*r0) _ _]
    conv in y * r0 * (r0 + x + φ * y) =>
      rw [add_comm r0 x]
      rw [add_assoc, left_distrib, mul_comm y r0]
    rw [←add_assoc, ←add_assoc, add_comm _ (r0*y*x)]
    conv in x*(_*_) =>
      rw [←mul_assoc, mul_comm x, mul_assoc, left_distrib, left_distrib x, ←sq]
      rw [add_comm _ (x^2), mul_comm x r0, ←mul_assoc x φ y, mul_comm x φ]
    conv in y * (φ * x) * (r0 + x + φ * y) =>
      rw [←mul_assoc, mul_assoc, left_distrib, left_distrib x]
      rw [add_comm _ (x*x), ←sq, mul_comm x r0, ←mul_assoc x φ y, mul_comm x φ]
    rw [add_assoc, add_assoc, add_comm (r0 * y * (r0 + φ * y)) _ , ← add_assoc _ _ (r0 * y * (r0 + φ * y))]
    rw [←right_distrib, mul_comm y φ, ←add_assoc, add_rotate, mul_comm (r0*y)]

  rw [PReal.lt_add_iff_lt_cancel]
  rw [PReal.lt_self_iff_mul_fact_lt_one]
  exact hφ
