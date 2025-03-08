import AMMLib.Transaction.Swap.Rate
import AMMLib.Transaction.Swap.Additive
import AMMLib.Transaction.Swap.Reversible
import HelpersLib.PReal.Sqrt
import HelpersLib.PReal.Order

structure PRate where
  val : ℝ>0
  less : val ≤ 1

variable (φ : PRate)


noncomputable def SX.fee_rate: SX :=
  λ (x r0 r1: ℝ>0) => (φ.val * r1)/(r0 + (φ.val * x))

def SX.fee_rate.outputbound: SX.outputbound (SX.fee_rate φ) := by
  unfold SX.outputbound
  intro x r0 r1
  unfold fee_rate
  rw [div_eq_mul_inv, ← mul_assoc, mul_inv_lt_iff_lt_mul]
  rw [left_distrib, mul_comm r1 (φ.val * x)]
  rw [mul_comm φ.val x, mul_assoc]
  exact PReal.lt_add_left _ _

theorem SX.constprod.homogeneous:
  homogeneous (fee_rate φ) := by
  unfold homogeneous
  intro a x r0 r1
  unfold fee_rate
  rw [← mul_assoc, mul_comm φ.val a, mul_assoc]
  rw [← mul_assoc φ.val a x, mul_comm φ.val a, mul_assoc]
  rw [← left_distrib, div_eq_mul_inv, inv_mul', div_eq_mul_inv]
  rw [← mul_assoc, mul_assoc a (φ.val * r1) a⁻¹, mul_comm (φ.val*r1) a⁻¹, ← mul_assoc]
  rw [mul_inv_self, one_mul]
  rw [← div_eq_mul_inv]


theorem SX.fee_rate.strictmono:
  strictmono (fee_rate φ) := by
  unfold strictmono
  intro x r0 r1 x' r0' r1'
  intro ⟨a,b,c⟩
  have a' : φ.val * x' ≤ φ.val * x := by simp [mul_le_mul, a]
  have c' : φ.val * r1 ≤ φ.val * r1' := by simp [mul_le_mul, c]
  unfold fee_rate
  have h': r0'+(φ.val * x') ≤ r0+(φ.val * x) := add_le_add b a'
  if h: x' < x ∨ r0' < r0 ∨ r1 < r1'
  then
    simp only [h, ite_true]
    rw [div_lt_div_iff']
    rcases h with hh | hh | hh
    .
      have aa : (φ.val * x') < (φ.val * x) := by simp [Right.mul_lt_mul, a', hh]
      have h'': (φ.val * x' + r0') < (φ.val * x + r0) := by exact add_lt_add_of_lt_of_le aa b

      rw [add_comm, add_comm (φ.val * x)] at h''
      rw [mul_comm, mul_comm (φ.val * r1')]

      exact mul_lt_mul_of_lt_of_le h'' c'
    .
      have h'': (r0' + φ.val * x') < (r0 + φ.val * x) := by exact add_lt_add_of_lt_of_le hh a'

      rw [mul_comm, mul_comm (φ.val * r1')]
      exact mul_lt_mul_of_lt_of_le h'' c'
    .
      have c'' : φ.val * r1 < φ.val * r1' := by
        rw [mul_comm, mul_comm  (φ.val) r1']
        simp [mul_lt_mul, hh]

      exact mul_lt_mul_of_lt_of_le c'' h'

  else
    simp only [h, div_le_iff_le_mul, ite_false, ge_iff_le]
    refine mul_inv_le_iff_le_mul.mp ?_
    rw [← div_eq_mul_inv, div_le_div_iff']
    exact mul_le_mul' c' h'
