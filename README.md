# JSP-000060 — Covering System Lean Formalization

> **Problem**: Minimum modulus problem for covering systems (Erdős 1950s)
> **Statement**: ∃ M, ∀ finite covering system, min modulus ≤ M
> **Solver**: Bob Hough (2015, Annals of Mathematics)
> **JSP bounty**: USD $100
> **Current status**: Solved, Lean proof: No, Eligible: No

## Build

```sh
lake build
```

## Attribution

Original Lean code by `skj-pixel`. Reference: Hough (2015), Annals of
Mathematics 181, 361-382.

## Plan

1. ✅ Outer statement scaffold
2. (TODO) Prime factorization machinery in Mathlib
3. (TODO) Density arguments via L^1 / L^2 estimates
4. (TODO) Assemble → Hough's theorem
