import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure DirectSumPackage (I : Type) (G : I → AddCommGroupCat) where
  underlyingGroup : AddCommGroupCat
  inclusion : ∀ i : I, G i ⟶ underlyingGroup
  universalProperty : ∀ (H : AddCommGroupCat) (f : ∀ i : I, G i ⟶ H), ∃! φ : underlyingGroup ⟶ H, ∀ i, φ ∘ inclusion i = f i

structure DirectSumEvidence {I : Type} {G : I → AddCommGroupCat} (D : DirectSumPackage I G) where
  inclusionInjective : ∀ i : I, Function.Injective D.inclusion i
  universalPropertyClosed : D.universalProperty

def DirectSumClosed {I : Type} {G : I → AddCommGroupCat} (D : DirectSumPackage I G) : Prop :=
  ∀ i : I, Function.Injective D.inclusion i ∧ D.universalProperty

theorem direct_sum_closed_from_evidence {I : Type} {G : I → AddCommGroupCat}
    (D : DirectSumPackage I G) (E : DirectSumEvidence D) : DirectSumClosed D := by
  intro i
  exact And.intro (E.inclusionInjective i) E.universalPropertyClosed

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse
