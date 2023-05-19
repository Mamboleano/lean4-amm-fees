import Mathlib.Data.Finsupp.Basic
import Mathlib.Data.Finsupp.Defs
import Mathlib.Tactic.LibrarySearch

theorem Finsupp.update_diff {α β: Type} [DecidableEq α] [Zero β]
(f: α →₀ β) (a': α) (b: β) (a: α) (hdif: a ≠ a'):
  (f.update a' b) a = f a := by
  simp [hdif]

/- Update of a 2-key partial map -/
noncomputable def Finsupp.up {α β γ: Type} [Zero γ]
(f: α →₀ β →₀ γ) (a: α) (b: β) (c: γ)
: α →₀ β →₀ γ := f.update a ((f a).update b c)

/- New map as an ite with new value and old map -/
theorem Finsupp.up_apply  
{α β γ: Type} [Zero γ] [DecidableEq α] [DecidableEq β]
(f: α →₀ β →₀ γ) (a': α) (b': β) (c: γ) (a: α) (b: β)
: f.up a' b' c a b = if a=a' ∧ b=b' then c else f a b := by 
  unfold up
  simp only [Finsupp.coe_update]
  simp only [Function.update_apply]
  apply @Decidable.byCases (a=a')
  . intro heqa; simp [heqa, Function.update_apply]
  . intro neqa; simp [neqa]

/- New map equal to old map when key is different -/
theorem Finsupp.up_diff {α β γ: Type} [DecidableEq α] [Zero γ]
(f: α →₀ β →₀ γ) (a': α) (b: β) (c: γ) 
(a: α) (hdif: a ≠ a')
: (f.up a' b c) a = f a := by 
  unfold up; simp [Finsupp.update_diff _ _ _ _ hdif]

/- Product swaps as an embedding 
   (which are just a structure containing a function
    and a proof that it is injective)-/
def Prod.swap_emb {α β: Type}: α × β ↪ β × α :=
  ⟨Prod.swap, Prod.swap_injective⟩

/- Prod.swap_emb coerced to a function is the same as Prod -/
lemma Prod.swap_emb_coe {α β: Type}
: (Prod.swap_emb: (α × β → β × α)) = Prod.swap := by
  unfold swap_emb; simp

/- The finsupp same as f except the input pair is swapped -/
def Finsupp.uncurried_swap {α β M: Type} [e: AddCommMonoid M] 
  (f: α × β →₀ M): β × α →₀ M := 
  ⟨
  -- The domain
  f.support.map Prod.swap_emb,
  -- The function's definition
   λ ((b,a): β×α) => f (Prod.swap_emb (b,a)), 
  -- The proof that x ∈ domain ↔ f x ≠ 0
  by 
  intro x
  apply Iff.intro
  . intro xin
    simp [xin]
    have xin': (Prod.swap_emb x) ∈ f.support := by
      rw [← Prod.swap_swap x] at xin
      rw [← Prod.swap_emb_coe] at xin
      rw [← Prod.swap_emb_coe] at xin
      exact (Finset.mem_map' Prod.swap_emb).mp xin
    simp [xin']
    exact (f.mem_support_toFun (x.snd, x.fst)).mp xin'
  . intro xnin; simp at xnin
    have h := (f.mem_support_toFun _).mpr xnin
    rw [← Prod.swap_swap x]
    rw [← Prod.swap_emb_coe, ← Prod.swap_emb_coe]
    exact (Finset.mem_map' _).mpr h
  ⟩

theorem Finsupp.uncurried_swap_def {α β M: Type} [e: AddCommMonoid M] 
  (f: α × β →₀ M) (x: α × β): 
  f.uncurried_swap x.swap = f x := by
  simp [uncurried_swap, Prod.swap_emb]

theorem Finsupp.uncurried_swap_def' {α β M: Type} [e: AddCommMonoid M] 
  (f: α × β →₀ M) (x: β × α): 
  f.uncurried_swap x = f x.swap := by
  simp [uncurried_swap, Prod.swap_emb]

noncomputable def Finsupp.curried_swap {α β M: Type} [AddCommMonoid M] 
  (f: α →₀ β →₀ M): β →₀ α →₀ M := 
    f.uncurry.uncurried_swap.curry
  
-- Copied from finsuppProdEquiv.left_inv
-- I couldn't figure out how to reuse it
theorem Finsupp.uncurry_curry {α β M: Type} [e: AddCommMonoid M] 
  (f: α →₀ β →₀ M):
  f.uncurry.curry = f := by
  simp [Finsupp.finsuppProdEquiv.right_inv f]
  simp only [Finsupp.curry, Finsupp.uncurry, sum_sum_index, sum_zero_index, sum_add_index,
    sum_single_index, single_zero, single_add, eq_self_iff_true, forall_true_iff,
    forall₃_true_iff, Prod.mk.eta, (single_sum _ _ _).symm, sum_single]

theorem Finsupp.uncurry_apply {α β M: Type} [e: AddCommMonoid M] 
  (f: α →₀ β →₀ M) (a: α) (b: β):
  f.uncurry (a,b) = f a b := by
  conv => rhs
          rw [← uncurry_curry f]
  rw [curry_apply]

theorem Finsupp.curried_swap_def {α β M: Type} [e: AddCommMonoid M] 
  (f: α →₀ β →₀ M) (a: α) (b: β):
  f.curried_swap b a = f a b := by
  unfold curried_swap
  simp [Finsupp.curry_apply, Finsupp.uncurried_swap_def',
        Finsupp.uncurry_apply]


theorem Finsupp.up_swap 
{α β M: Type} [DecidableEq α] [DecidableEq β] [AddCommMonoid M]
  (f: α →₀ β →₀ M) (a': α) (b': β) (m: M):
  (f.up a' b' m).curried_swap = f.curried_swap.up b' a' m := by
  ext b a
  rw [Finsupp.curried_swap_def]
  simp [Finsupp.up_apply]
  exact if_congr (and_comm) (Eq.refl m) ((curried_swap_def f a b).symm)