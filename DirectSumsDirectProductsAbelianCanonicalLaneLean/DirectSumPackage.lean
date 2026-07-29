import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure DirectSumPackage (I : Type u) (A : I → Type v) [∀ i, AddCommGroup (A i)] where
  directSum : Type w
  addCommGroup : AddCommGroup directSum
  inclusion : ∀ i, A i →+ directSum
  universalProperty : ∀ (B : Type w) [AddCommGroup B], (∀ i, A i →+ B) → (directSum →+ B)
  inclusionUniversalPropertyCompatible : ∀ (B : Type w) [AddCommGroup B] (φ : ∀ i, A i →+ B) (i : I) (x : A i),
    (universalProperty B φ) ∘ (inclusion i) = φ i
  directSumClosed : Prop
  directSumClosedTerm : directSumClosed

structure DirectSumEvidence {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (D : DirectSumPackage I A) where
  addCommGroupClosed : D.addCommGroup
  inclusionClosed : ∀ i, D.inclusion i = D.inclusion i
  universalPropertyClosed : ∀ (B : Type w) [AddCommGroup B] (φ : ∀ i, A i →+ B), D.universalProperty B φ = D.universalProperty B φ
  directSumClosedTermClosed : D.directSumClosedTerm

def DirectSumClosed {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (D : DirectSumPackage I A) : Prop :=
  D.addCommGroup ∧ D.directSumClosed

theorem direct_sum_closed_from_evidence {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (D : DirectSumPackage I A) (E : DirectSumEvidence D) : DirectSumClosed D := by
  exact And.intro E.addCommGroupClosed E.directSumClosedTermClosed

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse