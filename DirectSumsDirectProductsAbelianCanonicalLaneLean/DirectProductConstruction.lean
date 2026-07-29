import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure DirectProductPackage (I : Type u) (A : I → Type v) [∀ i, AddCommGroup (A i)] where
  productType : Type w
  projection : ∀ i, productType → A i
  universalProperty : ∀ (B : Type u') [AddCommGroup B],
    (∀ i, B → A i) → (B → productType)
  productClosed : Prop
  productClosedTerm : productClosed

structure DirectProductEvidence {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (P : DirectProductPackage I A) where
  productClosedWitness : P.productClosed

def DirectProductClosed {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (P : DirectProductPackage I A) : Prop :=
  P.productClosed

theorem direct_product_closed_from_evidence
    {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (P : DirectProductPackage I A) (E : DirectProductEvidence P) :
    DirectProductClosed P := by
  exact E.productClosedWitness

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse