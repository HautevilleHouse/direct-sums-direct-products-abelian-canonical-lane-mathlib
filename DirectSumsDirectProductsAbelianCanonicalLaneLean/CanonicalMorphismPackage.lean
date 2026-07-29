import canonicalLaneMathlib.AdmissibleClass
import DirectSumsDirectProductsAbelianCanonicalLaneLean.DirectSumConstruction
import DirectSumsDirectProductsAbelianCanonicalLaneLean.DirectProductConstruction

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure CanonicalMorphismPackage (DSum : DirectSumPackage) (DProd : DirectProductPackage) where
  indexSetAgreement : DSum.indexSet = DProd.indexSet
  componentFamilyAgreement : DSum.componentFamily = DProd.componentFamily
  canonicalMap : DSum.directSumCarrier → DProd.directProductCarrier
  canonicalMapIsInjective : Prop
  canonicalMapIsSurjectiveWhenFinite : Prop
  canonicalMapPreservesAddition : Prop

structure CanonicalMorphismEvidence (DSum : DirectSumPackage) (DProd : DirectProductPackage) (M : CanonicalMorphismPackage DSum DProd) where
  canonicalMapInjectiveClosed : M.canonicalMapIsInjective
  canonicalMapSurjectiveWhenFiniteClosed : M.canonicalMapIsSurjectiveWhenFinite
  canonicalMapPreservesAdditionClosed : M.canonicalMapPreservesAddition

def CanonicalMorphismClosed (DSum : DirectSumPackage) (DProd : DirectProductPackage) (M : CanonicalMorphismPackage DSum DProd) : Prop :=
  M.canonicalMapIsInjective ∧ M.canonicalMapIsSurjectiveWhenFinite ∧ M.canonicalMapPreservesAddition

theorem canonical_morphism_closed_from_evidence (DSum : DirectSumPackage) (DProd : DirectProductPackage) (M : CanonicalMorphismPackage DSum DProd) (E : CanonicalMorphismEvidence DSum DProd M) :
    CanonicalMorphismClosed DSum DProd M := by
  exact And.intro E.canonicalMapInjectiveClosed (And.intro E.canonicalMapSurjectiveWhenFiniteClosed E.canonicalMapPreservesAdditionClosed)

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse