import AMMLib.FeeVersion.Basic
import AMMLib.FeeVersion.Additivity
import HelpersLib.Real.Division
import HelpersLib.Real.Order
import HelpersLib.Real.Subtraction
import HelpersLib.PReal.Division
import HelpersLib.PReal.Multiplication

variable (φ : ℝ>0)

noncomputable def SX.fee.constprod: SX :=
  λ (x r0 r1: ℝ>0) => (φ * r1)/(r0 + (φ * x))

theorem SX.fee.constprod.outputbound: SX.outputbound (SX.fee.constprod φ) := by
  unfold SX.outputbound
  intro x r0 r1
  unfold fee.constprod
  field_simp
  rw [_root_.div_lt_iff₀ _ ]
  ring_nf!
  field_simp

  aesop
  have h' : (↑φ: ℝ) > 0 := by exact (φ).prop
  have h'': (↑(φ): ℝ) * (↑x : ℝ) > 0 := by aesop
  have h''': (↑r0 : ℝ) > 0 := by aesop
  exact add_pos h''' h''


theorem SX.fee.constprod.homogeneous:
  homogeneous (fee.constprod φ) := by
  unfold SX.homogeneous
  intro a x r0 r1
  unfold fee.constprod
  rw [← mul_assoc, mul_comm φ a, mul_assoc]
  rw [← mul_assoc φ a x, mul_comm φ a, mul_assoc]
  rw [← left_distrib, div_eq_mul_inv, inv_mul', div_eq_mul_inv]
  rw [← mul_assoc, mul_assoc a (φ * r1) a⁻¹, mul_comm (φ*r1) a⁻¹, ← mul_assoc]
  rw [mul_inv_cancel, one_mul]
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

theorem Swap.constprod.mkSwap (s: Γ) (a: A) (t0 t1: T) (x: ℝ>0) (h_init : s.amms.init t0 t1) (h_enoguh : ↑x ≤ (S₀.get s.atoms a) t0): Swap (SX.fee.constprod φ) s a t0 t1 x :=
  ⟨
    h_enoguh,
    h_init,
    by
      have := SX.fee.constprod.outputbound φ
      unfold SX.outputbound at this
      exact this x (s.amms.r0 t0 t1 h_init) (s.amms.r1 t0 t1 h_init)

  ⟩

theorem SX.fee.φ_r1_sub_α_x_simp :
  ∀ (x r0 r1 : ℝ>0) (h: x * (φ * r1 / (r0 + φ * x)) < r1),
    φ * PReal.sub r1 (x * (φ * r1 / (r0 + φ * x))) h = φ * r0 * r1 / (r0 + φ * x) := by
    intro x r0 r1 h
    rw [PReal.mul_sub']
    simp_rw [← mul_div_assoc]
    rw[PReal.sub_div]
    simp_rw[left_distrib _ r0]
    simp_rw [← mul_assoc φ, ← mul_assoc (φ*x), ← mul_assoc (φ*r1)]
    conv in φ * x * φ * r1 =>
      rw [mul_assoc, mul_comm φ r1, mul_mul_mul_comm, mul_comm x φ, ← mul_assoc]
    simp only [PReal.add_sub, div_left_inj, PReal.mul_toReal]
    rw [mul_assoc, mul_comm r1, ←mul_assoc]

    rw [left_distrib]
    rw [← mul_assoc, ←mul_assoc]
    rw [mul_comm φ x, mul_mul_mul_comm, mul_comm r1 φ, ←mul_assoc]
    conv =>
      lhs; rw [mul_comm x φ]
    simp
    aesop

theorem SX.fee.constprod.rate_toReal
  (sw0: Swap (constprod φ) s a t0 t1 x₀):
    (↑(Swap.rate sw0) : ℝ) =
      (↑φ * ↑(AMMs.r1 s.amms t0 t1 sw0.exi) /
          (↑(AMMs.r0 s.amms t0 t1 sw0.exi) + ↑φ * ↑x₀)) := by

    unfold Swap.rate
    unfold constprod
    set_and_subst_reserves s.amms t0 t1 sw0.exi
    rw [PReal.div_toReal]
    rw [PReal.mul_toReal]
    rw [PReal.add_toReal, PReal.mul_toReal]



theorem SX.fee.constprod.beta_simp:
  ∀ (x y r0 r1 : ℝ>0) (h: x*((SX.fee.constprod φ) x r0 r1) < r1),
  SX.fee.constprod φ y (r0 + x) (PReal.sub r1 (x * SX.fee.constprod φ x r0 r1) (h))
    = φ*r1*r0 / ((r0 + φ*x) * (r0 + x + φ*y))
    := by

    intro x y r0 r1 h

    unfold SX.fee.constprod
    rw [SX.fee.φ_r1_sub_α_x_simp _ _ _ _]
    rw [div_div]
    rw [mul_assoc, mul_comm r0, ←mul_assoc]

theorem SX.fee.constprod.beta_simp_rate
  (sw0: Swap (constprod φ) s a t0 t1 x₀)
  (sw1: Swap (constprod φ) (Swap.apply sw0) a t0 t1 x₁):
  x₁ * (Swap.rate sw1)
    = φ*(AMMs.r1 s.amms t0 t1 sw0.exi)*(AMMs.r0 s.amms t0 t1 sw0.exi)*x₁ / (((AMMs.r0 s.amms t0 t1 sw0.exi) + φ*x₀) * ((AMMs.r0 s.amms t0 t1 sw0.exi) + x₀ + φ*x₁)) := by

    conv =>
      lhs
      unfold Swap.rate
      rw [Swap.r0_after_swap φ sw0, Swap.r1_after_swap φ sw0]
      rw [beta_simp]
    set_and_subst_reserves s.amms t0 t1 sw0.exi
    rw [mul_div]
    rw [mul_assoc, mul_comm]


theorem SX.fee.constprod.extended_additivity: SX.fee.extended_additivity φ (SX.fee.constprod φ) := by

  unfold fee.extended_additivity
  intro x y r0 r1 ho
  rw [SX.fee.z_eq_z_extended]
  unfold z_extended
  conv =>
    rhs
    rw [beta_simp]
    unfold SX.fee.constprod
    rw [← mul_div_assoc, ← mul_div_assoc, ← mul_div_assoc]
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

  noncomputable def SX.fee.constprod.int_rate :=
    λ (r0 r1: ℝ>0) => (φ * r1)/(r0)

  noncomputable def SX.fee.constprod.sw_to_equil (sw0 : Swap (SX.fee.constprod φ) s a t0 t1 x₀) (o : O): Prop :=
    SX.fee.constprod.int_rate φ (sw0.apply.amms.r0 t0 t1 (SX.fee.swap_apply_amm_exi sw0)) (sw0.apply.amms.r1 t0 t1 (SX.fee.swap_apply_amm_exi sw0)) =
      o t0 / o t1


  def SX.fee.constprod.int_rate_strictmono: Prop :=
    ∀ (r0 r1 r0' r1': ℝ>0),
      r0' ≤ r0 ∧ r1 ≤ r1'
      →
      if r0' < r0 ∨ r1 < r1'
      then SX.fee.constprod.int_rate φ r0 r1 < SX.fee.constprod.int_rate φ r0' r1'
      else SX.fee.constprod.int_rate φ r0 r1 ≤ SX.fee.constprod.int_rate φ r0' r1'

  theorem SX.fee.constprod.int_rate_is_strictmono : SX.fee.constprod.int_rate_strictmono φ := by
    unfold int_rate_strictmono
    intro r0 r1 r0' r1'
    intro ⟨hr0,hr1⟩
    unfold int_rate
    if h: r0' < r0 ∨ r1 < r1'
    then
      simp only [h, ite_true]
      rw [div_lt_div_iff']
      rcases h with hh | hh
      .
        have h'' : φ * r1 ≤ φ * r1' := by aesop
        rw [mul_comm, mul_comm _ r0]
        exact mul_lt_mul_of_lt_of_le hh h''
      .
        have h'' : φ * r1 < φ * r1' := by aesop
        exact mul_lt_mul_of_lt_of_le h'' hr0

    else
      simp only [h, div_le_iff_le_mul, ite_false, ge_iff_le]
      refine mul_inv_le_iff_le_mul.mp ?_
      rw [← div_eq_mul_inv, div_le_div_iff']
      have h'' : φ * r1 ≤ φ * r1' := by aesop
      exact mul_le_mul' h'' hr0

  theorem SX.fee.constprod.int_rate_gt_sx_rate_pre_swap (sw: Swap (SX.fee.constprod φ) s a t0 t1 x) :
     sw.rate < SX.fee.constprod.int_rate φ (s.amms.r0 t0 t1 sw.exi) (s.amms.r1 t0 t1 sw.exi) := by

    unfold constprod int_rate
    unfold Swap.rate
    simp
    aesop

  theorem SX.fee.constprod.sx_rate_gt_int_rate_post_swap (sw: Swap (SX.fee.constprod φ) s a t0 t1 x) (hφ: φ ≤ 1) :
      sw.rate >
        SX.fee.constprod.int_rate φ (sw.apply.amms.r0 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw)) (sw.apply.amms.r1 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw)) := by

    unfold constprod int_rate
    rw [Swap.r0_after_swap φ, Swap.r1_after_swap φ]

    set_and_subst_reserves s.amms t0 t1 sw.exi

    have hh : φ * PReal.sub r1 (x * (SX.fee.constprod φ) x r0 r1) (by exact sw.nodrain) * (r0 + φ * x) < φ * r1 * (r0 + x) := by
      --rw [← PReal.toReal_lt_toReal_iff]
      simp
      rw [mul_sub (↑φ : ℝ), sub_mul]
      rw [← sub_lt_zero, sub_sub, add_comm _ (↑φ * ↑r1 * (↑r0 + ↑x) : ℝ), ←sub_sub]
      rw [←mul_sub]
      conv in (↑r0 + ↑φ * ↑x - (↑r0 + ↑x) : ℝ) =>
        rw [←sub_sub, add_comm, add_sub_cancel_right]
        conv =>
          enter [2]
          rw [←one_mul (↑x : ℝ)]
        rw [←sub_mul, mul_comm]

      have h1 : (↑φ * ↑r1 * (↑x * (↑φ - 1)) : ℝ) ≤ 0 := by
        rw [←mul_assoc, mul_comm]
        have h1' : (↑φ * ↑r1 * ↑x : ℝ)  ≥ 0 := by
          simp [PReal.toReal_pos, le_of_lt]
        have h1'': ((↑φ - 1) : ℝ) ≤ 0 := by
          aesop
        exact mul_nonpos_of_nonpos_of_nonneg h1'' h1'

      have h2 : (↑φ * (↑x * ↑((SX.fee.constprod φ) x r0 r1)) * (↑r0 + ↑φ * ↑x) : ℝ) > 0 := by
        rw [←PReal.mul_toReal, ←PReal.mul_toReal, ←PReal.mul_toReal, ←PReal.add_toReal]
        exact PReal.mul_pos_of_Real (φ * (x * (SX.fee.constprod φ) x r0 r1)) (r0 + φ * x)

      exact sub_lt_zero.mpr (lt_of_le_of_lt h1 h2)

    exact PReal.div_lt_div _ _ _ _ hh

theorem SX.fee.constprod.sx_rate_vs_int_rate (sw: Swap (SX.fee.constprod φ) s a t0 t1 x) (hφ: φ ≤ 1) :
    SX.fee.constprod φ x (s.amms.r0 t0 t1 sw.exi) (s.amms.r1 t0 t1 sw.exi) >
      SX.fee.constprod.int_rate φ (sw.apply.amms.r0 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw)) (sw.apply.amms.r1 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw))
      ∧
    SX.fee.constprod φ x (s.amms.r0 t0 t1 sw.exi) (s.amms.r1 t0 t1 sw.exi) <
      SX.fee.constprod.int_rate φ (s.amms.r0 t0 t1 sw.exi) (s.amms.r1 t0 t1 sw.exi) := by

      exact
        ⟨
          by exact sx_rate_gt_int_rate_post_swap φ sw hφ
        ,
          by exact int_rate_gt_sx_rate_pre_swap φ sw
        ⟩

theorem SX.fee.constprod.r1_lt_split_after_swap
  (sw0 : Swap (SX.fee.constprod φ) s a t0 t1 x₀)
  (sw1 : Swap (SX.fee.constprod φ) s a t0 t1 x₁)
  (sw2 : Swap (SX.fee.constprod φ) (sw1.apply) a t0 t1 x₂)
  (hφ : φ < 1)
  (h_split : x₀ = x₁ + x₂) :
    AMMs.r1 (Swap.apply sw0).amms t0 t1 (by exact SX.fee.swap_apply_amm_exi sw0) <
      AMMs.r1 (Swap.apply sw2).amms t0 t1 (by exact SX.fee.swap_apply_amm_exi sw2)
       := by

      /- Setup for variables -/
      rw [Swap.r1_after_swap φ sw0, Swap.r1_after_swap φ sw2]
      repeat conv in AMMs.r1 (Swap.apply sw1).amms t0 t1 (_ : AMMs.init (Swap.apply sw1).amms t0 t1) =>
          rw [Swap.r1_after_swap φ sw1]

      repeat conv in (AMMs.r0 (Swap.apply sw1).amms t0 t1 (_ : AMMs.init (Swap.apply sw1).amms t0 t1)) =>
        rw [Swap.r0_after_swap φ]

      set_and_subst_reserves s.amms t0 t1 sw0.exi

      have h_lt' : x₁ * (SX.fee.constprod φ) x₁ r0 r1 + x₂ * (SX.fee.constprod φ) x₂ (r0 + x₁) (PReal.sub r1 (x₁ * (SX.fee.constprod φ) x₁ r0 r1) (by exact sw1.nodrain)) < r1 := by
        rw [PReal.add_lt_iff _ _ _ (sw1.nodrain)]
        -- simp [←Swap.r0_after_swap, ←Swap.r1_after_swap]
        rw [←Swap.r0_after_swap φ sw1]
        rw [←Swap.r1_after_swap φ sw1]
        exact sw2.nodrain

      rw [← PReal.sub_sub' _ _ _ h_lt']
      rw [PReal.x_sub_y_lt_x_sub_z_iff]

      have hβ := SX.fee.constprod.beta_simp φ x₁ x₂ r0 r1 sw1.nodrain
      rw [hβ]

      --rw [←PReal.toReal_lt_toReal_iff]
      unfold constprod
      simp
      rw [mul_div, mul_div, mul_div]
      have hx₁φx₂ : ((↑r0 + ↑x₁ + ↑φ * ↑x₂) : ℝ) > 0 := by
        rw [← PReal.mul_toReal, ←PReal.add_toReal]
        exact PReal.add_pos_of_Real (r0 + x₁) (φ * x₂)
      have hφx₁ : ((↑r0 + ↑φ * ↑x₁) : ℝ) > 0 := by
        rw [← PReal.mul_toReal, ←PReal.add_toReal]
        exact PReal.toReal_pos (r0 + φ * x₁)
      have hφx₀ : ((↑r0 + ↑φ * ↑x₀) : ℝ) > 0 := by
        rw [← PReal.mul_toReal, ←PReal.add_toReal]
        exact PReal.toReal_pos (r0 + φ * x₀)

      rw [div_add_div_comm_fact_denum (ne_of_gt hx₁φx₂)]
      rw [← sub_lt_zero]

      rw [div_sub_div _ _ (mul_ne_zero (ne_of_gt hφx₁) (ne_of_gt hx₁φx₂)) (ne_of_gt hφx₀)]
      rw [div_neg_iff_neg _ _ (mul_pos (mul_pos hφx₁ hx₁φx₂) (hφx₀))]
      rw [h_split]
      rw [PReal.add_toReal, left_distrib (↑φ : ℝ) _ _, ← add_assoc, right_distrib _ _ ((↑φ * ↑r1) : ℝ)]
      rw [right_distrib]
      ring_nf!
      subst_reserves s.amms t0 t1
      rw [sq, ←mul_assoc, mul_comm _ (↑φ : ℝ)]
      conv in _ + _ =>
        enter [2]
        rw [mul_assoc, mul_assoc, mul_assoc, mul_assoc]
        rw [← mul_assoc (↑x₁: ℝ) (↑φ : ℝ), ←mul_assoc (↑x₁ * ↑φ : ℝ), ←mul_assoc _ (↑r0 : ℝ)]
      rw [← sub_eq_neg_add, ←mul_one (↑φ * ↑x₁ * ↑r1 * ↑r0 * ↑x₂ : ℝ), mul_comm _ 1]
      rw [mul_comm _ (↑φ : ℝ) , ←sub_mul, mul_comm]
      have hx₁r1r0x₂ : (↑φ * ↑x₁ * ↑r1 * ↑r0 * ↑x₂ : ℝ) > 0 := by
        simp [PReal.toReal_pos]
      have hφ' : ((↑φ - 1) : ℝ) < 0 := by
        aesop
      exact mul_neg_of_pos_of_neg hx₁r1r0x₂ hφ'

theorem SX.fee.constprod.int_rate_lt_split
  (sw0 : Swap (SX.fee.constprod φ) s a t0 t1 x₀)
  (sw1 : Swap (SX.fee.constprod φ) s a t0 t1 x₁)
  (sw2 : Swap (SX.fee.constprod φ) (sw1.apply) a t0 t1 x₂)
  (hφ : φ < 1)
  (h_split : x₀ = x₁ + x₂) :
    int_rate φ (sw2.apply.amms.r0 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw2)) (sw2.apply.amms.r1 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw2)) >
          int_rate φ (sw0.apply.amms.r0 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw0)) (sw0.apply.amms.r1 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw0)) := by

  have h_r1 :  (AMMs.r1 (Swap.apply sw0).amms t0 t1 (_ : AMMs.init (Swap.apply sw0).amms t0 t1)) <
                (AMMs.r1 (Swap.apply sw2).amms t0 t1 (_ : AMMs.init (Swap.apply sw2).amms t0 t1)) :=
                  SX.fee.constprod.r1_lt_split_after_swap φ sw0 sw1 sw2 hφ h_split
  have h_r1' : (AMMs.r1 (Swap.apply sw0).amms t0 t1 (SX.fee.swap_apply_amm_exi sw0)) ≤
                (AMMs.r1 (Swap.apply sw2).amms t0 t1 (SX.fee.swap_apply_amm_exi sw2)) :=
                  by simp only [le_iff_lt_or_eq, h_r1, true_or]

  have h_r0 : (AMMs.r0 (Swap.apply sw2).amms t0 t1 (SX.fee.swap_apply_amm_exi sw2)) =
                (AMMs.r0 (Swap.apply sw0).amms t0 t1 (SX.fee.swap_apply_amm_exi sw0)) := by
                rw [Swap.r0_after_swap φ sw2, Swap.r0_after_swap  φ sw1, Swap.r0_after_swap  φ sw0]
                rw [add_assoc]
                conv in x₁ + x₂ =>
                  rw [←h_split]
  have h_r0' : (AMMs.r0 (Swap.apply sw2).amms t0 t1 (SX.fee.swap_apply_amm_exi sw2)) ≤
                (AMMs.r0 (Swap.apply sw0).amms t0 t1 (SX.fee.swap_apply_amm_exi sw0)) := by
                  simp only [le_iff_lt_or_eq, h_r0, or_true]

  have hmono := SX.fee.constprod.int_rate_is_strictmono
  unfold int_rate_strictmono at hmono
  have hh := hmono φ
              (AMMs.r0 (Swap.apply sw0).amms t0 t1 (SX.fee.swap_apply_amm_exi sw0))
              (AMMs.r1 (Swap.apply sw0).amms t0 t1 (SX.fee.swap_apply_amm_exi sw0))
              (AMMs.r0 (Swap.apply sw2).amms t0 t1 (SX.fee.swap_apply_amm_exi sw2))
              (AMMs.r1 (Swap.apply sw2).amms t0 t1 (SX.fee.swap_apply_amm_exi sw2))
              ⟨h_r0', h_r1'⟩

  simp only  [h_r1, or_true, if_true] at hh
  exact hh



theorem SX.fee.constprod.additive_int_rate_vs_ext_rate
  (sw0 : Swap (SX.fee.constprod φ) s a t0 t1 x₀)
  (sw1 : Swap (SX.fee.constprod φ) s a t0 t1 x₁)
  (sw2 : Swap (SX.fee.constprod φ) (sw1.apply) a t0 t1 x₂)
  (o : O)
  (hφ : φ < 1)
  (h_equil : int_rate φ (sw0.apply.amms.r0 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw0)) (sw0.apply.amms.r1 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw0))
     = (o t0) / (o t1))
  (h_split : x₀ = x₁ + x₂) :
    (o t0) / (o t1) < int_rate φ (sw2.apply.amms.r0 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw2)) (sw2.apply.amms.r1 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw2)) := by


  have h_lt : int_rate φ (sw2.apply.amms.r0 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw2)) (sw2.apply.amms.r1 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw2)) >
        int_rate φ (sw0.apply.amms.r0 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw0)) (sw0.apply.amms.r1 t0 t1 (by exact SX.fee.swap_apply_amm_exi sw0))
           := SX.fee.constprod.int_rate_lt_split φ sw0 sw1 sw2 hφ h_split

  rw [h_equil] at h_lt
  rw [← gt_iff_lt]
  exact h_lt
