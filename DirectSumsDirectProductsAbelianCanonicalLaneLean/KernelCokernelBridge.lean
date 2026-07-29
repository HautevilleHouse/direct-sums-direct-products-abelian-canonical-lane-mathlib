import canonicalLaneMathlib.AdmissibleClass
import DirectSumsDirectProductsAbelianCanonicalLaneLean.BiproductEquivalence

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure KernelCokernelBridge (A B C : AddCommGroupCat) (f : A ⟶ B) (g : B ⟶ C) where
  kernel : AddCommGroupCat
  cokernel : AddCommGroupCat
  kernelInclusion : kernel ⟶ A
  cokernelProjection : C ⟶ cokernel
  exactAtB : image f = kernel g
  linearSequenceClosed : Prop

structure KernelCokernelEvidence {A B C : AddCommGroupCat} {f : A ⟶ B} {g : B ⟶ C}
    (K : KernelCokernelBridge A B C f g) where
  exactAtBClosed : K.exactAtB
  linearSequenceClosed : K.linearSequenceClosed

def KernelCokernelClosed {A B C : AddCommGroupCat} {f : A ⟶ B} {g : B ⟶ C}
    (K : KernelCokernelBridge A B C f g) : Prop := K.exactAtB ∧ K.linearSequenceClosed

theorem kernel_cokernel_closed_from_evidence {A B C : AddCommGroupCat} {f : A ⟶ B} {g : B ⟶ C}
    (K : KernelCokernelBridge A B C f g) (E : KernelCokernelEvidence K) : KernelCokernelClosed K := by
  exact And.intro E.exactAtBClosed E.linearSequenceClosed

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse
