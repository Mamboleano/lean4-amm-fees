import AMMLib.FeeVersion.Swap.Basic
import HelpersLib.PReal.Division

variable (φ : ℝ>0)

noncomputable def SX.fee.z (sw1: Swap sx s a t0 t1 x) (_ : Swap sx (sw1.apply) a t0 t1 y) : ℝ>0 :=

  let r0 : ℝ>0 := (AMMs.r0 s.amms t0 t1 sw1.exi)

  (x + y) * (r0 + φ * x) * (r0 + x + φ * y) /
    ((r0 + φ * x + φ * y) * (x^2 + r0 * x + φ * x * y + r0 * y))

noncomputable def SX.fee.z_extended (sw1: Swap sx s a t0 t1 x) (_ : Swap sx (sw1.apply) a t0 t1 y) : ℝ>0 :=

  let r0 : ℝ>0 := (AMMs.r0 s.amms t0 t1 sw1.exi);
  let r1 : ℝ>0 := (AMMs.r1 s.amms t0 t1 sw1.exi);

  (r0 + x + φ*y) * ((φ*r1*x) * (r0 + φ*x + φ*y) + (φ*r0*r1*y)) /
    ((r0 + φ*x + φ*y) * ((φ*r1*x) * (r0 + x + φ*y) + (φ*r0*r1*y)))


theorem SX.fee.z_eq_z_extended (sw1: Swap sx s a t0 t1 x) (sw2: Swap sx (sw1.apply) a t0 t1 y) :
  z φ sw1 sw2 = z_extended φ sw1 sw2 := by

  unfold z z_extended

  conv =>
    rhs; ext; ext;
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


def SX.fee.extended_additivity (sx : SX) (sw1: Swap sx s a t0 t1 x) (sw2: Swap sx (sw1.apply) a t0 t1 y) : Prop :=

  let r0 : ℝ>0 := (AMMs.r0 s.amms t0 t1 sw1.exi);
  let r1 : ℝ>0 := (AMMs.r1 s.amms t0 t1 sw1.exi);

  sx (x+y) r0 r1 =
    ((x*(sx x r0 r1) + y*(sx y (r0+x) (r1.sub (x*(sx x r0 r1)) (sw1.nodrain)))) / (x + y)) * (z φ sw1 sw2)
