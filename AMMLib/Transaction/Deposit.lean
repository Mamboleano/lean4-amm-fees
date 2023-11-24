import AMMLib.State.AMMSet
import AMMLib.State.State
import AMMLib.State.Supply

structure Deposit0 (s: Γ) (t0 t1: T) (a: A) (v0 v1: ℝ+) where
  -- Tokens must be different to form a valid minted token
  hdif: t0 ≠ t1

  -- AMM does not exist in s
  hnin: ¬s.amms.init t0 t1

  -- User has enough balance of t0 and t1
  hen0: v0 ≤ s.atoms.get a t0
  hen1: v1 ≤ s.atoms.get a t1

noncomputable def Deposit0.apply
{s: Γ} (v: Deposit0 s t0 t1 a v0 v1): Γ :=
  ⟨
  -- Subtract v0:t0 and v1:t1 from a's atomic wallet
  (s.atoms.sub a t0 v0 v.hen0
  ).sub a t1 v1 (by simp[v.hen1, v.hdif]),

  -- Add v0:{t0,t1} t0 a's minted wallet
  s.mints.add a t0 t1 v.hdif v0,

  -- Initialize an AMM {v0:t0, v1:t1}
  s.amms.initialize v.hdif v0 v1
  ⟩

@[simp] theorem Deposit0.supply_minted_diff
{s: Γ} (v: Deposit0 s t0 t1 a r0 r1)
(t0' t1': T) (hdifp: diffmint t0 t1 t0' t1'):
v.apply.mintsupply t0' t1' = s.mintsupply t0' t1' := by
  simp [apply, Γ.mintsupply, hdifp]

@[simp] theorem Deposit0.init_diff_iff
  {s: Γ} (v: Deposit0 s t0 t1 a r0 r1) (t0' t1': T) (hdifp: diffmint t0 t1 t0' t1'):
  v.apply.amms.init t0' t1' ↔ s.amms.init t0' t1'
  :=
  by simp [apply, hdifp]

/-
Deposit gain v = v0 * (mintedsupp)/r0

v0 = v * rx0 = v0 * mintedsupp/r0 * r0/mintedsupp = v0 ok
v1 = v * rx1 = v0 * mintedsupp/r0 * r1/mintedsupp = v0*r1/r0
-/
structure Deposit (s: Γ) (a: A) (t0 t1: T) (v0: ℝ+) where
  -- {r0:t0, r1:t1} exists in state s
  exi: s.amms.init t0 t1

  -- Minted token is in circulation
  -- (follows from exi in reachable states)
  possupp: 0 < s.mints.supply t0 t1
  hen0: v0 ≤ s.atoms.get a t0
  hen1: v0*(s.amms.r0 t0 t1 exi)/(s.mints.supply t0 t1) ≤ s.atoms.get a t1

-- The deposited amount v1:t1
noncomputable def Deposit.v1 (d: Deposit s a t0 t1 v0): PReal :=
  v0*(s.amms.r0 t0 t1 d.exi)
  /
  ((s.mints.supply t0 t1).toPReal d.possupp)

-- User's reward of minted tokens
noncomputable def Deposit.v (d: Deposit s a t0 t1 v0): PReal :=
  v0*((s.mints.supply t0 t1).toPReal d.possupp)
  /
  (s.amms.r0 t0 t1 d.exi)

noncomputable def Deposit.apply (d: Deposit s a t0 t1 v0): Γ :=
  ⟨
    -- Subtract v0:t0 and v1:t1 from a's atomic wallet
    (s.atoms.sub a t0 v0 d.hen0
    ).sub a t1 d.v1 (by simp [d.exi.dif]; exact d.hen1),

    -- Add the AMM shares v:{t0,t1}
    s.mints.add a t0 t1 d.exi.dif d.v,

    -- Add v0:t0 and v1:t1 to the AMM's shares
    (s.amms.add_r0 t0 t1 d.exi v0
    ).add_r1 t0 t1 (by simp[d.exi]) d.v1
  ⟩

@[simp] theorem Deposit.atoms (d: Deposit s a t0 t1 v0):
  d.apply.atoms = (s.atoms.sub a t0 v0 d.hen0
    ).sub a t1 d.v1 (by simp [d.exi.dif]; exact d.hen1) := by simp [apply]

@[simp] theorem Deposit.mints (d: Deposit s a t0 t1 v0):
  d.apply.mints = s.mints.add a t0 t1 d.exi.dif d.v := by simp [apply]

@[simp] theorem Deposit.amms (d: Deposit s a t0 t1 v0):
  d.apply.amms = (s.amms.add_r0 t0 t1 d.exi v0).add_r1 t0 t1 (by simp[d.exi]) d.v1
  := by simp [apply]
