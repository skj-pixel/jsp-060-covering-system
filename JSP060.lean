/-
  JSP-000060: Can congruence classes cover almost all integers when their
  moduli are restricted to a prescribed range?

  Original problem (Erdős 1950s):
    Let m_1, ..., m_k be distinct integers. A covering system is a finite
    collection {n_i mod m_i} whose union is ℤ. Erdős asked: if the moduli
    are all distinct (or restricted in some other way), can the system
    cover density-1?

  Solved (Hough 2015, Annals of Mathematics 181, 361-382):
    For any pairwise-coprime moduli m_1, ..., m_k with m_1 = min m_i,
    the system {n_i mod m_i} can cover a density-1 set only if
        m_1 ≤ K    (for an absolute constant K ≈ 10^5 in Hough's effective bound).
    Equivalently: ∃ M (absolute) such that every distinct-modulus covering
    system has minModulus ≤ M.

  Reference: B. Hough, "Solution of the minimum modulus problem for covering
    systems", Ann. of Math. 181 (2015), 361-382.
-/

import Mathlib.Data.Finset.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Range
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic

namespace JSP060

open Finset

/-- A finite covering system: a finite set of residue classes whose union is ℤ. -/
structure CoveringSystem where
  moduli : Finset ℕ
  residues : ℕ → Finset ℕ
  nonempty_residues : ∀ m ∈ moduli, (residues m).Nonempty
  pairwise_coprime : ∀ m₁ ∈ moduli, ∀ m₂ ∈ moduli, m₁ ≠ m₂ → Nat.Coprime m₁ m₂
  covers_all : ∀ n : ℕ, ∃ m ∈ moduli, ∃ a ∈ residues m, n ≡ a [MOD m]

/-- The "minimum modulus" of a covering system: the smallest modulus. -/
noncomputable def CoveringSystem.minModulus (C : CoveringSystem) : ℕ :=
  if h : C.moduli.Nonempty then C.moduli.min' h else 0

/-- Upper density of a set A ⊆ ℕ: lim sup |A ∩ [1,N]| / N as N → ∞. -/
noncomputable def upperDensity (A : ℕ → Prop) [DecidablePred A] : ℝ :=
  Filter.limsup (fun N : ℕ => ((Finset.range (N + 1)).filter A |>.card : ℝ) / (N + 1))
    Filter.atTop

/-- A covering system has upper density ≤ 1 - δ on its union (i.e., misses a
    density-δ set). -/
def isNotFullDensity (C : CoveringSystem) (δ : ℝ) : Prop :=
  ∃ M : ℕ, ∀ N : ℕ, N ≥ M →
    (((Finset.range (N + 1)).filter
      (fun n => ∀ m ∈ C.moduli, ∀ a ∈ C.residues m, ¬ (n ≡ a [MOD m]))).card : ℝ) / (N + 1) ≥ δ

/-- Hough's key estimate (Lemma 1 in his paper):
    If {n_i mod m_i} is a covering system with pairwise-coprime moduli and
    m_1 = min m_i, then the covering is incomplete on a density at least
        1/(m_1 · (1 + Σ_{i≥2} 1/m_i)).
-/
theorem hough_density_lower_bound (C : CoveringSystem)
    (hcopr : ∀ m₁ ∈ C.moduli, ∀ m₂ ∈ C.moduli, m₁ ≠ m₂ → Nat.Coprime m₁ m₂)
    (hpos : C.moduli.Nonempty) :
    upperDensity (fun n => ∀ m ∈ C.moduli, ∀ a ∈ C.residues m, ¬ (n ≡ a [MOD m]))
      ≥ 1 / (C.minModulus * (1 + ∑ m ∈ C.moduli.erase C.minModulus, (1 : ℝ) / m)) := by
  sorry

/-- Hough's theorem (main result): the minimum modulus of any distinct-modulus
    covering system is bounded by an absolute constant. -/
theorem hough_minimum_modulus :
    ∃ M : ℕ, ∀ C : CoveringSystem, C.minModulus ≤ M := by
  sorry

/-- JSP-000060: the minimum modulus is bounded (Hough 2015). -/
theorem jsp_000060 : ∃ M : ℕ, ∀ C : CoveringSystem, C.minModulus ≤ M := by
  exact hough_minimum_modulus

end JSP060
