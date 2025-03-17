import AMMLib.Transaction.Swap.Rate
import AMMLib.Transaction.Swap.Additive
import AMMLib.Transaction.Swap.Reversible
import HelpersLib.PReal.Sqrt
import HelpersLib.PReal.Order
import HelpersLib.PReal.Subtraction
import HelpersLib.PReal.Division

variable (φ : ℝ>0)

open NNReal

theorem SX.fee.valid_sw_y_lt_r1 (sw: Swap sx s a t0 t1 x) :
  (sw.y: ℝ≥0) ≤ ((s.amms.r1 t0 t1 sw.exi): ℝ≥0) := by
    rw [PReal.toNNReal_le_toNNReal_iff]
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
  . exact sw.exi.dif
  . rw [Γ.mintedprice_reorder]

theorem SX.fee.same_wall_diff_act (sw: Swap sx s a t0 t1 x) (o: O) (h_dif : a ≠ b):
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
    simp

    all_goals simp [Γ.mintedprice_reorder]

  . exact h_dif

theorem SX.fee.swaprate_vs_exchrate
  (sw: Swap sx s a t0 t1 x) (o: O)
  (hzero: (s.mints.get a).get t0 t1 = 0):
  cmp (a.gain o s sw.apply) 0 = cmp sw.rate ((o t0) / (o t1)) := by

  simp [Swap.self_gain_eq, hzero, Swap.y]
  rw [mul_assoc]
  rw [cmp_mul_pos_left x.toReal_pos (sw.rate*(o t1)) (o t0)]
  rw [div_eq_mul_inv (o t0) (o t1)]
  rw [← cmp_mul_pos_right
          (inv_pos_of_pos (o t1).toReal_pos)
          (sw.rate*(o t1)) (o t0)]
  rw [mul_inv_cancel_right₀ (o t1).toReal_ne_zero sw.rate]
  exact PReal.toReal_cmp sw.rate ((o t0)*(o t1)⁻¹)

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
