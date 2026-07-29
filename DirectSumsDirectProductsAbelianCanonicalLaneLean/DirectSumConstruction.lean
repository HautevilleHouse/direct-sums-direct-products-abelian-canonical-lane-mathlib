import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure DirectSumPackage (I : Type u) (A : I → Type v) [∀ i, AddCommGroup (A i)] where
  sumType : Type w
  inclusion : ∀ i, A i → sumType
  universalProperty : ∀ (B : Type u') [AddCommGroup B],
    (∀ i, A i → B) → (sumType → B)
  sumClosed : Prop
  sumClosedTerm : sumClosed

structure DirectSumEvidence {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (P : DirectSumPackage I A) where
  sumClosedWitness : P.sumClosed

def DirectSumClosed {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (P : DirectSumPackage I A) : Prop :=
  P.sumClosed

theorem direct_sum_closed_from_evidence
    {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (P : DirectSumPackage I A) (E : DirectSumEvidence P) :
    DirectSumClosed P := by
  exact E.sumClosedWitness

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse