# Print a calendar of this month and the two surrounding months.


# current date and weekday
y‿m‿d‿wd ← •BQN 1⊑ •SH ⟨"date", "+%Y‿%m‿%d‿%w"⟩
m‿d -↩ 1

# number of days in a month
Leap ← ≠´0=4‿100‿400|¨⊣
Days ← ⊢◶31‿(28+Leap)‿31‿30‿31‿30‿31‿31‿30‿31‿30‿31

# number of days and starting weekday of these three months
Offset ← {y‿m𝕊o: x←o+m+12×y ⋄ ⟨⌊x÷12,12|x⟩}
⟨prev,cur,·⟩ ← counts ← Days´¨ y‿m⊸Offset¨ ¯1‿0‿1
starts ← 7 | ⟨wd-d+prev, wd-d, cur+wd-d⟩

# format a single month as rank-2 character array
S ← ⥊⟜⟨"    "⟩
Chart ← { ∾˘ 6‿7⥊ (S𝕨)∾((¯4↑•Fmt)¨1+↕𝕩)∾(S 42) }


# output
•Out (32⥊" ")∾•Fmt⟨y,m+1,d+1⟩
•Out˘ (∾⟜"  │"⊸∾)˘˝> starts Chart¨ counts
