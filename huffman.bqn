# Find and use a Huffman code for given text

Huffman ← {
  t ← 𝕩{⟨𝕨,⟨⟨𝕩,""⟩⟩⟩}¨↕≠𝕩  # [⟨prob,[⟨idx,code⟩]⟩]
  Prepend←{𝕨⊸∾⌾(1⊸⊑)¨𝕩}    # sym 𝕊 [⟨idx,code⟩]
  Combine←{ ⟨a,as⟩𝕊⟨b,bs⟩: ⟨a+b, ∾0‿1 Prepend¨as‿bs⟩ }
  Step ← {s←∧𝕩 ⋄ (<Combine´2↑s) ∾ 2↓s}
  ∾∘⊔˝ ⍉>1⊑⊑ Step⍟((≠t)-1) t
}
Freq ← { (∊𝕩) / (𝕩∾¨1+⊒⌾⌽𝕩) }
MakeTable ← {>Huffman⌾(1⊸⊑¨)Freq 𝕩}

# table {Encode|Decode} text
Encode ← { ⟨syms,encs⟩←<˘⍉𝕨 ⋄ ∾(syms⊐𝕩)⊏encs }
Decode ← { ·𝕊"": ⟨⟩;
  i←⊑/{𝕨≡(≠𝕨)↑𝕩}⎊0⟜𝕩¨ 1⊏⍉𝕨
  ⟨sym,enc⟩←i⊏𝕨
  sym ∾ (𝕨 Decode (≠enc)↓𝕩)
}

ToBytes ← 2⊸×⊸+˜´¨ {𝕩⊔˜⌊÷⟜8↕≠𝕩}
FromBytes ← ∾ {2|⌊𝕩÷2⋆↕8}¨

s ← "panama, a camel, animal, canada"

•Show table ← MakeTable s
•Show ⟨len,encoded⟩ ← (≠⋈ToBytes) table Encode s
•Show table Decode len ↑ FromBytes encoded
