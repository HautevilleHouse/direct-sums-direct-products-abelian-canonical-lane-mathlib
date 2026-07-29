import canonicalLaneMathlib.GateLemmas

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

def ConstrainedDirectSumsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_direct_sums_endgame (A : AdmissibleClass) :
    ConstrainedDirectSumsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse