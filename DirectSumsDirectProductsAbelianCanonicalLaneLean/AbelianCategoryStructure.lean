import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectSumsDirectProductsAbelianCanonicalLaneLean

structure AbelianCategoryPackage (Obj : Type u) [CategoryTheory.Category Obj] where
  zeroObject : Obj
  kernels : ∀ {X Y : Obj} (f : X ⟶ Y), Obj
  cokernels : ∀ {X Y : Obj} (f : X ⟶ Y), Obj
  abelianClosed : Prop
  abelianClosedTerm : abelianClosed

structure AbelianCategoryEvidence {Obj : Type u} [CategoryTheory.Category Obj]
    (P : AbelianCategoryPackage Obj) where
  abelianClosedWitness : P.abelianClosed

def AbelianCategoryClosed {Obj : Type u} [CategoryTheory.Category Obj]
    (P : AbelianCategoryPackage Obj) : Prop :=
  P.abelianClosed

theorem abelian_category_closed_from_evidence
    {Obj : Type u} [CategoryTheory.Category Obj]
    (P : AbelianCategoryPackage Obj) (E : AbelianCategoryEvidence P) :
    AbelianCategoryClosed P := by
  exact E.abelianClosedWitness

end DirectSumsDirectProductsAbelianCanonicalLaneLean
end HautevilleHouse