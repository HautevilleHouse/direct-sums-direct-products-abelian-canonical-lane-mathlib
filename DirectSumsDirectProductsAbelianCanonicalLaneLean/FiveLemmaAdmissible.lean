import canonicalLaneMathlib.AdmissibleClass
import DirectSumsDirectProductsAbelianCanonicalLaneLean.KernelCokernelBridge

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure FiveLemmaAdmissible (A B C D E A' B' C' D' E' : AddCommGroupCat)
    (f : A ⟶ B) (g : B ⟶ C) (h : C ⟶ D) (i : D ⟶ E)
    (f' : A' ⟶ B') (g' : B' ⟶ C') (h' : C' ⟶ D') (i' : D' ⟶ E')
    (α : A ⟶ A') (β : B ⟶ B') (γ : C ⟶ C') (δ : D ⟶ D') (ε : E ⟶ E') where
  topRowExact : image f = kernel g ∧ image g = kernel h ∧ image h = kernel i
  bottomRowExact : image f' = kernel g' ∧ image g' = kernel h' ∧ image h' = kernel i'
  squaresCommute : β ∘ f = f' ∘ α ∧ γ ∘ g = g' ∘ β ∧ δ ∘ h = h' ∘ γ ∧ ε ∘ i = i' ∘ δ
  conclusion : (MonoidHom.Injective α ∧ MonoidHom.Injective β ∧ MonoidHom.Injective δ ∧ MonoidHom.Injective ε) → MonoidHom.Injective γ

def FiveLemmaAdmissibleClosed {A B C D E A' B' C' D' E' : AddCommGroupCat}
    (f : A ⟶ B) (g : B ⟶ C) (h : C ⟶ D) (i : D ⟶ E)
    (f' : A' ⟶ B') (g' : B' ⟶ C') (h' : C' ⟶ D') (i' : D' ⟶ E')
    (α : A ⟶ A') (β : B ⟶ B') (γ : C ⟶ C') (δ : D ⟶ D') (ε : E ⟶ E')
    (F : FiveLemmaAdmissible A B C D E A' B' C' D' E' f g h i f' g' h' i' α β γ δ ε) : Prop :=
  F.topRowExact ∧ F.bottomRowExact ∧ F.squaresCommute ∧ F.conclusion

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse
