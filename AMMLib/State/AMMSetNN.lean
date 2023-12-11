import AMMLib.State.AMMSet
open NNReal

def Sₐ.r0₀ (amms: Sₐ) (t0 t1: T): ℝ≥0 := amms.f t0 t1

def Sₐ.r1₀ (amms: Sₐ) (t0 t1: T): ℝ≥0 := amms.f t1 t0

@[simp] theorem Sₐ.r0_same₀ (amms: Sₐ) (t: T):
  amms.r0₀ t t = 0 := by simp [r0₀, amms.h2]

@[simp] theorem Sₐ.r1_same₀ (amms: Sₐ) (t: T):
  amms.r1₀ t t = 0 := by simp [r1₀, amms.h2]

@[simp] theorem Sₐ.r0_toNNReal (amms: Sₐ) (t0 t1: T) (hinit: amms.init t0 t1):
  amms.r0 t0 t1 hinit = amms.r0₀ t0 t1 := by simp [r0, r0₀]

@[simp] theorem Sₐ.r1_toNNReal (amms: Sₐ) (t0 t1: T) (hinit: amms.init t0 t1):
  amms.r1 t0 t1 hinit = amms.r1₀ t0 t1 := by simp [r1, r1₀]

theorem Sₐ.r0_reorder₀
  (amms: Sₐ) (t1 t0: T):
  amms.r0₀ t1 t0 = amms.r1₀ t0 t1 := by
  simp [r0₀, r1₀]

theorem Sₐ.r1_reorder₀
  (amms: Sₐ) (t1 t0: T):
  amms.r1₀ t1 t0 = amms.r0₀ t0 t1 := by
  simp [r0₀, r1₀]

@[simp] theorem Sₐ.r0_of_initialize₀
  (amms: Sₐ) {t0 t1: T} (hdif: t0 ≠ t1) (r0 r1: ℝ+):
  (amms.initialize hdif r0 r1).r0₀ t0 t1 = r0 := by
  simp [Sₐ.r0₀, Sₐ.initialize, hdif]

@[simp] theorem Sₐ.r1_of_initialize₀
  (amms: Sₐ) {t0 t1: T} (hdif: t0 ≠ t1) (r0 r1: ℝ+):
  (amms.initialize hdif r0 r1).r1₀ t0 t1 = r1 := by
  simp [Sₐ.r1₀, Sₐ.initialize, hdif]

@[simp] theorem Sₐ.r0_of_initialize_diffpair₀
  (amms: Sₐ) {t0 t1: T} (hdif: t0 ≠ t1) (r0 r1: ℝ+)
  (t0' t1': T) (difp: diffmint t0 t1 t0' t1'):
  (amms.initialize hdif r0 r1).r0₀ t0' t1' = amms.r0₀ t0' t1' := by

  rcases Decidable.em (t0'=t1') with eq|dif'
  . simp [eq]
  . have hdif' := Ne.intro dif'
    rcases difp with ⟨a,b⟩|⟨a,b⟩
    . rcases Decidable.em (t1=t1') with c|c
      . simp [Sₐ.r0₀, Sₐ.initialize, a.symm, c, hdif']
      . rcases Decidable.em (t0'=t1) with d|d
        . simp [Sₐ.r0₀, Sₐ.initialize, a.symm, b.symm, c, hdif', d]
        . simp [Sₐ.r0₀, Sₐ.initialize, a.symm, c, hdif', d]
    . rcases Decidable.em (t0=t1') with c|c
      . simp [Sₐ.r0₀, Sₐ.initialize, a.symm, c, hdif']
      . rcases Decidable.em (t0'=t0) with d|d
        . simp [Sₐ.r0₀, Sₐ.initialize, b.symm, d, hdif]
        . simp [Sₐ.r0₀, Sₐ.initialize, a.symm, c, hdif', d]

@[simp] theorem Sₐ.r1_of_initialize_diffpair₀
  (amms: Sₐ) {t0 t1: T} (hdif: t0 ≠ t1) (r0 r1: ℝ+)
  (t0' t1': T) (difp: diffmint t0 t1 t0' t1'):
  (amms.initialize hdif r0 r1).r1₀ t0' t1' = amms.r1₀ t0' t1' := by
  rw [r1_reorder₀ _ t0' t1']
  rw [r1_reorder₀ amms t0' t1']
  simp [(diffmint.iff_swap_inner_right t0 t1 t0' t1').mp difp]

@[simp] theorem Sₐ.r0_of_add_r0₀
  (amms: Sₐ) (t0 t1: T) (x: PReal)
  (h: amms.init t0 t1)
  :
  (amms.add_r0 t0 t1 h x).r0₀ t0 t1
  =
  x + amms.r0₀ t0 t1
  := by rw [add_comm]; simp [add_r0]

@[simp] theorem Sₐ.r0_of_add_r0_diff₀
  (amms: Sₐ) (t0 t1: T) (x: PReal)
  (h: amms.init t0 t1) (t0' t1': T)
  (hdiff: diffmint t0 t1 t0' t1'):
  (amms.add_r0 t0 t1 h x).r0₀ t0' t1'
  =
  amms.r0₀ t0' t1'
  := by simp [add_r0, hdiff]

@[simp] theorem Sₐ.r0_of_add_r1₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: PReal):
  (amms.add_r1 t0 t1 h x).r0₀ t0 t1
  =
  amms.r0₀ t0 t1
  := by simp [add_r1]

@[simp] theorem Sₐ.r0_of_add_r1_diff₀
  (amms: Sₐ) (t0 t1: T) (x: PReal)
  (h: amms.init t0 t1)
  (t0' t1': T)
  (hdiff: diffmint t0 t1 t0' t1')
  :
  (amms.add_r1 t0 t1 h x).r0₀ t0' t1'
  =
  amms.r0₀ t0' t1'
  := by
  simp [add_r1, hdiff]

@[simp] theorem Sₐ.r1_of_add_r1₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+):
  (amms.add_r1 t0 t1 h x).r1₀ t0 t1
  =
  x + amms.r1₀ t0 t1
  := by rw [add_comm]; simp [add_r1]

@[simp] theorem Sₐ.r1_of_add_r1_diff₀
  (amms: Sₐ) (t0 t1: T) (x: PReal)
  (h: amms.init t0 t1) (t0' t1': T)
  (hdiff: diffmint t0 t1 t0' t1'):
  (amms.add_r1 t0 t1 h x).r1₀ t0' t1'
  =
  amms.r1₀ t0' t1'
  := by simp [add_r1, hdiff]

@[simp] theorem Sₐ.r1_of_add_r0₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+):
  (amms.add_r0 t0 t1 h x).r1₀ t0 t1
  =
  amms.r1₀ t0 t1
  := by simp [add_r0]

@[simp] theorem Sₐ.r1_of_add_r0_swapped₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+):
  (amms.add_r0 t1 t0 h.swap x).r1₀ t0 t1
  =
  x + amms.r1₀ t0 t1
  := by simp_rw [r1_reorder₀ _ _ _]
        simp

@[simp] theorem Sₐ.r1_of_add_r1_swapped₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+):
  (amms.add_r1 t1 t0 h.swap x).r1₀ t0 t1
  =
  amms.r1₀ t0 t1
  := by simp_rw [r1_reorder₀ _ _ _]
        simp

@[simp] theorem Sₐ.r0_of_add_r1_swapped₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+):
  (amms.add_r1 t1 t0 h.swap x).r0₀ t0 t1
  =
  x + amms.r0₀ t0 t1
  := by simp_rw [r0_reorder₀ _ _ _]
        simp

@[simp] theorem Sₐ.r0_of_add_r0_swapped₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+):
  (amms.add_r0 t1 t0 h.swap x).r0₀ t0 t1
  =
  amms.r0₀ t0 t1
  := by simp_rw [r0_reorder₀ _ _ _]
        simp



@[simp] theorem Sₐ.r1_of_add_r0_diff₀
  (amms: Sₐ) (t0 t1: T) (x: PReal)
  (h: amms.init t0 t1)
  (t0' t1': T)(hdiff: diffmint t0 t1 t0' t1'):
  (amms.add_r0 t0 t1 h x).r1₀ t0' t1'
  =
  amms.r1₀ t0' t1'
  := by simp [add_r0, hdiff]

@[simp] theorem Sₐ.r0_of_sub_r0₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+) (h': x < amms.r0 t0 t1 h):
  (amms.sub_r0 t0 t1 h x h').r0₀ t0 t1
  =
  amms.r0₀ t0 t1 - x
  := by simp [sub_r0]

@[simp] theorem Sₐ.r0_of_sub_r1₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+) (h': x < amms.r1 t0 t1 h):
  (amms.sub_r1 t0 t1 h x h').r0₀ t0 t1
  =
  amms.r0₀ t0 t1
  := by simp [sub_r1]

@[simp] theorem Sₐ.r1_of_sub_r1₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+) (h': x < amms.r1 t0 t1 h):
  (amms.sub_r1 t0 t1 h x h').r1₀ t0 t1
  =
  amms.r1₀ t0 t1 - x
  := by simp [sub_r1]

@[simp] theorem Sₐ.r1_of_sub_r0₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+) (h': x < amms.r0 t0 t1 h):
  (amms.sub_r0 t0 t1 h x h').r1₀ t0 t1
  =
  amms.r1₀ t0 t1
  := by simp [sub_r0]

@[simp] theorem Sₐ.r0_of_sub_r0_diff₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+) (h': x < amms.r0 t0 t1 h) (t0' t1': T) (hdiff: diffmint t0 t1 t0' t1'):
  (amms.sub_r0 t0 t1 h x h').r0₀ t0' t1'
  =
  amms.r0₀ t0' t1'
  := by simp [sub_r0, hdiff]

@[simp] theorem Sₐ.r0_of_sub_r1_diff₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+) (h': x < amms.r1 t0 t1 h)
  (t0' t1': T)
  (hdiff: diffmint t0 t1 t0' t1'):
  (amms.sub_r1 t0 t1 h x h').r0₀ t0' t1'
  =
  amms.r0₀ t0' t1'
  := by simp [sub_r1, hdiff]

@[simp] theorem Sₐ.r1_of_sub_r1_diff₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+) (h': x < amms.r1 t0 t1 h) (t0' t1': T)
  (hdiff: diffmint t0 t1 t0' t1'):
  (amms.sub_r1 t0 t1 h x h').r1₀ t0' t1'
  =
  amms.r1₀ t0' t1'
  := by simp [sub_r1, hdiff]

@[simp] theorem Sₐ.r1_of_sub_r0_diff₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+) (h': x < amms.r0 t0 t1 h) (t0' t1': T)
  (hdiff: diffmint t0 t1 t0' t1'):
  (amms.sub_r0 t0 t1 h x h').r1₀ t0' t1'
  =
  amms.r1₀ t0' t1'
  := by simp [sub_r0, hdiff]

@[simp] theorem Sₐ.r0_of_sub_r0_swapped₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+) (h': x < amms.r0 t1 t0 h.swap):
  (amms.sub_r0 t1 t0 h.swap x h').r0₀ t0 t1
  =
  amms.r0₀ t0 t1
  := by simp_rw [r0_reorder₀ _ _ _]
        simp

@[simp] theorem Sₐ.r0_of_sub_r1_swapped₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+) (h': x < amms.r1 t1 t0 h.swap):
  (amms.sub_r1 t1 t0 h.swap x h').r0₀ t0 t1
  =
  amms.r0₀ t0 t1 - x
  := by simp_rw [r0_reorder₀ _ _ _]
        simp

@[simp] theorem Sₐ.r1_of_sub_r1_swapped₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+) (h': x < amms.r1 t1 t0 h.swap):
  (amms.sub_r1 t1 t0 h.swap x h').r1₀ t0 t1
  =
  amms.r1₀ t0 t1
  := by simp_rw [r1_reorder₀ _ _ _]
        simp

@[simp] theorem Sₐ.r1_of_sub_r0_swapped₀
  (amms: Sₐ) (t0 t1: T) (h: amms.init t0 t1) (x: ℝ+) (h': x < amms.r0 t1 t0 h.swap):
  (amms.sub_r0 t1 t0 h.swap x h').r1₀ t0 t1
  =
  amms.r1₀ t0 t1 - x
  := by simp_rw [r1_reorder₀ _ _ _]
        simp

theorem Sₐ.eq_iff (amms amms': Sₐ):
  amms = amms' ↔ ∀ (t0 t1: T), amms.r0₀ t0 t1 = amms'.r0₀ t0 t1 := by
  apply Iff.intro
  . intro eq t0 t1
    simp_rw [eq]
  . intro extfun
    rcases amms with ⟨f, h1, h2⟩
    rcases amms' with ⟨f', h1', h2'⟩
    unfold r0₀ at extfun
    simp at extfun
    simp
    ext t0 t1
    rw [NNReal.coe_eq]
    exact extfun t0 t1
