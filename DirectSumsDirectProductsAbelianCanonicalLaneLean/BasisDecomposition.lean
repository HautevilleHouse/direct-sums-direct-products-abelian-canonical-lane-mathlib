import canonicalLaneMathlib.AdmissibleClass
import DirectSumsDirectProductsAbelianCanonicalLaneLean.DirectSumConstruction

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure BasisDecompositionPackage (DSum : DirectSumPackage) where
  basisIndexSet : Type u
  basisFamily : basisIndexSet → DSum.directSumCarrier
  spanningProperty : Prop
  linearIndependence : Prop
  decompositionUnique : Prop

structure BasisDecompositionEvidence (DSum : DirectSumPackage) (B : BasisDecompositionPackage DSum) where
  spanningPropertyClosed : B.spanningProperty
  linearIndependenceClosed : B.linearIndependence
  decompositionUniqueClosed : B.decompositionUnique

def BasisDecompositionClosed (DSum : DirectSumPackage) (B : BasisDecompositionPackage DSum) : Prop :=
  B.spanningProperty ∧ B.linearIndependence ∧ B.decompositionUnique

theorem basis_decomposition_closed_from_evidence (DSum : DirectSumPackage) (B : BasisDecompositionPackage DSum) (E : BasisDecompositionEvidence DSum B) :
    BasisDecompositionClosed DSum B := by
  exact And.intro E.spanningPropertyClosed (And.intro E.linearIndependenceClosed E.decompositionUniqueClosed)

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse