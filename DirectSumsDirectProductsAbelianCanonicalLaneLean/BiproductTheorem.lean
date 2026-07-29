import DirectSumsDirectProductsAbelianCanonicalLaneLean.DirectSumStructure
import DirectSumsDirectProductsAbelianCanonicalLaneLean.DirectProductStructure

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure BiproductTheoremPackage {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    (DS : DirectSumPackage I A) (DP : DirectProductPackage I A) where
  finitelySupportedCondition : Prop
  biproductIsomorphism : Prop
  biproductIsomorphismProof : biproductIsomorphism
  biproductClosed : Prop

structure BiproductEvidence {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    {DS : DirectSumPackage I A} {DP : DirectProductPackage I A}
    (B : BiproductTheoremPackage DS DP) where
  finitelySupportedConditionClosed : B.finitelySupportedCondition
  biproductIsomorphismClosed : B.biproductIsomorphism

def BiproductClosed {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    {DS : DirectSumPackage I A} {DP : DirectProductPackage I A}
    (B : BiproductTheoremPackage DS DP) : Prop :=
  B.finitelySupportedCondition ∧ B.biproductIsomorphism ∧ B.biproductClosed

theorem biproduct_closed_from_evidence
    {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)]
    {DS : DirectSumPackage I A} {DP : DirectProductPackage I A}
    (B : BiproductTheoremPackage DS DP) (E : BiproductEvidence B) :
    BiproductClosed B := by
  exact And.intro E.finitelySupportedConditionClosed
    (And.intro E.biproductIsomorphismClosed B.biproductClosed)

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse