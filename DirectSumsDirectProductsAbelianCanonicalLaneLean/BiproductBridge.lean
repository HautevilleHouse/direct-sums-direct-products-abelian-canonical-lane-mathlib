import canonicalLaneMathlib.AdmissibleClass
import DirectSumsDirectProductsAbelianCanonicalLaneLean.DirectSumConstruction
import DirectSumsDirectProductsAbelianCanonicalLaneLean.DirectProductConstruction

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure BiproductPackage (DSum : DirectSumPackage) (DProd : DirectProductPackage) where
  indexSetAgreement : DSum.indexSet = DProd.indexSet
  componentFamilyAgreement : DSum.componentFamily = DProd.componentFamily
  biproductCarrier : Type w
  biproductAddition : AddCommGroup biproductCarrier
  biproductUniversalProperty : Prop

structure BiproductEvidence (DSum : DirectSumPackage) (DProd : DirectProductPackage) (B : BiproductPackage DSum DProd) where
  biproductUniversalPropertyClosed : B.biproductUniversalProperty

def BiproductClosed (DSum : DirectSumPackage) (DProd : DirectProductPackage) (B : BiproductPackage DSum DProd) : Prop :=
  B.biproductUniversalProperty

theorem biproduct_closed_from_evidence (DSum : DirectSumPackage) (DProd : DirectProductPackage) (B : BiproductPackage DSum DProd) (E : BiproductEvidence DSum DProd B) :
    BiproductClosed DSum DProd B := by
  exact E.biproductUniversalPropertyClosed

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse