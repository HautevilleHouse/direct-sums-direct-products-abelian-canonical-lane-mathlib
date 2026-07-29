import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure DirectProductPackage (I : Type) (G : I → AddCommGroupCat) where
  underlyingGroup : AddCommGroupCat
  projection : ∀ i : I, underlyingGroup ⟶ G i
  universalProperty : ∀ (H : AddCommGroupCat) (f : ∀ i : I, H ⟶ G i), ∃! φ : H ⟶ underlyingGroup, ∀ i, projection i ∘ φ = f i

structure DirectProductEvidence {I : Type} {G : I → AddCommGroupCat} (P : DirectProductPackage I G) where
  projectionSurjective : ∀ i : I, Function.Surjective P.projection i
  universalPropertyClosed : P.universalProperty

def DirectProductClosed {I : Type} {G : I → AddCommGroupCat} (P : DirectProductPackage I G) : Prop :=
  ∀ i : I, Function.Surjective P.projection i ∧ P.universalProperty

theorem direct_product_closed_from_evidence {I : Type} {G : I → AddCommGroupCat}
    (P : DirectProductPackage I G) (E : DirectProductEvidence P) : DirectProductClosed P := by
  intro i
  exact And.intro (E.projectionSurjective i) E.universalPropertyClosed

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse
