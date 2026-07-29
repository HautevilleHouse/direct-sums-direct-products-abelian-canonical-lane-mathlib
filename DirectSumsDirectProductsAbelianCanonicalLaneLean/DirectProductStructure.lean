import DirectSumsDirectProductsAbelianCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure DirectProductPackage (I : Type u) (A : I → Type v) [∀ i, AddCommGroup (A i)] where
  product : Type w
  projection : ∀ i, product → A i
  universalProperty : Prop
  directProductClosed : Prop

def DirectProductClosed {I : Type u} {A : I → Type v} [∀ i, AddCommGroup (A i)] (P : DirectProductPackage I A) : Prop :=
  P.directProductClosed

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse