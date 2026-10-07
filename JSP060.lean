/-
  JSP-000060: Can congruence classes cover almost all integers when their
  moduli are restricted to a prescribed range?

  Original problem (Erdős 1950s):
    Let m_1, ..., m_k be distinct integers with min m_i → ∞ (or some other
    restriction). Can a finite covering system of residue classes
        {0 + n_1 mod m_1, ..., 0 + n_k mod m_k}
    cover 100% of ℤ \ small set?

  Solved: Yes, by Hough (2015, "Minimum modulus problem for covering systems").
    For any moduli m_i with min m_i ≥ some constant, no finite covering can
    cover a density-1 set.

  Reference: Hough, "Solution of the minimum modulus problem for covering
    systems", Annals of Mathematics 181 (2015), 361-382.

  Lean 4.20 outer statement; proof machinery is sorry-stubbed.
-/

import Mathlib.Data.Finset.Basic
import Mathlib.Data.Finset.Range
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic

namespace JSP060

open Finset

/-- A finite covering system: a finite set of residue classes whose union is ℤ. -/
structure CoveringSystem where
  moduli : Finset ℕ      -- the moduli
  residues : ℕ → Finset ℕ  -- for each modulus m, the residue classes a mod m
  nonempty : ∀ m ∈ moduli, (residues m).Nonempty
  pairwise_coprime : ∀ m₁ ∈ moduli, ∀ m₂ ∈ moduli, m₁ ≠ m₂ → Nat.Coprime m₁ m₂
  covers_all : ∀ n : ℕ, ∃ m ∈ moduli, ∃ a ∈ residues m, n ≡ a [MOD m]

/-- The "minimum modulus" of a covering system: the smallest modulus. -/
noncomputable def CoveringSystem.minModulus (C : CoveringSystem) : ℕ :=
  if h : C.moduli.Nonempty then C.moduli.min' h else 0

/-- JSP-000060 statement: any finite covering system has min modulus bounded.
    This is Hough's theorem (the minimum modulus problem). -/
theorem hough_minimum_modulus :
    ∃ M : ℕ, ∀ C : CoveringSystem, C.minModulus ≤ M := by
  sorry

/-- JSP-000060: the minimum modulus is bounded (Hough 2015). -/
theorem jsp_000060 : ∃ M : ℕ, ∀ C : CoveringSystem, C.minModulus ≤ M := by
  exact hough_minimum_modulus

end JSP060
