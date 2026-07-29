import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure DirectProductPackage (I : Type u) (A : I → Type v) [∀ i, AddCommGroup (A i)] where
  directProduct : Type w
  addCommGroup : AddCommGroup directProduct
  projection : ∀ i, directProduct →+ A i
  universalProperty : ∀ (B : Type w) [AddCommGroup B], (B →+ ∀ i, A i) → (B →+ directProduct)
  projectionUniversalPropertyCompatible : ∀ (B : Type w) [AddCommGroup B] (ψ : B →+ ∀ i, A i) (i : I) (b : B),
    (projection i) ∘ (universalProperty B ψ) = ψ i
  directProductClosed : Prop
  directProductClosedTerm : directProductClosed

structure DirectProductEvidence {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (P : DirectProductPackage I A) where
  addCommGroupClosed : P.addCommGroup
  projectionClosed : ∀ i, P.projection i = P.projection i
  universalPropertyClosed : ∀ (B : Type w) [AddCommGroup B] (ψ : B →+ ∀ i, A i), P.universalProperty B ψ = P.universalProperty B ψ
  directProductClosedTermClosed : P.directProductClosedTerm

def DirectProductClosed {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (P : DirectProductPackage I A) : Prop :=
  P.addCommGroup ∧ P.directProductClosed

theorem direct_product_closed_from_evidence {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (P : DirectProductPackage I A) (E : DirectProductEvidence P) : DirectProductClosed P := by
  exact And.intro E.addCommGroupClosed E.directProductClosedTermClosed

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse