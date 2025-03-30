import AMMLib.FeeVersion.Swap.Basic
import AMMLib.FeeVersion.Swap.Additivity
import AMMLib.FeeVersion.Swap.Constprod
import HelpersLib.Real.Division
import HelpersLib.Real.Order
import HelpersLib.Real.Subtraction
import HelpersLib.PReal.Division
import HelpersLib.PReal.Negative

variable (φ : ℝ>0)

def SX.fee.arbitrage.is_solution_less (sw: Swap sx s a t0 t1 x₀) (o: O): Prop :=
  ∀ (x: ℝ>0) (sw2: Swap sx s a t0 t1 x),
  x < x₀ → (s.mints.get a).get t0 t1 = 0 → a.gain o s sw2.apply <  a.gain o s sw.apply

def SX.fee.arbitrage.is_solution_more (sw: Swap sx s a t0 t1 x₀) (o: O): Prop :=
  ∀ (x: ℝ>0) (sw2: Swap sx s a t0 t1 x),
  x > x₀ → (s.mints.get a).get t0 t1 = 0 → (a.gain o s sw2.apply <  a.gain o s sw.apply ↔ x > x₀/φ)


theorem SX.fee.arbitrage.constprod.solution_less
  (sw0: Swap (SX.fee.constprod φ) s a t0 t1 x₀)
  (o: O)
  (hφ : φ < 1)
  (h_equil: SX.fee.constprod.int_rate φ (sw0.apply.amms.r0 t0 t1 (SX.fee.swap_apply_amm_exi sw0)) (sw0.apply.amms.r1 t0 t1 (SX.fee.swap_apply_amm_exi sw0)) = o t0 / o t1) :
  SX.fee.arbitrage.is_solution_less sw0 o := by

    have additive: SX.fee.extended_additivity φ (SX.fee.constprod φ) := SX.fee.constprod.extended_additivity φ
    have out_bounded : SX.outputbound (SX.fee.constprod φ) := SX.fee.constprod.outputbound φ


    unfold is_solution_less
    intro x sw1 h_less zero_mints

    have ⟨x₁, prop₁⟩ := PReal.lt_iff_exists_add h_less
    have sw0_split := sw0
    rw [prop₁] at sw0_split
    have sw2 : Swap (SX.fee.constprod φ) (sw1.apply) a t0 t1 x₁ := sw0_split.bound_split2 out_bounded

    have gain_x₁_pos : a.gain o sw1.apply sw2.apply > 0 := by
      have h_rate : (o t0) / (o t1) < sw2.rate := by
        calc (o t0) / (o t1)
            < SX.fee.constprod.int_rate φ (sw2.apply.amms.r0 t0 t1 (SX.fee.swap_apply_amm_exi sw2))  (sw2.apply.amms.r1 t0 t1 (SX.fee.swap_apply_amm_exi sw2)):= SX.fee.constprod.additive_int_rate_vs_ext_rate φ sw0 sw1 sw2 o hφ h_equil prop₁
          _ < sw2.rate := SX.fee.constprod.sx_rate_gt_int_rate_post_swap φ sw2 (le_of_lt hφ)
      exact (SX.fee.swaprate_vs_exchrate_gt sw2 o zero_mints).mpr h_rate

    have gain_ε_pos : (a.gain o sw1.apply sw2.apply) + Swap.fee.εφ φ sw1 sw2 hφ o > 0 := by
      exact add_pos gain_x₁_pos (PReal.toReal_pos (Swap.fee.εφ φ sw1 sw2 hφ o))

    rw [Swap.apply_same_val sw0 sw0_split prop₁]
    rw [Swap.fee.additive_gain φ sw1 sw2 sw0_split additive out_bounded zero_mints hφ o]
    rw [add_assoc, lt_add_iff_pos_right]
    exact gain_ε_pos

theorem SX.fee.arbitrage.big_factor_simp
  (sw0: Swap (constprod φ) s a t0 t1 x₀)
  (sw1: Swap (constprod φ) (Swap.apply sw0) a t0 t1 x₁)
  : ((↑x₁ * ↑(Swap.rate sw1) +
    (↑(z φ x₀ x₁ (AMMs.r0 s.amms t0 t1 sw0.exi)) - ↑(1 : ℝ>0)) * (↑x₀ * ↑(Swap.rate sw0) + ↑x₁ * ↑(Swap.rate sw1))) : ℝ) / ↑x₁ =
    (↑φ * ↑(AMMs.r0 s.amms t0 t1 sw0.exi) * ↑(AMMs.r1 s.amms t0 t1 sw0.exi)) /
      ((↑(AMMs.r0 s.amms t0 t1 sw0.exi) + ↑φ*↑x₀ + ↑φ*↑x₁) * (↑(AMMs.r0 s.amms t0 t1 sw0.exi) + ↑φ*↑x₀)) := by

    set_and_subst_reserves s.amms t0 t1 sw0.exi
    set_and_subst_α_β sw0 sw1

    have hx₁β := SX.fee.constprod.beta_simp_rate φ sw0 sw1

    conv at hx₁β =>
      repeat rw [←hr0]
      repeat rw [←hr1]
      rw [←hβ]

    sorry

theorem SX.fee.arbitrage.int_rate_simp
  (x₁ : ℝ>0)
  (sw0: Swap (constprod φ) s a t0 t1 x₀):
    ↑(constprod.int_rate φ (AMMs.r0 (Swap.apply sw0).amms t0 t1 (SX.fee.swap_apply_amm_exi sw0))
      (AMMs.r1 (Swap.apply sw0).amms t0 t1 (SX.fee.swap_apply_amm_exi sw0))) =
    (↑φ * ↑(AMMs.r0 s.amms t0 t1 sw0.exi) * ↑(AMMs.r1 s.amms t0 t1 sw0.exi)) /
      ((↑(AMMs.r0 s.amms t0 t1 sw0.exi) + ↑x₀) * (↑(AMMs.r0 s.amms t0 t1 sw0.exi) + ↑φ*↑x₀)) := by

      rw [Swap.r0_after_swap φ, Swap.r1_after_swap φ]
      unfold constprod.int_rate constprod
      set_and_subst_reserves s.amms t0 t1 sw0.exi
      rw [SX.fee.φ_r1_sub_α_x_simp _ _ _ _]
      rw [div_div, mul_comm _ (r0 + x₀)]

theorem SX.fee.arbitrage.add_gain_εφ_neg
  (sw0: Swap (constprod φ) s a t0 t1 x₀)
  (sw1: Swap (constprod φ) s a t0 t1 x)
  (sw2: Swap (constprod φ) (Swap.apply sw0) a t0 t1 x₁)
  (no_mints : W₁.get (S₁.get s.mints a) t0 t1 = 0)
  (h_split : x = x₀ + x₁)
  (o: O)
  (h_equil: SX.fee.constprod.int_rate φ (sw0.apply.amms.r0 t0 t1 (SX.fee.swap_apply_amm_exi sw0)) (sw0.apply.amms.r1 t0 t1 (SX.fee.swap_apply_amm_exi sw0)) = o t0 / o t1):
  A.gain a o (Swap.apply sw0) (Swap.apply sw2) + ↑(Swap.fee.εφ φ sw0 sw2 hφ o) < 0 ↔ x > x₀/φ := by

    unfold Swap.fee.εφ
    have no_mints' : W₁.get (S₁.get sw0.apply.mints a) t0 t1 = 0 := by
      rw [Swap.mints sw0]
      exact no_mints
    rw [Swap.fee.self_gain_no_mint_eq _ no_mints']
    simp
    unfold Swap.y
    set_and_subst_reserves s.amms t0 t1 sw0.exi
    set_and_subst_α_β sw0 sw2

    apply symm at h_split
    rw [PReal.eq_iff_toReal_eq, PReal.add_toReal, add_comm] at h_split
    rw [←eq_sub_iff_add_eq] at h_split

    conv =>
      lhs
      rw [sub_add_eq_add_sub, mul_comm, mul_assoc, ←left_distrib]
      rw [sub_neg]
      rw [mul_lt_mul_iff_div_lt_div (PReal.toReal_pos (o t1)) (PReal.toReal_pos x₁)]
      rw [←PReal.div_toReal]
      rw [←h_equil]
      conv in (↑(x₁ * β) + (↑(z φ x₀ x₁ r0) - ↑1) * (↑(x₀ * α) + ↑(x₁ * β))) / ↑x₁ =>
        simp
        rw [big_factor_simp φ sw0 sw2]
      rw [int_rate_simp φ x₁ sw0]

    subst_reserves s.amms t0 t1
    have pos1 : ↑φ * ↑r0 * ↑r1 > (0 : ℝ) := by
      rw [←PReal.mul_toReal, ←PReal.mul_toReal]
      exact PReal.toReal_pos _
    have pos2 : ((↑r0 + ↑φ * ↑x₀ + ↑φ * ↑x₁) * (↑r0 + ↑φ * ↑x₀)) > (0 : ℝ) := by
      rw [←PReal.mul_toReal, ←PReal.mul_toReal, ←PReal.add_toReal, ←PReal.add_toReal, ←PReal.mul_toReal]
      exact PReal.toReal_pos _
    have pos3 : ((↑r0 + ↑x₀) * (↑r0 + ↑φ * ↑x₀)) > (0 : ℝ) := by
      rw [←PReal.mul_toReal, ←PReal.add_toReal, ←PReal.add_toReal, ←PReal.mul_toReal]
      exact PReal.toReal_pos _
    have pos4 : (↑r0 + ↑φ * ↑x₀) > (0 : ℝ) := by
      rw [←PReal.mul_toReal, ←PReal.add_toReal]
      exact PReal.toReal_pos _
    conv =>
      lhs
      conv =>
        rhs
        rw [PReal.div_toReal]
        rw [PReal.mul_toReal, PReal.mul_toReal, PReal.mul_toReal]
        rw [PReal.add_toReal, PReal.add_toReal, PReal.mul_toReal]
      rw [div_lt_div_left pos1 pos2 pos3]
      rw [mul_lt_mul_right pos4]
      rw [add_assoc]
      rw [add_lt_add_iff_left, add_comm]
      rw [←sub_lt_iff_lt_add]
      conv in _ - _ => enter [1]; rw [←one_mul (↑x₀ : ℝ)]
      rw [←one_mul (↑x₀ : ℝ), ←sub_mul, one_mul]
      rw [mul_comm (↑φ : ℝ),  ←div_lt_iff (PReal.toReal_pos φ)]
      rw [h_split]
      rw [lt_sub_iff_add_lt']

      conv in _ + _ =>
        enter [1]
        rw [←mul_one (↑x₀ : ℝ)]
        rw [←div_self (PReal.toReal_ne_zero φ), mul_div]
      rw [←add_div, sub_mul, add_sub, one_mul, add_comm, add_sub_assoc, mul_comm, sub_self, add_zero]


theorem SX.fee.arbitrage.constprod.solution_more
  (sw0: Swap (SX.fee.constprod φ) s a t0 t1 x₀)
  (o: O)
  (hφ : φ < 1)
  (h_equil: SX.fee.constprod.int_rate φ (sw0.apply.amms.r0 t0 t1 (SX.fee.swap_apply_amm_exi sw0)) (sw0.apply.amms.r1 t0 t1 (SX.fee.swap_apply_amm_exi sw0)) = o t0 / o t1) :
  SX.fee.arbitrage.is_solution_more φ sw0 o := by

    unfold is_solution_more
    intro x sw1 h_more no_mints

    have additive: SX.fee.extended_additivity φ (SX.fee.constprod φ) := SX.fee.constprod.extended_additivity φ
    have out_bounded : SX.outputbound (SX.fee.constprod φ) := SX.fee.constprod.outputbound φ


    have ⟨x₁, prop₁⟩ := PReal.lt_iff_exists_add h_more
    have sw1_split := sw1
    rw [prop₁] at sw1_split
    have sw2 : Swap (SX.fee.constprod φ) (sw0.apply) a t0 t1 x₁ := sw1_split.bound_split2 out_bounded

    rw [Swap.apply_same_val sw1 sw1_split prop₁]
    rw [Swap.fee.additive_gain φ sw0 sw2 sw1_split additive out_bounded no_mints hφ o]

    have gain_ε_neg : A.gain a o (Swap.apply sw0) (Swap.apply sw2) + ↑(Swap.fee.εφ φ sw0 sw2 hφ o) < 0 ↔ x > x₀/φ :=
      add_gain_εφ_neg φ sw0 sw1 sw2 no_mints prop₁ o h_equil

    conv =>
      lhs;
      conv =>
        rhs;
        rw [← add_zero (A.gain a o s (Swap.apply sw0))]
      rw [add_assoc]
      rw [add_lt_add_iff_left]

    exact gain_ε_neg
