import canonicalLaneMathlib.AdmissibleClass
import DirectSumsDirectProductsAbelianCanonicalLaneLean.DirectSumDefs
import DirectSumsDirectProductsAbelianCanonicalLaneLean.DirectProductDefs

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure BiproductEquivalence (I : Type) (G : I → AddCommGroupCat) where
  sum : DirectSumPackage I G
  prod : DirectProductPackage I G
  iso : AddEquiv (sum.underlyingGroup) (prod.underlyingGroup)
  isoInverse : iso.symm = iso.toAddMonoidHom.inverse

def BiproductEquivalenceClosed {I : Type} {G : I → AddCommGroupCat} (B : BiproductEquivalence I G) : Prop :=
  DirectSumClosed B.sum ∧ DirectProductClosed B.prod ∧ (∀ x, B.iso (B.iso.symm x) = x) ∧ (∀ x, B.iso.symm (B.iso x) = x)

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse
