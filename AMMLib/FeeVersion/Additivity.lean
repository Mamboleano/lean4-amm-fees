import AMMLib.FeeVersion.Basic
import HelpersLib.PReal.Division
import HelpersLib.PReal.Negative

variable (φ : ℝ>0)

noncomputable def SX.fee.z (x y r0: ℝ>0) : ℝ>0 :=
  (x + y) * (r0 + φ * x) * (r0 + x + φ * y) /
    ((r0 + φ * x + φ * y) * (x^2 + r0 * x + φ * x * y + r0 * y))

noncomputable def SX.fee.z_extended (x y r0 r1: ℝ>0) : ℝ>0 :=

  (r0 + x + φ*y) * ((φ*r1*x) * (r0 + φ*x + φ*y) + (φ*r0*r1*y)) /
    ((r0 + φ*x + φ*y) * ((φ*r1*x) * (r0 + x + φ*y) + (φ*r0*r1*y)))

theorem SX.fee.z_toReal
  (x y r0: ℝ>0):
  (↑(z φ x y r0) : ℝ) =
    (↑x + ↑y) * (↑r0 + ↑φ * ↑x) * (↑r0 + ↑x + ↑φ * ↑y) /
    ((↑r0 + ↑φ * ↑x + ↑φ * ↑y) * (↑x^2 + ↑r0 * ↑x + ↑φ * ↑x * ↑y + ↑r0 * ↑y)) := by
    unfold z
    rw [PReal.div_toReal]
    repeat rw [PReal.mul_toReal]
    repeat rw [PReal.add_toReal]
    repeat rw [PReal.mul_toReal]
    rw [PReal.sq_toReal]

theorem SX.fee.z_eq_z_extended :
  ∀ (x y r0 r1: ℝ>0),
  z φ x y r0 = z_extended φ x y r0 r1 := by

  unfold z z_extended
  intro x y r0 r1

  conv =>
    rhs
    rw [mul_add (φ*r1*x) _ , mul_add (φ*r1*x) _ ]
    rw [mul_add (φ*r1*x) _, mul_add (φ*r1*x) _]
    rw [← left_distrib]
    rw [mul_assoc φ r0 r1, mul_comm r0 r1, ← mul_assoc φ r1 r0]
    rw [mul_assoc _ r0 y, mul_comm r0 y, ← mul_assoc _ y r0]

    conv in φ * r1 * x * (φ * y) =>
      rw [mul_comm φ y, ← mul_assoc]
      rw [mul_assoc _ x y, mul_comm x y, ← mul_assoc]

    rw [add_assoc _ _ (φ * r1 * y * r0)]
    rw [mul_assoc (φ*r1*y)]
    rw [← left_distrib (φ*r1*y)]

    rw [add_comm (x*φ), mul_comm x φ]
    rw [mul_assoc _ _ (r0 + φ*x), mul_assoc _ _ (r0 + φ*x)]
    rw [← left_distrib (φ*r1)]
    rw [← right_distrib]
    rw [← mul_assoc, mul_comm _ (φ * r1), mul_assoc]

    conv =>
      enter [2]
      rw [mul_assoc, mul_assoc (φ*r1), mul_assoc (φ*r1), mul_assoc (φ*r1)]
      rw [←left_distrib, ←left_distrib, ←left_distrib]
      rw [mul_comm x r0, ← mul_assoc x φ y, mul_comm x φ, mul_comm y r0]
      rw [← sq]
      rw [← mul_assoc, mul_comm _ (φ * r1), mul_assoc]

    rw [PReal.div_common_fact_cancel]
    rw [← mul_assoc _ (x + y), mul_comm _ (x + y), mul_assoc, mul_comm _ (r0 + φ*x), ← mul_assoc]
    rw [add_comm _ (x^2)]


def SX.fee.extended_additivity (sx : SX) : Prop :=
  ∀ (x y r0 r1: ℝ>0) (ho : SX.outputbound sx),

  sx (x+y) r0 r1 =
    ((x*(sx x r0 r1) + y*(sx y (r0+x) (r1.sub (x*(sx x r0 r1)) (by aesop)))) / (x + y)) * (z φ x y r0)

theorem SX.fee.z_factor_gt_1 (hφ : φ < 1):
  z φ x y r0 > 1 := by

  unfold z
  simp

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

noncomputable def Swap.fee.εφ  (sw0: Swap sx s a t0 t1 x₀) (sw1: Swap sx sw0.apply a t0 t1 x₁) (hφ : φ < 1) (o: T → ℝ>0) : ℝ>0 :=
  let r0 := AMMs.r0 s.amms t0 t1 sw0.exi;

  (o t1) * ((SX.fee.z φ x₀ x₁ r0).sub 1 (by exact SX.fee.z_factor_gt_1 φ hφ)) * (sw0.y + sw1.y)

noncomputable def Swap.fee.εφ_toReal (sw0: Swap sx s a t0 t1 x₀) (sw1: Swap sx sw0.apply a t0 t1 x₁)
  (hφ : φ < 1) (hr0 : r0 = AMMs.r0 s.amms t0 t1 (sw0.exi)) (hr1 : r1 = AMMs.r1 s.amms t0 t1 (sw0.exi))
  (hα : α = sx x₀ r0 r1) (o: T → ℝ>0) :
  (↑(εφ φ sw0 sw1 hφ o) : ℝ) =
    ↑(o t1) * (↑(SX.fee.z φ x₀ x₁ r0) - 1) * (↑x₀ * ↑α + ↑(y sw1)) := by

      rw [hr0, hα, hr1]
      unfold εφ
      simp [Swap.y]
      aesop

theorem sub_eq_iff_add_eq (a b c : ℝ) (h:  a - b = c) : a = b + c := by
  nlinarith!

theorem Swap.fee.additive_gain
  (sw0: Swap sx s a t0 t1 x₀)
  (sw1: Swap sx sw0.apply a t0 t1 x₁)
  (sw2: Swap sx s a t0 t1 (x₀+x₁))
  (addi: SX.fee.extended_additivity φ sx)
  (out_b: SX.outputbound sx)
  (no_mint : (s.mints.get a).get t0 t1 = 0)
  (hφ : φ < 1)
  (o: T → ℝ>0):
  a.gain o s sw2.apply = (a.gain o s sw0.apply) + (a.gain o sw0.apply sw1.apply) + ↑(εφ φ sw0 sw1 hφ o) := by

    unfold SX.fee.extended_additivity at addi
    rw [add_assoc]
    apply sub_eq_iff_add_eq (A.gain a o s (apply sw2))

    conv =>
      lhs;
      rw [Swap.fee.self_gain_no_mint_eq sw2 no_mint, Swap.fee.self_gain_no_mint_eq sw0 no_mint]
      rw [sub_sub_eq_add_sub]
      rw [sub_eq_add_neg, sub_eq_add_neg]
      rw [add_comm, add_assoc, ←add_assoc,  ←add_assoc]
      rw [add_comm _ (↑(y sw2) * ↑(o t1) : ℝ), ←sub_eq_add_neg _ (↑(y sw0) * ↑(o t1) : ℝ)]
      rw [←sub_mul]
      rw [add_assoc, add_comm _ (↑x₀ * ↑(o t0) : ℝ), ←sub_eq_add_neg, ←sub_mul]
      rw [PReal.add_toReal, sub_add_eq_sub_sub, sub_self, zero_sub, neg_mul, ←sub_eq_add_neg]
      unfold y rate

    set r0 := AMMs.r0 s.amms t0 t1 (_ : AMMs.init s.amms t0 t1) with hr0
    set r1 := AMMs.r1 s.amms t0 t1 (_ : AMMs.init s.amms t0 t1) with hr1



    conv =>
      lhs;
      rw [addi x₀ x₁ r0 r1 out_b]

    set α := sx x₀ r0 r1 with hα
    repeat conv in sx x₀ r0 r1 =>
        rw [←hα]
    set β := sx x₁ (r0 + x₀) (PReal.sub r1 (x₀ * sx x₀ r0 r1) (_ : x₀ * sx x₀ r0 r1 < r1)) with hβ

    conv =>
      lhs;
      rw [mul_comm _ (SX.fee.z φ x₀ x₁ r0), ←mul_div_assoc, mul_div_cancel]
      rw [left_distrib, sub_mul, PReal.add_toReal, right_distrib]
      rw [←sub_add_cancel ((↑(SX.fee.z φ x₀ x₁ r0 * (x₀ * α)) * ↑(o t1) + ↑(SX.fee.z φ x₀ x₁ r0 * (x₁ * β)) * ↑(o t1) - ↑(x₀ * α) * ↑(o t1) - ↑x₁ * ↑(o t0)): ℝ) ((x₁ * β) * ↑(o t1) : ℝ)]

      repeat rw [sub_eq_add_neg]
      repeat rw [add_assoc]
      rw [add_comm _ (↑x₁ * ↑β * ↑(o t1) : ℝ), ←add_assoc _ (↑x₁ * ↑β * ↑(o t1): ℝ), add_comm _ (↑x₁ * ↑β * ↑(o t1) : ℝ), ← sub_eq_add_neg _ (↑x₁ * ↑(o t0) : ℝ)]

    have hh : β = Swap.rate sw1 := by
        unfold rate
        rw [hβ]
        rw [Swap.r0_after_swap φ, Swap.r1_after_swap φ]

    conv =>
      lhs;
      rw [hh]
      rw [← PReal.mul_toReal x₁, ←Swap.y, ←Swap.fee.self_gain_no_mint_eq sw1 no_mint _]
      rw [add_comm (A.gain _ _ _ _)]
      repeat rw [←add_assoc, add_neg_add_eq_add_sub, add_neg_add_eq_add_sub]
      rw [←right_distrib, ←sub_mul, ←sub_mul]
      conv in (↑(SX.fee.z φ x₀ x₁ r0 * (x₀ * α)) : ℝ) =>
        rw [PReal.mul_toReal]
      conv in (↑(SX.fee.z φ x₀ x₁ r0 * y sw1) : ℝ) =>
        rw [PReal.mul_toReal]
      repeat conv in (↑(x₀ * α) : ℝ) =>
        rw [PReal.mul_toReal]
      rw [← left_distrib (↑(SX.fee.z φ x₀ x₁ r0) : ℝ)]
      rw [add_sub_sub_eq_sub_add, mul_comm (↑(SX.fee.z φ x₀ x₁ r0): ℝ) _, ←mul_sub_one, mul_comm, mul_comm ((↑x₀ * ↑α + ↑(y sw1)) : ℝ), ←mul_assoc]

    rw [add_comm, εφ_toReal φ sw0 sw1 hφ hr0 hr1 hα]
