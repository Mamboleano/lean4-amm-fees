import AMMLib.Transaction.Swap.Rate
import AMMLib.Transaction.Swap.Additive
import AMMLib.Transaction.Swap.Reversible
import HelpersLib.PReal.Sqrt
import HelpersLib.PReal.Order
open NNReal

structure PRate where
  val : ℝ>0
  less : val ≤ 1

variable (φ : PRate)

variable {sx : SX} {s : Γ} {a b: A} {t0 t1 : T} {v0 x: ℝ>0} {hbound: sx.outputbound}

noncomputable def SX.fee_rate: SX :=
  λ (x r0 r1: ℝ>0) => (φ.val * r1)/(r0 + (φ.val * x))

theorem SwapFee.self_gain_eq (sw: Swap sx s a t0 t1 x) (o: O) :
  (a.gain o s sw.apply)
  =
  (sw.y*(o t1) - x*(o t0))
  * (1 - ((s.mints.get a).get t0 t1)/(s.mints.supply t0 t1))

:= by
  unfold A.gain
  unfold Γ.networth

  rw [W₀.worth_destruct _ o t0]
  rw [W₀.worth_destruct _ o t1]
  rw [W₀.worth_destruct (s.atoms.get a) o t0]
  rw [W₀.worth_destruct ((s.atoms.get a).drain t0) o t1]

  rw [Swap.atoms_drain_drain_worth]
  rw [W₁.worth_destruct _ (sw.apply.mintedprice o) t0 t1 _]
  rw [W₁.worth_destruct _ (s.mintedprice o) t0 t1 _]

  have h': (sw.y: ℝ≥0) ≤ ((s.amms.r1 t0 t1 sw.exi): ℝ≥0) := by
    rw [← PReal.toNNReal_le_toNNReal_iff]
    simp [Swap.y, Swap.rate, le_of_lt sw.nodrain]

  simp [expandprice, sw.exi, sw.exi.dif, sw.exi.dif.symm,
        sw.enough, NNReal.coe_sub h', le_of_lt sw.y_lt_r1₀]

  ring_nf
  . rw [Γ.mintedprice_reorder]
  . rw [Γ.mintedprice_reorder]
  . exact sw.exi.dif

theorem SwapFee.same_wall_diff_act (sw: Swap sx s a t0 t1 x) (o: O) (h_dif : a ≠ b):
  (s.atoms.get b)
  =
  (sw.apply).atoms.get b
:= by
  unfold Swap.apply
  ring_nf
  rw [S₀.get_add_diffa, S₀.get_sub_diffa]
  . exact h_dif
  . exact h_dif

--We need to prove something for the external actor (the wallet stays the same)

theorem SwapFee.ext_gain_eq (sw: Swap sx s a t0 t1 x) (o: O) (h_dif : a ≠ b):
  (b.gain o s sw.apply)
  =
  ((s.mints.get b).get t0 t1) * (x * (o t0) - sw.y * (o t1))
    /(s.mints.supply t0 t1)

:= by
  unfold A.gain
  unfold Γ.networth

  rw [W₀.worth_destruct _ o t0]
  rw [W₀.worth_destruct _ o t1]
  rw [W₀.worth_destruct (s.atoms.get b) o t0]
  rw [W₀.worth_destruct ((s.atoms.get b).drain t0) o t1]

  rw [SwapFee.same_wall_diff_act sw o]
  simp
  . rw [W₁.worth_destruct _ (sw.apply.mintedprice o) t0 t1 sw.exi.dif]
    rw [W₁.worth_destruct _ (s.mintedprice o) t0 t1 sw.exi.dif]
    simp
    rw [expandprice sw.apply o t0 t1 _ , expandprice s o t0 t1]
    simp[sw.exi]
    rw [NNReal.coe_sub]
    simp
    ring_nf
    . sorry
    . exact sw.exi
    . simp [sw.exi]
    . simp [Γ.mintedprice_reorder]
    . simp [Γ.mintedprice_reorder]

  . exact h_dif

syntax "nuclear" : tactic
macro_rules
  | `(tactic| nuclear) => `(tactic| (ring_nf; try field_simp; try ring_nf))

theorem SX.fee_rate.outputbound: SX.outputbound (SX.fee_rate φ) := by
  unfold SX.outputbound
  intro x r0 r1
  unfold fee_rate
  have : (x: ℝ) > 0 := sorry
  have : (r0: ℝ) > 0 := sorry
  have : (r1: ℝ) > 0 := sorry
  have : (φ.val: ℝ) > 0 := sorry
  rw [PReal.toReal_lt_toReal_iff]
  nuclear
  simp
  -- positivity
  ring_nf
  ring_nf!
  /-rw [mul_inv_lt_iff_lt_mul]
  nlinarith
  rw [div_eq_mul_inv, ← mul_assoc, mul_inv_lt_iff_lt_mul]
  rw [left_distrib, mul_comm r1 (φ.val * x)]
  rw [mul_comm φ.val x, mul_assoc]
  exact PReal.lt_add_left _ _ -/
  sorry

theorem SX.fee_rate.constprod.homogeneous:
  homogeneous (fee_rate φ) := by
  unfold SX.homogeneous
  intro a x r0 r1
  unfold fee_rate
  rw [← mul_assoc, mul_comm φ.val a, mul_assoc]
  rw [← mul_assoc φ.val a x, mul_comm φ.val a, mul_assoc]
  rw [← left_distrib, div_eq_mul_inv, inv_mul', div_eq_mul_inv]
  rw [← mul_assoc, mul_assoc a (φ.val * r1) a⁻¹, mul_comm (φ.val*r1) a⁻¹, ← mul_assoc]
  rw [mul_inv_cancel, one_mul]
  rw [← div_eq_mul_inv]


theorem SX.fee_rate.strictmono:
  strictmono (fee_rate φ) := by
  unfold SX.strictmono
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
