import DirectSumsDirectProductsAbelianCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure DirectSumPackage (I : Type u) (A : I → Type v) [∀ i, AddCommGroup (A i)] where
  sum : Type w
  injection : ∀ i, A i → sum
  universalProperty : Prop
  directSumClosed : Prop

def DirectSumClosed {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)] (P : DirectSumPackage I A) : Prop :=
  P.directSumClosed

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse