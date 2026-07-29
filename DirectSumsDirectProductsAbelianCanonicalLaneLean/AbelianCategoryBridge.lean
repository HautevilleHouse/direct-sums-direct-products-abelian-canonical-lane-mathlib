import canonicalLaneMathlib.AdmissibleClass
import DirectSumsDirectProductsAbelianCanonicalLaneLean.DirectSumPackage
import DirectSumsDirectProductsAbelianCanonicalLaneLean.DirectProductPackage

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure AbelianCategoryBridge (I : Type u) (A : I → Type v) [∀ i, AddCommGroup (A i)] where
  directSum : DirectSumPackage I A
  directProduct : DirectProductPackage I A
  biproductExists : Prop
  biproductIsBoth : directSum.directSumClosed ∧ directProduct.directProductClosed
  abelianCategoryClosed : Prop
  abelianCategoryClosedTerm : abelianCategoryClosed

structure AbelianCategoryBridgeEvidence {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (B : AbelianCategoryBridge I A) where
  directSumClosed : DirectSumClosed B.directSum
  directProductClosed : DirectProductClosed B.directProduct
  biproductExistsClosed : B.biproductExists
  abelianCategoryClosedTermClosed : B.abelianCategoryClosedTerm

def AbelianCategoryBridgeClosed {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (B : AbelianCategoryBridge I A) : Prop :=
  DirectSumClosed B.directSum ∧ DirectProductClosed B.directProduct ∧ B.biproductExists ∧ B.abelianCategoryClosed

theorem abelian_category_bridge_closed_from_evidence {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (B : AbelianCategoryBridge I A) (E : AbelianCategoryBridgeEvidence B) : AbelianCategoryBridgeClosed B := by
  exact And.intro E.directSumClosed (And.intro E.directProductClosed (And.intro E.biproductExistsClosed E.abelianCategoryClosedTermClosed))

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse