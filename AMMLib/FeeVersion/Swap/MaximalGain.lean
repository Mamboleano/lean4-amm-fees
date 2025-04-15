import Mathlib.Analysis.Convex.Basic
import Mathlib.Analysis.Convex.Extrema
import Mathlib.Analysis.Convex.Mul
import Mathlib.Analysis.Convex.Function
import Mathlib.Analysis.Calculus.MeanValue
import Mathlib.Analysis.Calculus.Deriv.Inv
import Mathlib.Analysis.Calculus.Deriv.Mul
import Mathlib.Analysis.Calculus.Deriv.Pow
import Mathlib.Analysis.Calculus.FDeriv.Mul
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Analysis.Complex.CauchyIntegral
import Mathlib.Topology.Instances.Real
import Mathlib.Data.Real.Basic

import AMMLib.FeeVersion.Swap.Basic
import AMMLib.FeeVersion.Swap.Additivity
import AMMLib.FeeVersion.Swap.Constprod
import HelpersLib.Real.Division
import HelpersLib.Real.Order
import HelpersLib.Real.Subtraction
import HelpersLib.PReal.Division
import HelpersLib.PReal.Negative

open Set

variable (r₀ r₁ x₀ p₀ p₁ φ: ℝ>0)

noncomputable def f (x₁ : ℝ) : ℝ :=
  ↑p₁ * (↑φ*↑r₁*↑x₀) / (↑r₀ + ↑φ*↑x₀) - x₁*(↑p₀ : ℝ) + (↑p₁ * ↑φ * ↑r₀ * ↑r₁ * x₁) / ((↑r₀ + ↑φ*↑x₀) * (↑r₀ + ↑φ*↑x₀ + ↑φ*x₁))

lemma has_deriv_prova (x : ℝ) :
  HasDerivAt (fun x₁ => (↑p₁ : ℝ) * ↑φ * ↑r₀ * ↑r₁ * x₁ / ((↑r₀ + ↑φ * ↑x₀) * (↑r₀ + ↑φ * ↑x₀ + ↑φ * x₁)))
    ((↑p₁ : ℝ) * ↑φ * ↑r₀ * ↑r₁ / (↑r₀ + ↑φ * ↑x₀ + ↑φ * x)^2) x := by

  let A : ℝ := ↑r₀ + ↑φ * ↑x₀
  have h₁ : HasDerivAt (fun x₁ => (↑p₁ : ℝ) * ↑φ * ↑r₀ * ↑r₁ * x₁) (↑p₁ * ↑φ * ↑r₀ * ↑r₁) x := by
    simpa using (hasDerivAt_id x).const_mul ((↑p₁ : ℝ) * ↑φ * ↑r₀ * ↑r₁)

  have h₂ : HasDerivAt (fun x₁ => A * (A + ↑φ * x₁)) (A * ↑φ) x := by
    sorry
  simp at h₂
  have hh : (↑r₀ + ↑φ * ↑x₀) * (↑r₀ + ↑φ * ↑x₀ + ↑φ * x) ≠ 0 := by
    repeat rw [←PReal.mul_toReal, ←PReal.add_toReal]
    have : ↑(r₀ + φ * x₀) + ↑φ * x > 0 := by
      exact add_pos (PReal.toReal_pos _ ) (by sorry)
    have : ↑(r₀ + φ * x₀) * (↑(r₀ + φ * x₀) + ↑φ * x) > 0 := by sorry
    aesop
  have := h₁.div h₂ hh

  have deriv_eq : ((↑p₁ * ↑φ * ↑r₀ * ↑r₁ * ((↑r₀ + ↑φ * ↑x₀) * (↑r₀ + ↑φ * ↑x₀ + ↑φ * x)) - ↑p₁ * ↑φ * ↑r₀ * ↑r₁ * x * ((↑r₀ + ↑φ * ↑x₀) * ↑φ)) / ((↑r₀ + ↑φ * ↑x₀) * (↑r₀ + ↑φ * ↑x₀ + ↑φ * x)) ^ 2) = (↑p₁ * ↑φ * ↑r₀ * ↑r₁ / (↑r₀ + ↑φ * ↑x₀ + ↑φ * x) ^ 2) := by

    rw [mul_assoc _ x _]
    rw [←mul_sub _ _]
    conv in _ - _ =>
      ring_nf!
      rw [←mul_pow, mul_comm, ←mul_assoc, ←mul_assoc, add_comm _ (↑r₀ ^ 2 : ℝ)]
      rw [mul_assoc]
      rw [←add_sq]
    rw [mul_pow, mul_comm]
    rw [mul_div_mul_left]

    have : ↑r₀ + ↑φ * ↑x₀ > (0 : ℝ) := by
      rw [←PReal.mul_toReal, ←PReal.add_toReal]
      exact PReal.toReal_pos _
    aesop
  aesop


lemma concave_gain : ConcaveOn NNReal (Ioi (0 : NNReal)) (fun (x₁ : NNReal) => f r₀ r₁ x₀ p₀ p₁ φ x₁) := by
  unfold f
  apply ConcaveOn.add
  . apply ConcaveOn.sub
    . exact concaveOn_const _ (convex_Ioi _)
    . apply @ConvexOn.mul NNReal (Ioi (0 : NNReal)) _ _
      . exact convexOn_id (convex_Ioi _)
      . exact convexOn_const _ (convex_Ioi _)
      . simp
        intros
        nlinarith
      . simp
        intros
        exact le_of_lt (PReal.toReal_pos _)
      . unfold MonovaryOn
        simp
  . apply concaveOn_of_deriv2_nonpos
    . exact convex_Ioi _
    . apply ContinuousOn.div
      . apply ContinuousOn.mul
        . exact continuousOn_const
        . exact continuousOn_id
      . apply ContinuousOn.mul
        . exact continuousOn_const
        . apply ContinuousOn.add
          . exact continuousOn_const
          . exact ContinuousOn.mul (continuousOn_const) (continuousOn_id)
      . intros x hx
        simp at hx
        have h1 : ((↑r₀ + ↑φ * ↑x₀) : ℝ) > (0 : ℝ) := by
          rw [←PReal.mul_toReal, ←PReal.add_toReal]
          exact PReal.toReal_pos _
        have h2 : (↑r₀ + ↑φ * ↑x₀ + ↑φ * x) > (0 : ℝ) := by
          rw [←PReal.mul_toReal, ←PReal.add_toReal]
          have : ↑φ * x > 0  := mul_pos (PReal.toReal_pos _) hx
          exact add_pos (PReal.toReal_pos _) this
        have h3 := mul_pos h1 h2
        aesop
    . simp
      apply DifferentiableOn.div
      . apply DifferentiableOn.mul
        . exact differentiableOn_const _
        . exact differentiableOn_id
      . apply DifferentiableOn.mul
        . exact differentiableOn_const _
        . apply DifferentiableOn.add
          . exact differentiableOn_const _
          . exact DifferentiableOn.mul (differentiableOn_const _) (differentiableOn_id)
      . intros x hx
        simp at hx
        have h1 : ((↑r₀ + ↑φ * ↑x₀) : ℝ) > (0 : ℝ) := by
          rw [←PReal.mul_toReal, ←PReal.add_toReal]
          exact PReal.toReal_pos _
        have h2 : (↑r₀ + ↑φ * ↑x₀ + ↑φ * x) > (0 : ℝ) := by
          rw [←PReal.mul_toReal, ←PReal.add_toReal]
          have : ↑φ * x > 0  := mul_pos (PReal.toReal_pos _) hx
          exact add_pos (PReal.toReal_pos _) this
        have h3 := mul_pos h1 h2
        aesop
    . simp
      have hf' : deriv (fun x₁ => (↑p₁ : ℝ) * ↑φ * ↑r₀ * ↑r₁ * x₁ / ((↑r₀ + ↑φ * ↑x₀) * (↑r₀ + ↑φ * ↑x₀ + ↑φ * x₁))) =
                   (fun x₁ => (↑p₁ : ℝ) * ↑φ * ↑r₀ * ↑r₁ / (↑r₀ + ↑φ * ↑x₀ + ↑φ * x₁)^2) := by
        funext x
        have hhf' := has_deriv_prova r₀ r₁ x₀ p₀ p₁ φ
        exact (hhf' x).deriv
      simp [hf']
      apply DifferentiableOn.div
      . exact differentiableOn_const _
      . apply DifferentiableOn.pow
        apply DifferentiableOn.const_add
        exact DifferentiableOn.mul (differentiableOn_const _) (differentiableOn_id)
      . intros x hx
        simp at hx
        have hh : ↑r₀ + ↑φ * ↑x₀ + ↑φ * x > 0 := by
          rw [←PReal.mul_toReal, ←PReal.add_toReal]
          apply add_pos
          . exact PReal.toReal_pos _
          . aesop
        aesop
    . simp
      intros x hx
      sorry
