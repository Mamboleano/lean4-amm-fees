import AMMLib.FeeVersion.Swap.Basic
import AMMLib.FeeVersion.Swap.Additivity
import AMMLib.FeeVersion.Swap.Constprod
import AMMLib.FeeVersion.Swap.Arbitrage
import HelpersLib.Real.Division
import HelpersLib.Real.Order
import HelpersLib.Real.Subtraction
import HelpersLib.PReal.Basic
import HelpersLib.PReal.Division
import HelpersLib.PReal.Negative
import HelpersLib.PReal.Order
import HelpersLib.PReal.Sqrt

variable (φ : ℝ>0)

theorem SX.fee.constprod.x_max_pos_cond (sw0: Swap (SX.fee.constprod φ) s a t0 t1 x₀) (o : O) (h_equil: SX.fee.constprod.sw_to_equil φ sw0 o) (hφ : φ < 1):
  (o t0).sqrt * ((s.amms.r0 t0 t1 sw0.exi) + φ * x₀) < ((o t1) * φ * (s.amms.r0 t0 t1 sw0.exi) * (s.amms.r1 t0 t1 sw0.exi)).sqrt := by

  set_and_subst_reserves s.amms t0 t1 sw0.exi
  apply (PReal.toReal_lt_toReal_iff _ _).mp
  rw [PReal.sqrt_to_real]
  rw [PReal.mul_toReal, PReal.add_toReal, PReal.mul_toReal]
  repeat rw [PReal.mul_toReal]
  rw [PReal.sqrt_to_real]
  have hpos : (0 : ℝ) < ↑(r0) + ↑φ * ↑x₀ := by
    rw [←PReal.mul_toReal, ←PReal.add_toReal]
    exact PReal.toReal_pos _
  rw [sqrt_mul_lt_sqrt (PReal.toReal_pos _) hpos]
  have hpos1 : (↑r0 + ↑φ * ↑x₀) ^ 2 > (0 : ℝ) := by simp_all only [gt_iff_lt, pow_pos]
  rw [mul_comm, mul_assoc (↑(o t1) * ↑φ : ℝ), mul_assoc (↑(o t1): ℝ),mul_lt_mul_iff_div_lt_div hpos1 (PReal.toReal_pos _)]
  rw [←mul_assoc]
  unfold sw_to_equil at h_equil
  rw [←PReal.div_toReal]
  rw [h_equil.symm]
  rw [SX.fee.arbitrage.int_rate_simp φ sw0]
  conv =>
    lhs
    rw [PReal.div_toReal]
    rw [PReal.mul_toReal, PReal.mul_toReal, PReal.mul_toReal]
    rw [PReal.add_toReal, PReal.add_toReal, PReal.mul_toReal]
  rw [←hr0, ←hr1]
  have hpos2 : ↑φ * ↑r0 * ↑r1 > (0 : ℝ) := by rw [←PReal.mul_toReal, ←PReal.mul_toReal]; exact PReal.toReal_pos _
  have hpos3 : (0 : ℝ) < (↑r0 + ↑x₀) * (↑r0 + ↑φ * ↑x₀) := by
    rw [←PReal.mul_toReal, ←PReal.add_toReal, ←PReal.add_toReal, ←PReal.mul_toReal]
    exact PReal.toReal_pos _
  rw [div_lt_div_left hpos2 hpos3 hpos1]
  rw [sq]
  rw [mul_lt_mul_right hpos]
  apply add_lt_add_left
  conv =>
    rhs
    rw [←one_mul (↑x₀ : ℝ)]
  rw [mul_lt_mul_right (PReal.toReal_pos _)]
  simpa

noncomputable def SX.fee.constprod.x_max' (sw0: Swap (SX.fee.constprod φ) s a t0 t1 x₀) (o : O) (h_equil: SX.fee.constprod.sw_to_equil φ sw0 o) (hφ : φ < 1): ℝ>0 :=
  (((o t1)*φ*(s.amms.r0 t0 t1 sw0.exi)*(s.amms.r1 t0 t1 sw0.exi)).sqrt.sub ((o t0).sqrt * ((s.amms.r0 t0 t1 sw0.exi) + φ*x₀))
      (x_max_pos_cond φ sw0 o h_equil hφ))
      / ((o t0).sqrt * φ)

noncomputable def SX.fee.constprod.x_max (sw0: Swap (SX.fee.constprod φ) s a t0 t1 x₀) (o : O) (h_equil: SX.fee.constprod.sw_to_equil φ sw0 o) (hφ : φ < 1): ℝ>0 :=
  x₀ + (SX.fee.constprod.x_max' φ sw0 o h_equil hφ)

theorem SX.fee.constprod.x_max_lt_x₀_div_φ (sw0: Swap (SX.fee.constprod φ) s a t0 t1 x₀) (o : O) (h_equil: SX.fee.constprod.sw_to_equil φ sw0 o) (hφ : φ < 1):
   (x_max φ sw0 o h_equil hφ) < x₀ / φ := by

    unfold x_max x_max'
    set_and_subst_reserves s.amms t0 t1 sw0.exi
    conv in PReal.sqrt (o t0) * (r0 + φ * x₀) =>
      rw [left_distrib]
    rw [PReal.no_denum_add_div, PReal.sub_sub']
    rw [mul_comm x₀, mul_assoc]
    rw [PReal.add_y_sub_y _ _ _]

    conv =>
      rhs
      rw [←one_mul φ]
    rw [PReal.div_lt_div_denum_right, div_one]
    rw [div_lt_iff_lt_mul]

    apply (PReal.toReal_lt_toReal_iff _ _).mp
    rw [PReal.sub_toReal]
    rw [PReal.sqrt_to_real]
    repeat rw [PReal.mul_toReal]
    repeat rw [PReal.sqrt_to_real]
    rw [sub_lt_iff_lt_add]
    rw [mul_comm (↑x₀ : ℝ), ←left_distrib]
    have hpos : (0 : ℝ) < ↑(o t1) * ↑φ * ↑r0 * ↑r1 := by
      repeat rw[←PReal.mul_toReal]
      exact PReal.toReal_pos _
    rw [sqrt_lt_sqrt_mul hpos (by rw[←PReal.add_toReal]; exact PReal.toReal_pos _) (PReal.toReal_pos _)]
    have hpos1 : (↑x₀ + ↑r0) ^ 2 > (0 : ℝ) := by
      apply pow_two_pos_of_ne_zero
      rw [←PReal.add_toReal]
      exact PReal.toReal_ne_zero _
    rw [mul_comm (↑(o t0) : ℝ), mul_assoc, mul_assoc, mul_lt_mul_iff_div_lt_div (PReal.toReal_pos _) hpos1]
    unfold sw_to_equil at h_equil
    rw [←PReal.div_toReal]
    rw [h_equil.symm]
    rw [SX.fee.arbitrage.int_rate_simp φ sw0]
    conv =>
      rhs
      rw [PReal.div_toReal]
      rw [PReal.mul_toReal, PReal.mul_toReal, PReal.mul_toReal]
      rw [PReal.add_toReal, PReal.add_toReal, PReal.mul_toReal]
      rw [←hr0, ←hr1]
      rw [mul_assoc]
    rw [sq]
    have hpos2 : ↑φ * (↑r0 * ↑r1) > (0 : ℝ) := by rw [←PReal.mul_toReal, ←PReal.mul_toReal]; exact PReal.toReal_pos _
    have hpos3 : (0 : ℝ) < (↑x₀ + ↑r0) * (↑x₀ + ↑r0) := by aesop
    have hpos4 : (0 : ℝ) < (↑r0 + ↑x₀) * (↑r0 + ↑φ * ↑x₀) := by rw [←PReal.mul_toReal, ←PReal.add_toReal, ←PReal.add_toReal, ←PReal.mul_toReal]; exact PReal.toReal_pos _
    rw [div_lt_div_left hpos2 hpos3 hpos4]
    rw [mul_comm, add_comm _ (↑x₀ : ℝ)]
    rw [mul_lt_mul_right (by rw [←PReal.add_toReal]; exact PReal.toReal_pos _)]
    rw [add_comm]
    apply add_lt_add_right
    conv =>
      rhs
      rw [←one_mul (↑x₀ : ℝ)]
    rw [mul_lt_mul_right (PReal.toReal_pos _)]
    simpa

theorem SX.fee.constprod.gain_xmax_gt_x₀
  (sw0: Swap (SX.fee.constprod φ) s a t0 t1 x₀)
  (o : O)
  (h_equil: SX.fee.constprod.sw_to_equil φ sw0 o)
  (hφ : φ < 1)
  (sw_max : Swap (SX.fee.constprod φ) s a t0 t1 (x_max φ sw0 o h_equil hφ))
  (no_mints : W₁.get (S₁.get s.mints a) t0 t1 = 0):
    A.gain a o s (Swap.apply sw0) < A.gain a o s (Swap.apply sw_max) := by

    have x₀_lt_x_max : x₀ < (x_max φ sw0 o h_equil hφ) := by unfold x_max; aesop
    have bound: SX.outputbound (SX.fee.constprod φ) := SX.fee.constprod.outputbound φ
    have additive: SX.fee.extended_additivity φ (SX.fee.constprod φ) := SX.fee.constprod.extended_additivity φ

    have ⟨x₁, addi⟩ := PReal.lt_iff_exists_add x₀_lt_x_max
    have sw_max_split := sw_max
    rw [addi] at sw_max_split
    rw [Swap.apply_same_val sw_max sw_max_split addi]

    have sw_max': Swap (SX.fee.constprod φ) (sw0.apply) a t0 t1 x₁ :=
      sw_max_split.bound_split2 bound

    rw [Swap.fee.additive_gain φ sw0 sw_max' sw_max_split additive bound no_mints hφ o]
    rw [add_assoc, lt_add_iff_pos_right]

    have gain_ε_pos : A.gain a o (Swap.apply sw0) (Swap.apply sw_max') + ↑(Swap.fee.εφ φ sw0 sw_max' hφ o) > 0 ↔ (x_max φ sw0 o h_equil hφ) < x₀/φ := by
      exact SX.fee.arbitrage.add_gain_εφ_pos φ sw0 sw_max sw_max' no_mints addi o h_equil

    apply gain_ε_pos.mpr
    exact x_max_lt_x₀_div_φ _ _ _ _ _


theorem SX.fee.constprod.x_max_gain_gt_x_gt_equil
  (sw0: Swap (SX.fee.constprod φ) s a t0 t1 x₀)
  (sw2 : Swap (constprod φ) s a t0 t1 x)
  (o : O)
  (h_equil: SX.fee.constprod.sw_to_equil φ sw0 o)
  (hφ : φ < 1)
  (sw_max : Swap (SX.fee.constprod φ) s a t0 t1 (x_max φ sw0 o h_equil hφ))
  (x_gt_x₀ : x > x₀)
  (no_mints : W₁.get (S₁.get s.mints a) t0 t1 = 0):
    A.gain a o s (Swap.apply sw2) < A.gain a o s (Swap.apply sw_max) := by

    have x₀_lt_x_max : x₀ < (x_max φ sw0 o h_equil hφ) := by unfold x_max; aesop
    have bound: SX.outputbound (SX.fee.constprod φ) := SX.fee.constprod.outputbound φ
    have additive: SX.fee.extended_additivity φ (SX.fee.constprod φ) := SX.fee.constprod.extended_additivity φ

    -- Rewrite Gain(x_max) as the sum
    have ⟨x_max', x_max_split⟩ := PReal.lt_iff_exists_add x₀_lt_x_max
    have sw_max_split := sw_max
    rw [x_max_split] at sw_max_split
    rw [Swap.apply_same_val sw_max sw_max_split x_max_split]

    have sw_max': Swap (SX.fee.constprod φ) (sw0.apply) a t0 t1 x_max' :=
      sw_max_split.bound_split2 bound

    rw [Swap.fee.additive_gain φ sw0 sw_max' sw_max_split additive bound no_mints hφ o]

    -- Rewrite Gain(x) as the sum
    have ⟨x₁, x_split⟩ := PReal.lt_iff_exists_add x_gt_x₀
    have sw2_split := sw2
    rw [x_split] at sw2_split
    rw [Swap.apply_same_val sw2 sw2_split x_split]

    have sw2': Swap (SX.fee.constprod φ) (sw0.apply) a t0 t1 x₁ :=
      sw2_split.bound_split2 bound

    rw [Swap.fee.additive_gain φ sw0 sw2' sw2_split additive bound no_mints hφ o]

    -- Delete Gain(x₀)
    rw [add_assoc, add_assoc]
    apply add_lt_add_left

    -- Rewriting the gain ε sum
    unfold Swap.fee.εφ
    have no_mints' : W₁.get (S₁.get sw0.apply.mints a) t0 t1 = 0 := by
      rw [Swap.mints sw0]
      exact no_mints
    rw [Swap.fee.self_gain_no_mint_eq _ no_mints', Swap.fee.self_gain_no_mint_eq _ no_mints']
    simp
    unfold Swap.y
    set_and_subst_reserves s.amms t0 t1 sw0.exi
    conv =>
      conv =>
        lhs
        rw [sub_add_eq_add_sub, mul_comm, mul_assoc, ←left_distrib]
        rw [PReal.mul_toReal, PReal.mul_toReal]
        rw [SX.fee.arbitrage.big_factor_simp' φ sw0 sw2']
      conv =>
        rhs
        rw [sub_add_eq_add_sub, mul_comm, mul_assoc, ←left_distrib]
        rw [PReal.mul_toReal, PReal.mul_toReal]
        rw [SX.fee.arbitrage.big_factor_simp' φ sw0 sw_max']
    rw [←hr0, ←hr1]

    -- Starting proof with A, N(x), D(x)
    sorry

theorem SX.fee.constprod.x_max_gain
  (sw0: Swap (SX.fee.constprod φ) s a t0 t1 x₀)
  (o : O)
  (h_equil: SX.fee.constprod.sw_to_equil φ sw0 o)
  (hφ : φ < 1)
  (sw_max : Swap (SX.fee.constprod φ) s a t0 t1 (x_max φ sw0 o h_equil hφ)):
  ∀ (x: ℝ>0) (sw2: Swap (SX.fee.constprod φ) s a t0 t1 x),
    x ≠ (x_max φ sw0 o h_equil hφ) → (s.mints.get a).get t0 t1 = 0 → a.gain o s sw2.apply <  a.gain o s sw_max.apply := by

    intros x sw2 h_diff no_mints
    have gain_x₀_lt_x_max: A.gain a o s (Swap.apply sw0) < A.gain a o s (Swap.apply sw_max) := SX.fee.constprod.gain_xmax_gt_x₀ φ sw0 o h_equil hφ sw_max no_mints

    rcases lt_or_gt_of_ne h_diff with _|hx_gt
    -- Case x < x_max
    . rcases Decidable.em (x < x₀) with le|nle
      -- Case x < x₀
      . have hsol := SX.fee.arbitrage.constprod.solution_less φ sw0 o hφ h_equil
        unfold arbitrage.is_solution_less at hsol
        have gain_x_lt_x₀ := hsol x sw2 le no_mints
        exact lt_trans gain_x_lt_x₀ gain_x₀_lt_x_max
      -- Case x ≥ x₀
      . simp at nle
        rcases lt_or_eq_of_le nle with lt_x₀_x|eq_x₀_x
        -- Case x > x₀
        . exact SX.fee.constprod.x_max_gain_gt_x_gt_equil φ sw0 sw2 o h_equil hφ sw_max lt_x₀_x no_mints
        -- Case x = x₀
        . rw [Swap.apply_same_val sw2 sw0 eq_x₀_x.symm]
          exact gain_x₀_lt_x_max

    -- Case x > x_max
    . have x₀_lt_x_max : x₀ < (x_max φ sw0 o h_equil hφ) := by unfold x_max; aesop
      have x_gt_x₀ : x > x₀ := lt_trans x₀_lt_x_max hx_gt
      exact SX.fee.constprod.x_max_gain_gt_x_gt_equil φ sw0 sw2 o h_equil hφ sw_max x_gt_x₀ no_mints
