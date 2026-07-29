import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure DirectSumAdmittedObject where
  space : Type
  directSumClosed : Prop
  directProductClosed : Prop
  abelianCondition : Prop
  conclusion : directSumClosed ∧ directProductClosed ∧ abelianCondition

def DirectSumWitnessClosed (O : DirectSumAdmittedObject) : Prop :=
  O.directSumClosed ∧ O.directProductClosed

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse