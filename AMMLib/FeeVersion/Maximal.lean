import AMMLib.FeeVersion.Basic
import AMMLib.FeeVersion.Additivity
import AMMLib.FeeVersion.Constprod
import AMMLib.FeeVersion.Arbitrage
import HelpersLib.Real.Division
import HelpersLib.Real.Multiplication
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
  apply (PReal.toReal_lt_toReal_iff _ _).mpr
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
  rw [div_lt_div_iff_of_pos_left hpos2 hpos3 hpos1]
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


theorem SX.fee.constprod.x_max'_eq_cond
  (sw0: Swap (SX.fee.constprod φ) s a t0 t1 x₀)
  (o : O)
  (h_equil: SX.fee.constprod.sw_to_equil φ sw0 o)
  (hφ : φ < 1)
  : (↑(o t0) : ℝ).sqrt * ((↑(s.amms.r0 t0 t1 sw0.exi) : ℝ) + (↑φ : ℝ) * (↑x₀ : ℝ) + ↑φ*↑(x_max' φ sw0 o h_equil hφ)) =
      ((↑(o t1) : ℝ) * ↑φ * ↑(s.amms.r0 t0 t1 sw0.exi) * ↑(s.amms.r1 t0 t1 sw0.exi)).sqrt := by

      rw [mul_eq_iff_eq_div (Real.sqrt_ne_zero'.mpr (PReal.toReal_pos _))]
      rw [add_comm]
      apply add_eq_of_eq_sub
      rw [div_sub' (Real.sqrt_ne_zero'.mpr (PReal.toReal_pos _))]
      rw [mul_eq_iff_eq_div (PReal.toReal_ne_zero _)]

      set_and_subst_reserves s.amms t0 t1 sw0.exi
      unfold x_max'
      conv =>
        lhs
        rw [PReal.div_toReal, PReal.sub_toReal]
        rw [PReal.sqrt_to_real]
        repeat rw [PReal.mul_toReal]
        rw [PReal.sqrt_to_real]
        rw [←hr0, ←hr1]
        rw [PReal.add_toReal]
        rw [PReal.mul_toReal]
      rw [div_div]

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

    apply (PReal.toReal_lt_toReal_iff _ _).mpr
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
    rw [div_lt_div_iff_of_pos_left hpos2 hpos3 hpos4]
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
  (h_supply : s.mints.supply t0 t1 > 0)
  (h_mints : (s.mints.get a).get t0 t1 < s.mints.supply t0 t1):
    A.gain a o s (Swap.apply sw0) < A.gain a o s (Swap.apply sw_max) := by

    have x₀_lt_x_max : x₀ < (x_max φ sw0 o h_equil hφ) := by
      unfold x_max
      simp [PReal.toReal_pos]
    have bound: SX.outputbound (SX.fee.constprod φ) := SX.fee.constprod.outputbound φ
    have additive: SX.fee.extended_additivity φ (SX.fee.constprod φ) := SX.fee.constprod.extended_additivity φ

    have ⟨x₁, addi⟩ := PReal.lt_iff_exists_add x₀_lt_x_max
    have sw_max_split := sw_max
    rw [addi] at sw_max_split
    rw [Swap.apply_same_val sw_max sw_max_split addi]

    have sw_max': Swap (SX.fee.constprod φ) (sw0.apply) a t0 t1 x₁ :=
      sw_max_split.bound_split2 bound

    rw [SX.fee.additive_gain φ sw0 sw_max' sw_max_split additive bound h_supply h_mints hφ o]
    rw [add_assoc, lt_add_iff_pos_right]

    have gain_ε_pos : A.gain a o (Swap.apply sw0) (Swap.apply sw_max') + ↑(SX.fee.εφ φ sw0 sw_max' hφ o h_supply h_mints) > 0 ↔ (x_max φ sw0 o h_equil hφ) < x₀/φ := by
      exact SX.fee.arbitrage.add_gain_εφ_pos φ sw0 sw_max sw_max' addi o h_equil

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
  (x_diff_x_max : x ≠ (x_max φ sw0 o h_equil hφ))
  (h_supply : s.mints.supply t0 t1 > 0)
  (h_mints : (s.mints.get a).get t0 t1 < s.mints.supply t0 t1):
    A.gain a o s (Swap.apply sw2) < A.gain a o s (Swap.apply sw_max) := by

    have x₀_lt_x_max : x₀ < (x_max φ sw0 o h_equil hφ) := by unfold x_max; simp [PReal.toReal_pos]
    have bound: SX.outputbound (SX.fee.constprod φ) := SX.fee.constprod.outputbound φ
    have additive: SX.fee.extended_additivity φ (SX.fee.constprod φ) := SX.fee.constprod.extended_additivity φ

    -- Rewrite Gain(x_max) as the sum
    have ⟨x_max', x_max_split⟩ := PReal.lt_iff_exists_add x₀_lt_x_max
    have sw_max_split := sw_max
    rw [x_max_split] at sw_max_split
    rw [Swap.apply_same_val sw_max sw_max_split x_max_split]

    have sw_max': Swap (SX.fee.constprod φ) (sw0.apply) a t0 t1 x_max' :=
      sw_max_split.bound_split2 bound

    rw [SX.fee.additive_gain φ sw0 sw_max' sw_max_split additive bound h_supply h_mints hφ o]

    -- Rewrite Gain(x) as the sum
    have ⟨x₁, x_split⟩ := PReal.lt_iff_exists_add x_gt_x₀
    have sw2_split := sw2
    rw [x_split] at sw2_split
    rw [Swap.apply_same_val sw2 sw2_split x_split]

    have sw2': Swap (SX.fee.constprod φ) (sw0.apply) a t0 t1 x₁ :=
      sw2_split.bound_split2 bound

    rw [SX.fee.additive_gain φ sw0 sw2' sw2_split additive bound h_supply h_mints hφ o]

    -- Split values are different
    have x₁_diff_x_max' : x₁ ≠ x_max' := by aesop

    -- Delete Gain(x₀)
    rw [add_assoc, add_assoc]
    apply add_lt_add_left

    -- Rewriting the gain ε sum
    unfold SX.fee.εφ
    simp only [PReal.mul_toReal, PReal.sub_toReal, PReal.add_toReal, gt_iff_lt]
    rw [Swap.self_gain_eq, Swap.self_gain_eq, Swap.fee.frac_gain_Rpos_toReal s h_supply h_mints]
    rw [Swap.mints sw0, ←right_distrib, ←right_distrib, ←Swap.fee.frac_gain_Rpos_toReal s h_supply h_mints]
    rw [mul_lt_mul_right (PReal.toReal_pos _)]
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
    set A : ℝ := (↑r0 + ↑φ * ↑x₀) with ha
    have Dmax_pos : (0:ℝ) < (A + ↑φ * ↑x_max') * A := by
      rw [ha]
      repeat rw [←PReal.mul_toReal, ←PReal.add_toReal]
      rw [←PReal.mul_toReal]
      exact PReal.toReal_pos _

    have Dx_pos : (0:ℝ) < (A + ↑φ * ↑x₁) * A := by
      rw [ha]
      repeat rw [←PReal.mul_toReal, ←PReal.add_toReal]
      rw [←PReal.mul_toReal]
      exact PReal.toReal_pos _

    -- Xmax equality condition
    have x_max'_eq_def : x_max' = (SX.fee.constprod.x_max' φ sw0 o h_equil hφ) := by
      unfold x_max at x_max_split
      simp at x_max_split
      simp
      exact x_max_split.symm
    have x_max_eq_cond : (↑(o t0) : ℝ).sqrt * (A + ↑φ*↑x_max') = ((↑(o t1) : ℝ) * ↑φ * ↑r0 * ↑r1).sqrt := by
      rw [ha, hr0, hr1, x_max'_eq_def]
      exact SX.fee.constprod.x_max'_eq_cond φ sw0 o h_equil hφ
    have x_max_eq_sq : ((↑(o t0) : ℝ).sqrt * (A + ↑φ*↑x_max'))^2 = (((↑(o t1) : ℝ) * ↑φ * ↑r0 * ↑r1).sqrt)^2 := by rw [x_max_eq_cond]
    have hpos : (0 : ℝ) < ↑(o t1) * ↑φ * ↑r0 * ↑r1 := by
      rw [←PReal.mul_toReal, ←PReal.mul_toReal, ←PReal.mul_toReal]
      exact PReal.toReal_pos _
    rw [mul_pow, Real.sq_sqrt (le_of_lt (PReal.toReal_pos _)), Real.sq_sqrt (le_of_lt hpos)] at x_max_eq_sq


    rw [mul_div, mul_div, div_sub' (ne_of_gt Dx_pos), div_sub' (ne_of_gt Dmax_pos)]
    set Nmax : ℝ := (↑(o t1) * (↑φ * ↑r0 * ↑r1 * ↑x_max') - (A + ↑φ * ↑x_max') * A * (↑x_max' * ↑(o t0))) with hNmax
    set Nx : ℝ := (↑(o t1) * (↑φ * ↑r0 * ↑r1 * ↑x₁) - (A + ↑φ * ↑x₁) * A * (↑x₁ * ↑(o t0))) with hNx

    rw [div_lt_div_iff₀ Dx_pos Dmax_pos]
    rw [←sub_pos]
    rw [←mul_assoc, ←mul_assoc, ←sub_mul]
    conv =>
      rhs; enter [1];

      -- Group p1 terms
      rw [hNx, hNmax]
      rw [sub_mul, sub_mul]
      rw [←sub_add, sub_sub, add_comm _ ((↑(o t1) * _) * _ : ℝ), ←sub_sub]
      rw [mul_assoc ((o t1) : ℝ), mul_assoc ((o t1) : ℝ), ←mul_sub]
      rw [mul_assoc (↑φ * ↑r0 * ↑r1 : ℝ), mul_assoc (↑φ * ↑r0 * ↑r1 : ℝ), ←mul_sub, ←mul_assoc, ←mul_assoc, ←mul_assoc, ]
      conv in _ * _ =>
        enter [2]
        rw [left_distrib, left_distrib (x₁ : ℝ)]
        rw [←sub_sub, add_sub_comm', add_sub_assoc]
        rw [mul_comm (φ : ℝ), ←mul_assoc, mul_comm _ (x₁: ℝ), mul_comm (φ : ℝ), ←mul_assoc, sub_self, add_zero]
        rw [←sub_mul, mul_comm]

      -- Group p0 terms
      conv in (A + ↑φ * ↑x_max') * A * (↑x_max' * ↑(o t0)) =>
        rw [mul_assoc _ A, mul_comm (↑x_max' : ℝ), mul_comm (A + ↑φ * ↑x_max'), ←mul_assoc A]
      conv in (A + ↑φ * ↑x₁) * A * (↑x₁ * ↑(o t0)) * (A + ↑φ * ↑x_max') =>
        rw [mul_assoc _ A, mul_comm (↑x₁ : ℝ), mul_comm (A + ↑φ * ↑x₁), ←mul_assoc A]
      rw [sub_add, mul_assoc (A * ↑(o t0)), mul_assoc (A * ↑(o t0)), mul_assoc (A * ↑(o t0)), mul_assoc (A * ↑(o t0))]
      rw [←mul_sub]
      rw [mul_assoc (↑x_max' : ℝ), mul_comm (A + ↑φ * ↑x_max'),mul_assoc (↑x₁ : ℝ), ←sub_mul]
      rw [mul_comm (↑x_max' - ↑x₁ : ℝ), ←mul_assoc, ←mul_assoc]

      -- Finish term
      rw [←sub_mul]
      rw [mul_assoc A, mul_comm A, ←sub_mul, ←mul_assoc]

    -- Rewrite with xmax equality condition and simplify
    rw [mul_assoc _ A, mul_assoc, mul_assoc A, mul_comm _ A, ←mul_assoc A, ←sq, mul_comm]
    rw [←x_max_eq_sq, sq (A + _), ←mul_assoc]
    rw [mul_assoc _ (A + ↑φ * ↑x₁), mul_comm (A + ↑φ * ↑x₁), ←mul_assoc _ _ (A + ↑φ * ↑x₁)]
    rw [←mul_sub, ←sub_sub, add_comm A, ←add_sub, sub_self, add_zero, ←mul_sub]
    rw [mul_comm _ (↑φ * (↑x_max' - ↑x₁) : ℝ), mul_comm (↑φ : ℝ), ←mul_assoc, ←mul_assoc, ←mul_assoc]
    rw [mul_assoc (A ^ 2), ←sq]

    have A_pos : 0 < A := by
      rw [ha, ←PReal.mul_toReal, ←PReal.add_toReal]
      exact PReal.toReal_pos _

    apply mul_pos
    . apply mul_pos
      . apply mul_pos
        . apply mul_pos
          . simp [A_pos]
          . simp at x₁_diff_x_max'
            rw [(PReal.eq_iff_toReal_eq _ _).symm] at x₁_diff_x_max'
            rw [←ne_eq] at x₁_diff_x_max'
            rw [sq_pos_iff]
            rw [sub_ne_zero]
            simp at x₁_diff_x_max'
            aesop
        . exact PReal.toReal_pos _
      . exact PReal.toReal_pos _
    . apply add_pos
      . rw [←PReal.mul_toReal]
        exact PReal.toReal_pos _
      . exact A_pos


theorem SX.fee.constprod.x_max_gain
  (sw0: Swap (SX.fee.constprod φ) s a t0 t1 x₀)
  (o : O)
  (h_equil: SX.fee.constprod.sw_to_equil φ sw0 o)
  (hφ : φ < 1)
  (sw_max : Swap (SX.fee.constprod φ) s a t0 t1 (x_max φ sw0 o h_equil hφ)):
  ∀ (x: ℝ>0) (sw2: Swap (SX.fee.constprod φ) s a t0 t1 x),
    x ≠ (x_max φ sw0 o h_equil hφ) → s.mints.supply t0 t1 > 0 → (s.mints.get a).get t0 t1 < s.mints.supply t0 t1 → a.gain o s sw2.apply <  a.gain o s sw_max.apply := by

    intros x sw2 h_diff h_supply h_mints
    have gain_x₀_lt_x_max: A.gain a o s (Swap.apply sw0) < A.gain a o s (Swap.apply sw_max) := SX.fee.constprod.gain_xmax_gt_x₀ φ sw0 o h_equil hφ sw_max h_supply h_mints

    rcases lt_or_gt_of_ne h_diff with _|hx_gt
    -- Case x < x_max
    . rcases Decidable.em (x < x₀) with le|nle
      -- Case x < x₀
      . have hsol := SX.fee.arbitrage.constprod.solution_less φ sw0 o hφ h_equil
        unfold arbitrage.is_solution_less at hsol
        have gain_x_lt_x₀ := hsol x sw2 le h_supply h_mints
        exact lt_trans gain_x_lt_x₀ gain_x₀_lt_x_max
      -- Case x ≥ x₀
      . simp only [not_lt] at nle
        rcases lt_or_eq_of_le nle with lt_x₀_x|eq_x₀_x
        -- Case x > x₀
        . exact SX.fee.constprod.x_max_gain_gt_x_gt_equil φ sw0 sw2 o h_equil hφ sw_max lt_x₀_x h_diff h_supply h_mints
        -- Case x = x₀
        . rw [Swap.apply_same_val sw2 sw0 eq_x₀_x.symm]
          exact gain_x₀_lt_x_max

    -- Case x > x_max
    . have x₀_lt_x_max : x₀ < (x_max φ sw0 o h_equil hφ) := by unfold x_max; simp [PReal.toReal_pos]
      have x_gt_x₀ : x > x₀ := lt_trans x₀_lt_x_max hx_gt
      exact SX.fee.constprod.x_max_gain_gt_x_gt_equil φ sw0 sw2 o h_equil hφ sw_max x_gt_x₀ h_diff h_supply h_mints

theorem SX.fee.constprod.x_max_unique
  (sw0: Swap (SX.fee.constprod φ) s a t0 t1 x₀)
  (o : O)
  (h_equil: SX.fee.constprod.sw_to_equil φ sw0 o)
  (h_supply : s.mints.supply t0 t1 > 0)
  (h_mints : (s.mints.get a).get t0 t1 < s.mints.supply t0 t1)
  (hφ : φ < 1)
  (sw_max : Swap (SX.fee.constprod φ) s a t0 t1 (x_max φ sw0 o h_equil hφ)):
    ¬ ∃ (x₁ : ℝ>0) (h_enough : ↑x₁ ≤ (S₀.get s.atoms a) t0), x₁ ≠ (x_max φ sw0 o h_equil hφ) ∧
      (∀ (x: ℝ>0) (sw2: Swap (SX.fee.constprod φ) s a t0 t1 x),
        x ≠ x₁ → s.mints.supply t0 t1 > 0 → (s.mints.get a).get t0 t1 < s.mints.supply t0 t1 → a.gain o s sw2.apply <  a.gain o s (Swap.constprod.mkSwap φ s a t0 t1 x₁ sw0.exi h_enough).apply) := by

  intro h
  obtain ⟨x₁, ⟨h_enough, ⟨h_diff, h_max_gain'⟩⟩⟩ := h
  set sw1 := Swap.constprod.mkSwap φ s a t0 t1 x₁ sw0.exi h_enough

  have h_max_gain := SX.fee.constprod.x_max_gain φ sw0 o h_equil hφ sw_max

  rcases Decidable.em (x₁ ≠ (x_max φ sw0 o h_equil hφ)) with ne | eq
  . have h_contr₁ := h_max_gain' (x_max φ sw0 o h_equil hφ) sw_max ne.symm h_supply h_mints
    have h_contr₂ := h_max_gain x₁ sw1 ne h_supply h_mints
    exact lt_asymm h_contr₁ h_contr₂

  . aesop
