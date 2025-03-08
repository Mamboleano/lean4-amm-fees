import HelpersLib.PReal.Basic
open NNReal

open PReal

abbrev PRate := { r : ℝ>0 // r ≤ 1 }

namespace PRate

  -- Definitions of coercions
  @[coe] def toPReal : PRate → ℝ>0 := Subtype.val
  instance : Coe PRate ℝ>0 := ⟨toPReal⟩


  @[coe] def toNNReal : PRate → NNReal := λ x => ⟨Subtype.val x.val, le_of_lt x.val.2⟩
  instance : Coe PRate NNReal := ⟨toNNReal⟩

  -- Simp lemma to put back `n.val` into the normal form given by the coercion.
  @[simp]
  theorem val_eq_toNNReal (n : PRate) : n.val = n :=
    rfl

  theorem toReal_pos (x: PRate): (0:ℝ) < x := x.1.2

  theorem toReal_ne_zero (x: ℝ>0)
  : (x: ℝ) ≠ 0 := (ne_of_lt x.toReal_pos).symm

  @[simp] theorem toNNRealReal_eq_toNNReal (x: PRate): ((x: ℝ≥0): ℝ) = (x: ℝ) := by rfl

  @[simp] theorem toPRealPRate_eq_toPRate (x: PRate):
    ⟨(x: ℝ>0), x.2⟩ = (x: PRate) := by rfl

  theorem toNNReal_ne_zero (x: PRate): (x: ℝ≥0) ≠ 0 := by
    have h := x.val.property
    apply NNReal.ne_iff.mp
    rw [toNNRealReal_eq_toNNReal]
    exact ne_of_gt h

  theorem zero_lt_toNNReal (x: PRate): 0 < (x: ℝ≥0) :=
    by exact x.val.property


@[simp] lemma add_toReal (x y: PRate):
  (((x+y): PRate): ℝ) = (x:ℝ)+(y:ℝ) := by rfl

@[simp] lemma add_toNNReal (x y: PRate):
  (((x+y): ℝ>0): ℝ≥0) = (x:NNReal)+(y:NNReal) := by rfl

@[simp] lemma mul_toReal (x y: PRate):
  (((x*y): ℝ>0): ℝ)= (x:ℝ)*(y:ℝ) := by rfl

@[simp] lemma mul_toNNReal (x y: PRate):
  (((x*y): ℝ>0): ℝ≥0)= (x:NNReal)*(y:NNReal) := by rfl

@[simp] lemma div_toReal (x y: PRate):
  (((x/y): ℝ>0): ℝ)= (x:ℝ)/(y:ℝ) := by rfl

@[simp] lemma div_toNNReal (x y: PRate):
  (((x/y): ℝ>0): ℝ≥0)= (x:NNReal)/(y:NNReal) := by rfl
