import AMMLib.FeeVersion.Swap.Basic
import HelpersLib.PReal.Division

variable (φ : ℝ>0)

noncomputable def SX.fee.z (x y r0: ℝ>0) : ℝ>0 :=
  (x + y) * (r0 + φ * x) * (r0 + x + φ * y) /
    ((r0 + φ * x + φ * y) * (x^2 + r0 * x + φ * x * y + r0 * y))

noncomputable def SX.fee.z_extended (x y r0 r1: ℝ>0) : ℝ>0 :=

  (r0 + x + φ*y) * ((φ*r1*x) * (r0 + φ*x + φ*y) + (φ*r0*r1*y)) /
    ((r0 + φ*x + φ*y) * ((φ*r1*x) * (r0 + x + φ*y) + (φ*r0*r1*y)))


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
