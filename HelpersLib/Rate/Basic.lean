import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.NNReal
import Mathlib.Algebra.Order.Positive.Field
import Mathlib.Algebra.Order.Positive.Ring
import HelpersLib.Preal.Basic

/- This code is mostly copied and adapted from NNReal. -/

abbrev Rate := {r : ℝ>0 // r ≤ 1}

-- Definitions of coercions
@[coe] def toPReal : Rate → ℝ>0 := Subtype.val
instance : Coe Rate ℝ>0 := ⟨toPReal⟩
