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

def SX.fee.arbitrage.is_solution (sw: Swap sx s a t0 t1 x₀) (o: O): Prop :=
  is_solution_less sw o ∧ is_solution_more φ sw o


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

theorem SX.fee.arbitrage.αx₀_add_βx₁_simp
  (sw0: Swap (constprod φ) s a t0 t1 x₀)
  (sw1: Swap (constprod φ) (Swap.apply sw0) a t0 t1 x₁):
    ((↑x₀ * ↑(Swap.rate sw0) + ↑x₁ * ↑(Swap.rate sw1)): ℝ) =
      ((↑φ * ↑(AMMs.r1 s.amms t0 t1 sw0.exi)) * (↑x₀ ^ 2 + ↑(AMMs.r0 s.amms t0 t1 sw0.exi) * ↑x₀ + ↑φ * ↑x₀ * ↑x₁ + ↑(AMMs.r0 s.amms t0 t1 sw0.exi) * ↑x₁)) /
        ((↑(AMMs.r0 s.amms t0 t1 sw0.exi) + ↑x₀ + ↑φ * ↑x₁) * (↑(AMMs.r0 s.amms t0 t1 sw0.exi) + ↑φ * ↑x₀))  := by

        conv in ((↑x₁ : ℝ) * ↑(Swap.rate sw1)) =>
          rw [←PReal.mul_toReal]
          rw [SX.fee.constprod.beta_simp_rate _ _ _]
          rw [PReal.div_toReal]
          repeat rw [PReal.mul_toReal]
          repeat rw [PReal.add_toReal]
          repeat rw [PReal.mul_toReal]

        conv in ((↑x₀  : ℝ) * ↑(Swap.rate sw0)) =>
          rw [SX.fee.constprod.rate_toReal]
          rw [mul_div]

        set_and_subst_reserves s.amms t0 t1 sw0.exi
        have den_f_ne_zero : ((↑r0 + ↑x₀ + ↑φ * ↑x₁) : ℝ) ≠ 0 := by
          repeat rw [←PReal.mul_toReal]
          repeat rw [←PReal.add_toReal]
          exact PReal.toReal_ne_zero _

        rw [div_add_div_comm_fact_denum den_f_ne_zero]
        rw [mul_comm (↑x₀ : ℝ), mul_assoc _ (↑x₀ : ℝ) _ , mul_assoc _ (↑r0 : ℝ) _, ←left_distrib]
        rw [mul_comm ((↑r0 + ↑φ * ↑x₀) : ℝ)]
        conv in (↑x₀ * (↑r0 + ↑x₀ + ↑φ * ↑x₁) + ↑r0 * ↑x₁) =>
          rw [left_distrib, left_distrib]
          rw [←sq]
          rw [←mul_assoc, mul_comm (↑x₀ : ℝ) ↑φ]
          rw [mul_comm (↑x₀ : ℝ)]
          rw [add_comm _ (↑x₀ ^ 2 : ℝ)]


theorem SX.fee.arbitrage.z_sub_one_simp
  (sw0: Swap (constprod φ) s a t0 t1 x₀)
  (_ : Swap (constprod φ) (Swap.apply sw0) a t0 t1 x₁):
    (↑(z φ x₀ x₁ (AMMs.r0 s.amms t0 t1 sw0.exi)) : ℝ) - ↑(1 : ℝ>0) =
      - ((↑(AMMs.r0 s.amms t0 t1 sw0.exi) *  ↑x₀ * ↑x₁ * (↑φ - ↑(1 : ℝ>0))) /
          ((↑(AMMs.r0 s.amms t0 t1 sw0.exi) + ↑φ * ↑x₀ + ↑φ * ↑x₁) * (↑x₀ ^ 2 + ↑(AMMs.r0 s.amms t0 t1 sw0.exi) * ↑x₀ + ↑φ * ↑x₀ * ↑x₁ + ↑(AMMs.r0 s.amms t0 t1 sw0.exi) * ↑x₁))) := by

        rw [SX.fee.z_toReal]
        set_and_subst_reserves s.amms t0 t1 sw0.exi
        have den_ne_zero : ((↑r0 + ↑φ * ↑x₀ + ↑φ * ↑x₁) * (↑x₀ ^ 2 + ↑r0 * ↑x₀ + ↑φ * ↑x₀ * ↑x₁ + ↑r0 * ↑x₁) : ℝ) ≠ 0 := by
          rw [←PReal.sq_toReal]
          repeat rw [←PReal.mul_toReal]
          repeat rw [←PReal.add_toReal]
          repeat rw [←PReal.mul_toReal]
          exact PReal.toReal_ne_zero _
        conv =>
          lhs
          rw [PReal.toReal_one_eq_Real_one]
          rw [div_sub_one den_ne_zero]

        conv in _ - _=>
          enter [1]
          rw [mul_assoc]
          rw [right_distrib, ←mul_assoc (↑x₁ : ℝ), left_distrib (↑x₁ : ℝ), right_distrib ((↑x₁ : ℝ)*r0) _ _]
          conv in (↑x₁ : ℝ) * r0 * (r0 + (↑x₀ : ℝ) + φ * (↑x₁ : ℝ)) =>
            rw [add_comm (r0 : ℝ) (↑x₀ : ℝ)]
            rw [add_assoc, left_distrib, mul_comm (↑x₁ : ℝ) (r0 : ℝ)]
          rw [←add_assoc, ←add_assoc, add_comm _ ((r0 : ℝ)*(↑x₁ : ℝ)*(↑x₀ : ℝ))]
          conv in (↑x₀ : ℝ)*(_*_) =>
            rw [←mul_assoc, mul_comm (↑x₀ : ℝ), mul_assoc, left_distrib, left_distrib (↑x₀ : ℝ), ←sq]
            rw [add_comm _ ((↑x₀ : ℝ)^2), mul_comm (↑x₀ : ℝ) r0, ←mul_assoc (↑x₀ : ℝ) φ (↑x₁ : ℝ), mul_comm (↑x₀ : ℝ) φ]
          conv in (↑x₁ : ℝ) * (φ * (↑x₀ : ℝ)) * (r0 + (↑x₀ : ℝ) + φ * (↑x₁ : ℝ)) =>
            rw [←mul_assoc, mul_assoc, left_distrib, left_distrib (↑x₀ : ℝ)]
            rw [add_comm _ ((↑x₀ : ℝ)*(↑x₀ : ℝ)), ←sq, mul_comm (↑x₀ : ℝ) r0, ←mul_assoc (↑x₀ : ℝ) φ (↑x₁ : ℝ), mul_comm (↑x₀ : ℝ) φ]
          rw [add_assoc, add_assoc, add_comm (r0 * (↑x₁ : ℝ) * (r0 + φ * (↑x₁ : ℝ))) _ , ← add_assoc _ _ (r0 * (↑x₁ : ℝ) * (r0 + φ * (↑x₁ : ℝ)))]
          rw [←right_distrib, mul_comm (↑x₁ : ℝ) φ, ←add_assoc, add_rotate, mul_comm (r0*(↑x₁ : ℝ))]

        conv in _ - _=>
          enter [2]
          rw [add_comm (r0 : ℝ) ((φ : ℝ)*(↑x₀ : ℝ)), add_assoc, right_distrib]
          rw [left_distrib]
          conv in φ * (↑x₀ : ℝ) * (r0 * (↑x₁ : ℝ)) =>
            rw [mul_comm (φ: ℝ) (↑x₀ : ℝ), mul_comm, ←mul_assoc]
          rw [add_comm _ (r0*(↑x₁ : ℝ)*(↑x₀ : ℝ)*φ)]
          rw [left_distrib (r0 + φ*(↑x₁ : ℝ))]
          rw [add_assoc, ← add_assoc (φ * (↑x₀ : ℝ) * ((↑x₀ : ℝ) ^ 2 + r0 * (↑x₀ : ℝ) + φ * (↑x₀ : ℝ) * (↑x₁ : ℝ))) _ _, ← right_distrib, ←add_assoc (φ*(↑x₀ : ℝ)), add_comm (φ*(↑x₀ : ℝ))]
          rw [←add_assoc, add_comm (r0*(↑x₁ : ℝ)*(↑x₀ : ℝ)*φ)]
          rw [add_assoc, add_comm (r0*(↑x₁ : ℝ)*(↑x₀ : ℝ)*φ), ←add_assoc]

        conv in _ / _ =>
          enter [1]
          simp
          rw [←hr0]
          conv =>
            enter [1]
            rw [←mul_one (↑r0 * ↑x₁ * ↑x₀ : ℝ)]
            rw [←PReal.toReal_one_eq_Real_one]
          rw [sub_eq_neg_sub_inv]
          rw [←mul_sub]
          rw [mul_assoc (↑r0 : ℝ), mul_comm (↑x₁ : ℝ), ←mul_assoc]
        rw [neg_div]

theorem SX.fee.arbitrage.z_sub_one_α_β_simp
  (sw0: Swap (constprod φ) s a t0 t1 x₀)
  (sw1: Swap (constprod φ) (Swap.apply sw0) a t0 t1 x₁):
    (↑((z φ x₀ x₁ (AMMs.r0 s.amms t0 t1 sw0.exi)) : ℝ) - (↑(1: ℝ>0))) * ((↑x₀ : ℝ) * (↑(Swap.rate sw0) : ℝ) + (↑x₁ : ℝ) * ((Swap.rate sw1) : ℝ)) =
      - ((↑φ * ↑(AMMs.r0 s.amms t0 t1 sw0.exi) * ↑(AMMs.r1 s.amms t0 t1 sw0.exi) * ↑x₀ * ↑x₁ * (↑φ - ↑1)) /
        ((↑(AMMs.r0 s.amms t0 t1 sw0.exi) + ↑φ*↑x₀ + ↑φ*↑x₁) * (↑(AMMs.r0 s.amms t0 t1 sw0.exi) + ↑φ*↑x₀) * (↑(AMMs.r0 s.amms t0 t1 sw0.exi) + ↑x₀ + ↑φ*↑x₁))) := by


    set_and_subst_reserves s.amms t0 t1 sw0.exi
    set_and_subst_α_β sw0 sw1

    have h_z_sub_1 := z_sub_one_simp φ sw0 sw1
    conv at h_z_sub_1 =>
      repeat rw [←hr0]
      repeat rw [←hr1]

    have h_αx₀_add_βx₁ := αx₀_add_βx₁_simp φ sw0 sw1
    conv at h_αx₀_add_βx₁ =>
      repeat rw [←hr0]
      repeat rw [←hr1]
      rw [←hβ]
      rw [←hα]

    have den_fact_ne_zero : ((↑x₀ ^ 2 + ↑r0 * ↑x₀ + ↑φ * ↑x₀ * ↑x₁ + ↑r0 * ↑x₁) : ℝ) ≠ 0 := by
      rw [←PReal.sq_toReal, ←PReal.mul_toReal, ←PReal.mul_toReal, ←PReal.mul_toReal, ←PReal.mul_toReal, ←PReal.add_toReal, ←PReal.add_toReal, ←PReal.add_toReal]
      exact PReal.toReal_ne_zero _
    rw [h_z_sub_1, h_αx₀_add_βx₁]
    rw [min_div_mul_div_simp_comm_fact den_fact_ne_zero]
    rw [mul_comm _ ((↑r0 + ↑φ * ↑x₀) : ℝ), ←mul_assoc _ ((↑r0 + ↑φ * ↑x₀) : ℝ)]

    have hh : (↑r0 * ↑x₀ * ↑x₁ * (↑φ - ↑(1 : ℝ>0)) * (↑φ * ↑r1) : ℝ) = (↑φ * ↑r0 * ↑r1 * ↑x₀ * ↑x₁ * (↑φ - ↑1) : ℝ) := by
      conv =>
        lhs
        rw [mul_comm, ←mul_assoc, ←mul_assoc _ _ (↑x₁ : ℝ), ←mul_assoc]
        rw [mul_assoc (↑φ : ℝ), mul_comm (↑r1 : ℝ), ←mul_assoc]

    rw [hh]


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

    rw [PReal.eq_iff_toReal_eq] at hx₁β
    simp at hx₁β
    conv at hx₁β =>
      repeat rw [←hr0]
      repeat rw [←hr1]
      rw [←hβ]

    have hzαβ := SX.fee.arbitrage.z_sub_one_α_β_simp φ sw0 sw1

    conv at hzαβ =>
      repeat rw [←hr0]
      repeat rw [←hr1]
      rw [←hβ]
      rw [←hα]

    rw [hzαβ, hx₁β, ←sub_eq_add_neg]
    have hd_ne_zero : ((↑r0 + ↑φ * ↑x₀ + ↑φ * ↑x₁): ℝ) ≠ 0 := by
      rw [←PReal.mul_toReal, ←PReal.mul_toReal, ←PReal.add_toReal, ←PReal.add_toReal]
      exact PReal.toReal_ne_zero _
    have hc_ne_zero: ((↑r0 + ↑x₀ + ↑φ * ↑x₁) : ℝ) ≠ 0 := by
      rw [←PReal.mul_toReal, ←PReal.add_toReal, ←PReal.add_toReal]
      exact PReal.toReal_ne_zero _

    conv in _ / _ =>
      enter [1]
      rw [mul_assoc _ ((↑r0 + ↑φ * ↑x₀) : ℝ), mul_comm ((↑r0 + ↑φ * ↑x₀) : ℝ), mul_comm ((↑r0 + ↑φ * ↑x₀ + ↑φ * ↑x₁) : ℝ)]
      rw [div_sub_div_comm_fact_denum hd_ne_zero]
      rw [mul_assoc _ (↑r1 : ℝ) _, mul_comm (↑r1 : ℝ), ←mul_assoc]
      rw [mul_assoc _ (↑x₀ : ℝ) _ , mul_comm (↑x₀: ℝ) _, ←mul_assoc, mul_assoc _ (↑x₀ : ℝ)]
      rw [←mul_sub, mul_sub (↑x₀ : ℝ), mul_one, mul_comm (↑x₀ : ℝ), sub_sub_eq_add_sub]
      rw [add_sub_comm', add_sub_comm', add_sub_assoc, sub_self, add_zero]
      rw [add_assoc, add_comm _ (↑x₀ : ℝ), ←add_assoc, mul_comm]
      rw [mul_assoc ((↑r0 + ↑x₀ + ↑φ * ↑x₁) : ℝ)]
      rw [mul_div_mul_left _ _ hc_ne_zero]
      rw [mul_comm ((↑r0 + ↑φ * ↑x₀) : ℝ)]
    rw [div_div]
    rw [mul_div_mul_right _ _ (PReal.toReal_ne_zero _)]

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



theorem SX.fee.arbitrage.constprod.equil_value
  (sw0: Swap (SX.fee.constprod φ) s a t0 t1 x₀)
  (o: O)
  (hφ : φ < 1)
  (h_pos : (o t0).sqrt * (s.amms.r0 t0 t1 sw0.exi) * ((1: ℝ>0) + φ) < (s.amms.r0 t0 t1 sw0.exi).sqrt * ((o t0) * (s.amms.r0 t0 t1 sw0.exi) * (⟨((↑φ : ℝ) - 1)^2 ,PReal.neg_sub_ne_zero_pos hφ⟩ : ℝ>0) + (⟨4, by norm_num⟩ : ℝ>0) * (o t1) * (s.amms.r1 t0 t1 sw0.exi) * φ ^ 2).sqrt)
  (h0 : x₀ =
    (((s.amms.r0 t0 t1 sw0.exi).sqrt * ((o t0) * (s.amms.r0 t0 t1 sw0.exi) * (⟨((↑φ : ℝ) - 1)^2 ,PReal.neg_sub_ne_zero_pos hφ⟩ : ℝ>0) + (⟨4, by norm_num⟩ : ℝ>0) * (o t1) * (s.amms.r1 t0 t1 sw0.exi) * φ ^ 2).sqrt).sub
    ((o t0).sqrt * (s.amms.r0 t0 t1 sw0.exi) * ((1: ℝ>0) + φ)) h_pos) /
      (⟨2, by norm_num⟩ * (o t0).sqrt * φ)) : SX.fee.constprod.int_rate φ  (sw0.apply.amms.r0 t0 t1 (swap_apply_amm_exi _)) (sw0.apply.amms.r1 t0 t1 (swap_apply_amm_exi _)) = (o t0) / (o t1)
       := by


    set n_2 : ℝ>0 := (⟨2, by norm_num⟩ : ℝ>0) with h2
    set n_4 : ℝ>0 := (⟨4, by norm_num⟩ : ℝ>0) with h4
    set φ_sub_1_sq : ℝ>0 := (⟨((↑φ : ℝ) - 1)^2 ,PReal.neg_sub_ne_zero_pos hφ⟩ : ℝ>0) with hφ_sub_1

    rw [Swap.r0_after_swap φ sw0, Swap.r1_after_swap φ sw0]
    rw [PReal.eq_iff_toReal_eq]

    unfold constprod.int_rate constprod
    rw [SX.fee.φ_r1_sub_α_x_simp, div_div]
    simp
    set_and_subst_reserves s.amms t0 t1 sw0.exi

    simp_rw [←hr0] at h0
    conv at h0 =>
      conv =>
        pattern (⟨4, _⟩ : ℝ>0)
        rw [←h4]
      conv =>
        pattern (⟨((↑φ : ℝ) - 1)^2 ,PReal.neg_sub_ne_zero_pos hφ⟩ : ℝ>0)
        rw [←hφ_sub_1]
      conv =>
        pattern (s.amms.r1 t0 t1 sw0.exi)
        rw [←hr1]
      conv =>
        pattern (⟨2, _⟩ : ℝ>0)
        rw [←h2]

    have hx₀r0 : (↑r0 : ℝ) + (↑x₀ : ℝ) =
      ((o t0 : ℝ).sqrt * (r0 : ℝ) * (φ - 1) + (↑r0 : ℝ).sqrt * ((o t0 : ℝ) * r0 * (φ - 1)^2 + 4 * (o t1) * r1 * φ^2).sqrt) /
          (2 * (o t0: ℝ).sqrt * φ):= by

          conv =>
            lhs
            rw [h0]
            rw [PReal.div_toReal, PReal.sub_toReal]
            rw [add_comm, div_add' _ _ _ (PReal.toReal_ne_zero _)]
            rw [sub_eq_add_neg, add_assoc, add_comm _ (↑r0 * ↑(n_2 * PReal.sqrt (o t0) * φ) : ℝ)]
            rw [← sub_eq_add_neg]
            repeat rw [PReal.mul_toReal]
            repeat rw [PReal.sqrt_to_real]
            repeat rw [PReal.add_toReal]
            repeat rw [PReal.mul_toReal]
            rw [PReal.toReal_one_eq_Real_one]
            conv in (↑r0 * (↑n_2 * Real.sqrt ↑(o t0) * ↑φ) - Real.sqrt ↑(o t0) * ↑r0 * (1 + ↑φ)) =>
              rw [mul_comm (↑n_2 : ℝ), ←mul_assoc, ←mul_assoc, mul_comm (↑r0 : ℝ)]
              rw [mul_assoc (Real.sqrt ↑(o t0) * ↑r0 : ℝ), ←mul_sub]
              conv in (↑n_2 * ↑φ - (1 + ↑φ)) =>
                simp
                ring_nf!
                rw [add_comm, ← sub_eq_add_neg]
            rw [add_comm]


    have hφx₀r0 : r0 + φ * (↑x₀ : ℝ) =
        ((↑r0 : ℝ).sqrt * ((o t0 : ℝ) * r0 * (φ - 1)^2 + 4 * (o t1) * r1 * φ^2).sqrt - (o t0 : ℝ).sqrt * (r0 : ℝ) * (φ - 1)) /
          (2 * (o t0: ℝ).sqrt):= by

          conv =>
            lhs
            rw [h0]
            rw [PReal.div_toReal, PReal.sub_toReal]
            conv in (↑(n_2 * PReal.sqrt (o t0) * φ) : ℝ) =>
              repeat rw [PReal.mul_toReal]
              rw [mul_comm]
              rw [←PReal.mul_toReal]
            rw [mul_div_cancel_den (PReal.toReal_ne_zero _)]

            rw [add_comm, div_add' _ _ _ (PReal.toReal_ne_zero _)]
            rw [sub_eq_add_neg, add_assoc, add_comm _ (↑r0 * ↑(n_2 * PReal.sqrt (o t0)) : ℝ)]
            rw [← sub_eq_add_neg]
            repeat rw [PReal.mul_toReal]
            repeat rw [PReal.sqrt_to_real]
            repeat rw [PReal.add_toReal]
            repeat rw [PReal.mul_toReal]
            rw [PReal.toReal_one_eq_Real_one]
            conv in (↑r0 * (↑n_2 * Real.sqrt ↑(o t0)) - Real.sqrt ↑(o t0) * ↑r0 * (1 + ↑φ)) =>
              rw [mul_comm (↑n_2 : ℝ), ←mul_assoc, mul_comm (↑r0 : ℝ)]
              rw [←mul_sub]
              conv in (↑n_2 - (1 + ↑φ)) =>
                simp
                ring_nf!
              rw [←neg_sub, mul_neg]
            rw [← sub_eq_add_neg]

    rw [←hr0, ←hr1] at h_pos
    rw [hx₀r0, hφx₀r0]
    set m : ℝ := (↑r0 : ℝ).sqrt * ((o t0 : ℝ) * r0 * (φ - 1)^2 + 4 * (o t1) * r1 * φ^2).sqrt with hm
    rw [div_mul_div_comm]

    conv in (2 * Real.sqrt ↑(o t0) * (2 * Real.sqrt ↑(o t0) * φ)) =>
      rw [←mul_assoc, mul_assoc 2, ←mul_assoc _ 2, mul_comm _ 2, ←mul_assoc, ←mul_assoc]
      norm_num
      rw [mul_assoc 4, Real.mul_self_sqrt (le_of_lt (PReal.toReal_pos _))]
    rw [div_div_eq_mul_div]
    rw [add_comm _ m, ←square_diff]
    rw [mul_assoc (Real.sqrt (↑(o t0) : ℝ)), mul_pow (Real.sqrt (↑(o t0) : ℝ))]
    rw [Real.sq_sqrt (le_of_lt (PReal.toReal_pos _)), mul_pow (↑r0 : ℝ), ←mul_assoc _ (↑r0^2 : ℝ)]

    have h_sqrt : ↑r0 * (↑(o t0) * ↑r0 * (↑φ - (1:ℝ)) ^ 2 + 4 * ↑(o t1) * ↑r1 * ↑φ ^ 2) ≥ 0 := by

      rw [←PReal.mul_toReal]
      rw [←PReal.sq_toReal]
      have hh' : (↑φ - 1) ^ 2 > (0 : ℝ) := PReal.neg_sub_ne_zero_pos hφ
      have hh'' : ↑(o t0 * r0) * (↑φ - 1) ^ 2 > (0 : ℝ) := mul_pos (PReal.toReal_pos _) hh'
      have hh''' : 4 * ↑(o t1) * ↑r1 * (↑(φ ^ 2 : ℝ>0) : ℝ) > (0 : ℝ) := by simp [PReal.toReal_pos]
      have hh'''' : (↑(o t0 * r0) * (↑φ - 1) ^ 2 + 4 * ↑(o t1) * ↑r1 * ↑(φ ^ 2 : ℝ>0)) > (0: ℝ) := by
        exact add_pos hh'' hh'''
      exact le_of_lt (mul_pos (PReal.toReal_pos _) hh'''')

    have hm_sq : m^2 = (o t0) * r0^2 * (φ - 1) ^ 2 + 4 * (o t1) * r0 * r1 * φ^2 := by
      rw [hm]
      rw [←Real.sqrt_mul (le_of_lt (PReal.toReal_pos _))]
      rw [Real.sq_sqrt h_sqrt]
      rw [left_distrib]
      ring_nf!

    rw [hm_sq]
    rw [add_sub_cancel']
    rw [mul_comm, mul_assoc, ←mul_assoc (↑φ:ℝ), ←mul_assoc (↑φ:ℝ), ←sq]
    rw [mul_comm _ (↑r0 : ℝ), mul_assoc (↑r0 : ℝ), mul_comm _ (↑r1 : ℝ), ←mul_assoc (↑r0 : ℝ)]
    rw [mul_assoc 4]
    conv in _ / _ =>
      enter [2]
      rw [mul_assoc _ (↑r1 : ℝ) (↑φ ^ 2 : ℝ)]
      rw [mul_assoc _ _ ((↑r1 * ↑φ ^ 2) : ℝ)]
      rw [mul_assoc 4, ←mul_assoc (↑r0 : ℝ)]
    have h_ne_zero : (4 : ℝ) ≠ 0 := by simp
    have h_ne_zero' : ((↑r0 * ↑r1 * ↑φ ^ 2) : ℝ) ≠ (0 : ℝ) := by
      rw [←PReal.mul_toReal, ←PReal.sq_toReal, ←PReal.mul_toReal]
      exact PReal.toReal_ne_zero _
    rw [mul_div_mul_left _ _ h_ne_zero, mul_div_mul_right _ _ h_ne_zero']
