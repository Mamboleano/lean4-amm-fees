import AMMLib.Transaction.Swap.Rate
import AMMLib.Transaction.Swap.Additive
import AMMLib.Transaction.Swap.Reversible
import HelpersLib.PReal.Sqrt
import HelpersLib.PReal.Order

set_option maxHeartbeats 2000000

variable {sx : SX} {s : Γ} {a : A} {t0 t1 : T} {v0 x₀ x₁ x x': ℝ>0}

noncomputable def SX.constprod: SX :=
  λ (x r0 r1: ℝ>0) => r1/(r0 + x)

theorem SX.constprod.outputbound: SX.outputbound SX.constprod := by
  unfold SX.outputbound
  intro x r0 r1
  unfold constprod
  rw [div_eq_mul_inv, ← mul_assoc, mul_inv_lt_iff_lt_mul]
  rw [left_distrib, mul_comm x r1]
  exact PReal.lt_add_left _ _

theorem SX.constprod.reversible:
  SX.reversible SX.constprod SX.constprod.outputbound := by
  unfold SX.reversible constprod
  intro x r0 r1
  rw [PReal.sub_y_add_y]
  rw [one_div, inv_div, add_comm]

theorem SX.constprod.homogeneous:
  homogeneous constprod := by
  unfold SX.homogeneous
  intro a x r0 r1
  unfold constprod
  rw [← left_distrib, div_eq_mul_inv, inv_mul']
  rw [div_eq_mul_inv, mul_assoc, ← mul_assoc r1 _]
  rw [mul_comm r1, ← mul_assoc, ← mul_assoc a]
  simp [div_eq_mul_inv]

theorem SX.constprod.strictmono:
  strictmono constprod := by
  unfold SX.strictmono
  intro x r0 r1 x' r0' r1'
  intro ⟨a,b,c⟩
  unfold constprod
  have h': r0'+x' ≤ r0+x := add_le_add b a
  if h: x' < x ∨ r0' < r0 ∨ r1 < r1'
  then
    simp only [h, ite_true]
    rw [div_lt_div_iff']
    rcases c.lt_or_eq with c'|c'
    <;> (
    rcases h with a|b|c
    . have h': r0'+x' < r0+x := add_lt_add_of_le_of_lt b a
      simp [Right.mul_lt_mul, c', h']
    . have h': r0'+x' < r0+x := add_lt_add_of_lt_of_le b a
      simp [Right.mul_lt_mul, c', h']
    . rcases h'.lt_or_eq with h'|h'
      <;> simp [c, h', Right.mul_lt_mul]
    )
  else
    simp only [h, div_le_iff_le_mul, ite_false, ge_iff_le]
    refine mul_inv_le_iff_le_mul.mp ?_
    rw [← div_eq_mul_inv, div_le_div_iff']
    exact mul_le_mul' c h'

syntax "nuclear" : tactic
macro_rules
  | `(tactic| nuclear) => `(tactic| (ring_nf; try field_simp; try ring_nf))

theorem SX.constprod.additive: SX.additive SX.constprod := by
  unfold SX.additive SX.constprod
  intro x y r0 r1 h
  have : (x: ℝ) > 0 := by aesop
  have : (y: ℝ) > 0 := by aesop
  have : (r0: ℝ) > 0 := by aesop
  have : (r1: ℝ) > 0 := by aesop

  nuclear

theorem SX.constprod.exchrate_vs_oracle
  (x r0 r1 p0 p1: ℝ>0)
  (h: p0/p1 ≤ constprod x r0 r1):
  ∀ (y: ℝ>0), constprod y r1 r0 < p1/p0 := by
  intro y
  unfold constprod at h ⊢

  rw [← inv_div p1 p0] at h
  rw [← inv_div (r0+x) r1] at h
  simp only [inv_le_inv_iff] at h
  rw [PReal.add_div'' r0 x r1] at h

  simp only [← gt_iff_lt]
  calc
    p1/p0 ≥ r0/r1 + x/r1 := ge_iff_le.mpr h
    _     > r0/r1        := PReal.gt_add_right _ _
    _     > r0/(r1+y)    := PReal.div_lt_add_denum _ _ _

theorem SX.constprod.gain_direction
  (sw1: Swap SX.constprod s a t0 t1 x)
  (sw2: Swap SX.constprod s a t1 t0 x') (o: O)
  (hzero: (s.mints.get a).get t0 t1 = 0)
  (hgain: 0 < a.gain o s sw1.apply):
  a.gain o s sw2.apply < 0 :=
  by
  have hzero': (s.mints.get a).get t1 t0 = 0 :=
               by rw [W₁.get_reorder _ t1 t0]; exact hzero

  -- First modus ponens
  -- ammrate(t1,t0) < extrate(t1,t0) → sw2gain < 0
  apply (Swap.swaprate_vs_exchrate_lt sw2 o hzero').mpr

  -- Second modus ponens
  -- extrate(t0,t1) ≤ ammrate(t0,t1)
  -- →
  -- ammrate(t1,t0) < extrate(t1,t0)
  apply exchrate_vs_oracle x
  rw [AMMs.r0_reorder s.amms t1 t0,
      AMMs.r1_reorder s.amms t1 t0]
  exact le_of_lt
        ((Swap.swaprate_vs_exchrate_gt sw1 o hzero).mp hgain)

theorem SX.constprod.optimality_suff
  (sw1: Swap SX.constprod s a t0 t1 x₀)
  (o: O)
  (h: sw1.apply.amms.r1 t0 t1 (by simp[sw1.exi]) / sw1.apply.amms.r0 t0 t1 (by simp[sw1.exi]) = (o t0) / (o t1)):
  sw1.is_solution o := by
  unfold Swap.is_solution
  intro x sw2 hdif hzero

  have addi: SX.additive SX.constprod := SX.constprod.additive
  have bound: SX.outputbound SX.constprod := SX.constprod.outputbound
  have rev: SX.reversible SX.constprod bound := SX.constprod.reversible

  rcases Decidable.em (x₀ < x) with le|nle
  . have ⟨x₁, prop₁⟩ := PReal.lt_iff_exists_add le
    have sw2' := sw2
    rw [prop₁] at sw2'
    rw [Swap.apply_same_val sw2 sw2' prop₁]

    have sw3: Swap SX.constprod sw1.apply a t0 t1 x₁ :=
      sw2'.bound_split2 bound

    rw [Swap.additive_gain sw1 sw3 sw2' addi o]

    have sw3_rate_lt_exch: sw3.rate < o t0 / o t1 := by
      simp [Swap.rate, SX.constprod, ← h]
      aesop

    have sw3_gain_neg : a.gain o sw1.apply sw3.apply < 0 := by
      exact (Swap.swaprate_vs_exchrate_lt sw3 o hzero).mpr sw3_rate_lt_exch

    nlinarith

    -- simp only [(Swap.swaprate_vs_exchrate_lt sw3 o hzero).mpr sw3_rate_lt_exch]

  . have le: x ≤ x₀ := not_lt.mp nle
    have lt: x < x₀ := hdif.symm.lt_of_le' le
    have ⟨x₁, prop₁⟩ := PReal.lt_iff_exists_add lt
    have sw1' := sw1
    rw [prop₁] at sw1'
    rw [Swap.apply_same_val sw1 sw1' prop₁]
    have sw3: Swap SX.constprod sw2.apply a t0 t1 x₁ :=
      sw1'.bound_split2 bound
    rw [Swap.additive_gain sw2 sw3 sw1' addi o]
    rw [← Swap.rev_gain sw3 rev o]

    have sw3_invrate_lt: (sw3.inv rev).rate < o t1 / o t0 := by
      rw [Swap.rate_of_inv_eq_inv_rate]
      rw [inv_lt', inv_div]
      rw [← h]
      unfold Swap.rate
      unfold SX.constprod
      simp only [Swap.amms, AMMs.r1_of_add_r0, AMMs.r1_of_sub_r1,
                 AMMs.r0_of_add_r0, AMMs.r0_of_sub_r1,
                 Swap.y, prop₁, Swap.rate]

      -- same denumerator
      rw [add_assoc, add_comm x₁ _, ← add_assoc x _ _]
      rw [div_lt_div_iff_right]

      -- remove r1
      rw [PReal.x_sub_y_lt_x_sub_z_iff]

      rw [mul_div, mul_div]
      rw [div_lt_div_iff']

      -- distributivity
      simp_rw [right_distrib]
      simp_rw [left_distrib]
      rw [add_assoc]
      rw [add_lt_add_iff_left]
      rw [add_lt_add_iff_left]
      rw [add_comm]
      rw [mul_comm _ x₁, mul_comm x _, ← mul_assoc]
      exact PReal.lt_add_right _ _

      all_goals sorry

    have hzero'': (sw2.apply.mints.get a).get t0 t1 = 0 := by
      simp [hzero]

    have hzero': (sw3.apply.mints.get a).get t1 t0 = 0 := by
      rw [W₁.get_reorder _ t1 t0]
      simp [sw3, hzero'', hzero]

    have sw3_inv_gain_neg :=
      (Swap.swaprate_vs_exchrate_lt (sw3.inv rev) o hzero').mpr sw3_invrate_lt

    exact lt_add_of_pos_right _ (neg_pos.mpr sw3_inv_gain_neg)


theorem SX.constprod.arbitrage_solve
  (sw: Swap SX.constprod s a t0 t1 x₀)
  (o: O)
  (less: s.amms.r0 t0 t1 (by simp[sw.exi]) < ((o t1)*(o t0)⁻¹*(s.amms.r0 t0 t1 (by simp[sw.exi]))*(s.amms.r1 t0 t1 (by simp[sw.exi]))).sqrt)
  (h: x₀ = ((o t1)*(o t0)⁻¹*(s.amms.r0 t0 t1 (by simp[sw.exi]))*(s.amms.r1 t0 t1 (by simp[sw.exi]))).sqrt.sub (s.amms.r0 t0 t1 (by simp[sw.exi])) less):
  sw.is_solution o := by

  have aligned: sw.apply.amms.r1 t0 t1 (by simp[sw.exi]) / sw.apply.amms.r0 t0 t1 (by simp[sw.exi]) = (o t0) / (o t1) := by
    simp [Swap.y, Swap.rate, constprod, h]
    simp_rw [sub_mul] -- right distrib step
    simp_rw [div_eq_mul_inv]

    have rad0 : (√(↑(o t1) * (↑(o t0))⁻¹ * ↑(s.amms.r0 t0 t1 (by simp[sw.exi])) * ↑(s.amms.r1 t0 t1 (by simp[sw.exi]))) : ℝ) ≠ 0 := by
      apply ne_of_gt
      rw [← PReal.inv_toReal, ← PReal.mul_toReal, ← PReal.mul_toReal, ← PReal.mul_toReal, ← PReal.sqrt_to_real]
      simp [PReal.toReal_pos]
    simp_rw [mul_comm (s.amms.r1 t0 t1 sw.exi : ℝ) _, ← mul_assoc _ _ (s.amms.r1 t0 t1 sw.exi : ℝ), GroupWithZero.mul_inv_cancel (√(↑(o t1) * (↑(o t0))⁻¹ * ↑(s.amms.r0 t0 t1 (by simp[sw.exi])) * ↑(s.amms.r1 t0 t1 (by simp[sw.exi]))) : ℝ) rad0, one_mul] -- simp x/x
    field_simp
    nuclear
    simp
    have : 0 ≤ (↑(s.amms.r0 t0 t1 (by simp[sw.exi])) * ↑(s.amms.r1 t0 t1 (by simp[sw.exi])) * ↑(o t1) * (↑(o t0))⁻¹: ℝ) := by
      rw [← PReal.mul_toReal, ← PReal.inv_toReal, ← PReal.mul_toReal, ← PReal.mul_toReal]
      apply LT.lt.le
      simp [PReal.toReal_pos]

    rw [Real.sq_sqrt this]
    rw [mul_inv, mul_inv, mul_inv]
    simp
    clear * -
    have sar0pos : (s.amms.r0 t0 t1 (by simp[sw.exi]) : ℝ) ≠ 0 := by apply ne_of_gt; simp [PReal.toReal_pos]
    have sar1pos : (s.amms.r1 t0 t1 (by simp[sw.exi]) : ℝ) ≠ 0 := by apply ne_of_gt; simp [PReal.toReal_pos]
    calc (↑(s.amms.r0 t0 t1 (by simp[sw.exi])) : ℝ) * ↑(s.amms.r1 t0 t1 (by simp[sw.exi])) * ((↑(s.amms.r0 t0 t1 (by simp[sw.exi])))⁻¹ * (↑(s.amms.r1 t0 t1 (by simp[sw.exi])))⁻¹ * (↑(o t1))⁻¹ * ↑(o t0))
    _ = ((↑(s.amms.r0 t0 t1 (by simp[sw.exi])) : ℝ) * ((↑(s.amms.r0 t0 t1 (by simp[sw.exi])))⁻¹) * (↑(s.amms.r1 t0 t1 (by simp[sw.exi])) * (↑(s.amms.r1 t0 t1 (by simp[sw.exi])))⁻¹) * (↑(o t1))⁻¹ * ↑(o t0)) := by nuclear
    _ = (↑(s.amms.r1 t0 t1 (by simp[sw.exi])) * (↑(s.amms.r1 t0 t1 (by simp[sw.exi])))⁻¹) * (↑(o t1))⁻¹ * ↑(o t0) := by simp [GroupWithZero.mul_inv_cancel _ sar0pos]
    _ = (↑(o t1))⁻¹ * ↑(o t0) := by simp [GroupWithZero.mul_inv_cancel _ sar1pos]
    _ = (↑(o t0) : ℝ) * (↑(o t1) : ℝ)⁻¹ := by ring_nf


  exact optimality_suff sw o aligned
