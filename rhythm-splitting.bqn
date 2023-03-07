# Music notation: break rhythmic values into correctly tied notes

# naive: no syncopation or dotted notes
# top-down, recursive
# probably a left-to-right algorithm will be better in the end

Match ← {𝕩⊔˜/𝕩⍋⌾(+`)𝕨}   # match tied (split) durations to unsplit durations
# e.g. 1‿3‿6‿1‿1 Match 1‿2‿1‿4‿2‿1‿1
# assumes:
#   - ∧´𝕩>0
#   - 𝕩≡○(+´)𝕨
#   - ∧´𝕨∊○(+`)𝕩
# ensures:
#   - 𝕩≡∾ 𝕨𝕊𝕩
#   - 𝕨≡+´¨ 𝕨𝕊𝕩

Break ← {
  "total duration should be power of 2" ! ⌊⊸=2⋆⁼+´𝕩
  𝕩 Match { ⟨a⟩:⟨a⟩ ;
    l←𝕊n∾˜𝕩(</⊣)n ←(¯1⊑𝕩)÷2
    r←𝕊⌾(-⟜n)𝕩(>/⊣)n
    l∾r }⌾(+`) 𝕩
}

l←16÷ Break ⟨2,4,1,1,2,2,4,5,3,8⟩

# LilyPond notation
Splice ← {a‿z𝕊𝕩:(-≠z)↓∾{a∾𝕩∾z}¨𝕩}
•Out ""‿" "Splice{"a"‿"~ "Splice•Fmt¨𝕩}¨ l
