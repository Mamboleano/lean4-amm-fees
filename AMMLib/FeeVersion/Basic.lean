import Lean
import Lean.Meta
import Lean.Elab
import AMMLib.Transaction.Swap.Rate
import AMMLib.Transaction.Swap.Additive
import AMMLib.Transaction.Swap.Reversible
import HelpersLib.PReal.Sqrt
import HelpersLib.PReal.Order
import HelpersLib.PReal.Subtraction
import HelpersLib.PReal.Division


variable (φ : ℝ>0)

open Lean Elab Tactic Meta
open Lean Elab Tactic


elab "custom_have " n:ident " : " t:term " := " v:term : tactic =>
  withMainContext do
    let t ← elabTerm t none
    let v ← elabTermEnsuringType v t
    liftMetaTactic fun mvarId => do
      let mvarIdNew ← mvarId.assert n.getId t v
      let (_, mvarIdNew) ← mvarIdNew.intro1P
      return [mvarIdNew]

elab "custom_let " n:ident " : " t:term " := " v:term : tactic =>
  withMainContext do
    let t ← elabTerm t none
    let v ← elabTermEnsuringType v t
    liftMetaTactic fun mvarId => do
      let mvarIdNew ← mvarId.define n.getId t v
      let (_, mvarIdNew) ← mvarIdNew.intro1P
      return [mvarIdNew]

elab "set_and_subst_reserves" amms:ident t0:ident t1:ident proof:ident : tactic =>
  withMainContext do
    let r0_id := mkIdent `r0
    let r1_id := mkIdent `r1
    let hr0_id := mkIdent `hr0
    let hr1_id := mkIdent `hr1

    evalTactic (← `(tactic| custom_let $r0_id : (ℝ>0) := AMMs.r0 $amms $t0 $t1 $proof))
    evalTactic (← `(tactic| custom_let $r1_id : (ℝ>0) := AMMs.r1 $amms $t0 $t1 $proof))
    evalTactic (← `(tactic| have $hr0_id : $r0_id = AMMs.r0 $amms $t0 $t1 $proof := by rfl))
    evalTactic (← `(tactic| have $hr1_id : $r1_id = AMMs.r1 $amms $t0 $t1 $proof := by rfl))
--
    evalTactic (← `(tactic| repeat conv in (AMMs.r0 $amms $t0 $t1 (_ : AMMs.init $amms $t0 $t1)) =>
                                    rw [←$hr0_id]))
    evalTactic (← `(tactic| repeat conv in (AMMs.r1 $amms $t0 $t1 (_ : AMMs.init $amms $t0 $t1)) =>
                                    rw [←$hr1_id]))

elab "set_and_subst_α_β" sw0:ident sw1:ident : tactic =>
  withMainContext do
    let α_id := mkIdent `α
    let β_id := mkIdent `β
    let hα_id := mkIdent `hα
    let hβ_id := mkIdent `hβ

    evalTactic (← `(tactic| custom_let $α_id : (ℝ>0) := Swap.rate $sw0))
    evalTactic (← `(tactic| custom_let $β_id : (ℝ>0) := Swap.rate $sw1))
    evalTactic (← `(tactic| have $hα_id : $α_id = Swap.rate $sw0 := by rfl))
    evalTactic (← `(tactic| have $hβ_id : $β_id = Swap.rate $sw1 := by rfl))

    evalTactic (← `(tactic| repeat conv in (Swap.rate $sw0) =>
                                    rw [←$hα_id]))
    evalTactic (← `(tactic| repeat conv in (Swap.rate $sw1) =>
                                    rw [←$hβ_id]))



elab "set_reserves" amms:ident t0:ident t1:ident proof:ident : tactic =>
  withMainContext do
    -- Create the expression for r0 using the given identifiers
    -- Define the type of r0 (assuming it's ℝ>0, or something similar)
    let r0_type ← elabTerm (← `((ℝ>0))) none
    let r0_expr ← elabTermEnsuringType (← `((AMMs.r0 $amms $t0 $t1 $proof))) r0_type

    -- Create the expression for r1 in a similar manner
    -- Define the type of r1 (again assuming ℝ>0, or similar)
    let r1_type ← elabTerm (← `((ℝ>0))) none
    let r1_expr ← elabTermEnsuringType (← `((AMMs.r1 $amms $t0 $t1 $proof))) r1_type

    -- Now define r0 in the context
    liftMetaTactic fun mvarId => do
      -- This is where we correctly use `MVarId.define` to define r0 with its type
      let mvarId' ← mvarId.define `r0 r0_type r0_expr
      let (_, mvarId') ← mvarId'.intro1P

      return [mvarId']

    -- Define r1 in the context
    liftMetaTactic fun mvarId => do
      -- Similarly, define r1 with its type
      let mvarId' ← mvarId.define `r1 r1_type r1_expr
      let (_, mvarId') ← mvarId'.intro1P
      return [mvarId']

elab "set_reserves_with_eqs" amms:ident t0:ident t1:ident proof:ident : tactic =>
  withMainContext do
    -- Step 1: Execute `set_reserves` to introduce `r0` and `r1`
    evalTactic (← `(tactic| set_reserves $amms $t0 $t1 $proof))

    -- Step 2: Retrieve `r0` and `r1` from the context
    let r0_id := mkIdent `r0
    let r1_id := mkIdent `r1
    let hr0_id := mkIdent `hr0
    let hr1_id := mkIdent `hr1

    -- Step 3: Add `have hr0 : r0 = ... := by rfl`
    evalTactic (← `(tactic| have $hr0_id : $r0_id = AMMs.r0 $amms $t0 $t1 (_ : AMMs.init $amms $t0 $t1) := by rfl))

    -- Step 4: Add `have hr1 : r1 = ... := by rfl`
    evalTactic (← `(tactic| have $hr1_id : $r1_id = AMMs.r1 $amms $t0 $t1 (_ : AMMs.init $amms $t0 $t1) := by rfl))


elab "subst_reserves" amms:ident t0:ident t1:ident : tactic =>
  withMainContext do
    let hr0_id := mkIdent `hr0
    let hr1_id := mkIdent `hr1

    evalTactic (← `(tactic| repeat conv in (AMMs.r0 $amms $t0 $t1 (_ : AMMs.init $amms $t0 $t1)) =>
                                    rw [←$hr0_id]))
    evalTactic (← `(tactic| repeat conv in (AMMs.r1 $amms $t0 $t1 (_ : AMMs.init $amms $t0 $t1)) =>
                                    rw [←$hr1_id]))

open NNReal

theorem SX.fee.valid_sw_y_lt_r1 (sw: Swap sx s a t0 t1 x) :
  (sw.y: ℝ≥0) ≤ ((s.amms.r1 t0 t1 sw.exi): ℝ≥0) := by
    rw [(PReal.toNNReal_le_toNNReal_iff _ _).symm]
    simp [Swap.y, Swap.rate, le_of_lt sw.nodrain]

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

  simp [expandprice, sw.exi, sw.exi.dif, sw.exi.dif.symm,
        sw.enough, NNReal.coe_sub (SX.fee.valid_sw_y_lt_r1 sw), le_of_lt sw.y_lt_r1₀]

  ring_nf
  . rw [Γ.mintedprice_reorder]
  . rw [Γ.mintedprice_reorder]
  . exact sw.exi.dif

theorem Swap.fee.self_gain_no_mint_eq (sw: Swap sx s a t0 t1 x) (no_mint: (s.mints.get a).get t0 t1 = 0) (o: O) :
  (a.gain o s sw.apply) = (sw.y*(o t1) - x*(o t0)) := by

    rw [self_gain_eq]
    simp [no_mint]


theorem SX.fee.same_wall_diff_act (sw: Swap sx s a t0 t1 x) (_ : O) (h_dif : a ≠ b):
  (s.atoms.get b)
  =
  (sw.apply).atoms.get b
:= by
  unfold Swap.apply
  ring_nf
  rw [S₀.get_add_diffa, S₀.get_sub_diffa]
  . exact h_dif
  . exact h_dif

theorem SX.fee.swap_apply_amm_exi (sw: Swap sx s a t0 t1 x):
  AMMs.init (sw.apply).amms t0 t1 := by
    unfold Swap.apply
    simp_all
    exact sw.exi

theorem Swap.r0_after_swap (sw: Swap sx s a t0 t1 x):
  (AMMs.r0 (apply sw).amms t0 t1 (SX.fee.swap_apply_amm_exi _)) =
    (AMMs.r0 s.amms t0 t1 (sw.exi)) + x := by
    simp
    rw [add_comm]

theorem Swap.r1_after_swap (sw: Swap sx s a t0 t1 x) :
    (AMMs.r1 (apply sw).amms t0 t1 (SX.fee.swap_apply_amm_exi _)) =
      (AMMs.r1 s.amms t0 t1 (sw.exi)).sub  (x * (sx x (AMMs.r0 s.amms t0 t1 (sw.exi)) (AMMs.r1 s.amms t0 t1 (sw.exi)))) (sw.nodrain):= by
    simp [y, rate]


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

  rw [SX.fee.same_wall_diff_act sw o]
  simp
  . rw [W₁.worth_destruct _ (sw.apply.mintedprice o) t0 t1 sw.exi.dif]
    rw [W₁.worth_destruct _ (s.mintedprice o) t0 t1 sw.exi.dif]
    simp
    have s'_exi : AMMs.init (sw.apply).amms t0 t1 := by exact SX.fee.swap_apply_amm_exi sw
    rw [expandprice sw.apply o t0 t1 s'_exi]
    rw [expandprice s o t0 t1 sw.exi]
    simp
    have h' : ↑(Swap.y sw) ≤ AMMs.r1₀ s.amms t0 t1 :=  by exact SX.fee.valid_sw_y_lt_r1 sw
    rw [NNReal.coe_sub h']
    ring_nf!
    all_goals simp [Γ.mintedprice_reorder]

  . exact h_dif

theorem SX.fee.swaprate_vs_exchrate
  (sw: Swap sx s a t0 t1 x) (o: O)
  (hzero: (s.mints.get a).get t0 t1 = 0):
  cmp (a.gain o s sw.apply) 0 = cmp sw.rate ((o t0) / (o t1)) := by

  simp [Swap.self_gain_eq, hzero, Swap.y]
  rw [mul_assoc]
  rw [cmp_mul_pos_left x.toReal_pos (sw.rate*(o t1)) (o t0)]
  rw [div_eq_mul_inv (o t0 : ℝ) (o t1)]
  rw [← cmp_mul_pos_right
          (inv_pos_of_pos (o t1).toReal_pos)
          (sw.rate*(o t1)) (o t0)]
  rw [mul_inv_cancel_right₀ (o t1).toReal_ne_zero sw.rate]

theorem SX.fee.swaprate_vs_exchrate_lt
(sw: Swap sx s a t0 t1 v0) (o: O)
(hzero: (s.mints.get a).get t0 t1 = 0):
(a.gain o s sw.apply) < 0
↔
sw.rate <  (o t0) / (o t1)
:= by
  rw [← cmp_eq_lt_iff, ← cmp_eq_lt_iff]
  rw [Swap.swaprate_vs_exchrate sw o hzero]

theorem SX.fee.swaprate_vs_exchrate_gt
(sw: Swap sx s a t0 t1 v0) (o: O)
(hzero: (s.mints.get a).get t0 t1 = 0):
0 < (a.gain o s sw.apply)
↔
(o t0) / (o t1) < sw.rate
:= by
  rw [← cmp_eq_gt_iff, ← cmp_eq_gt_iff]
  rw [Swap.swaprate_vs_exchrate sw o hzero]
