# Music notation: break rhythmic values into correctly tied notes

# naive: no syncopation or dotted notes
# top-down, recursive
# probably a left-to-right algorithm will be better in the end

Match â {ð©âË/ð©ââ¾(+`)ð¨}   # match tied (split) durations to unsplit durations
# e.g. 1â¿3â¿6â¿1â¿1 Match 1â¿2â¿1â¿4â¿2â¿1â¿1
# assumes:
#   - â§Â´ð©>0
#   - ð©â¡â(+Â´)ð¨
#   - â§Â´ð¨ââ(+`)ð©
# ensures:
#   - ð©â¡â¾ ð¨ðð©
#   - ð¨â¡+Â´Â¨ ð¨ðð©

Break â {
  "total duration should be power of 2" ! ââ¸=2ââ¼+Â´ð©
  ð© Match { â¨aâ©:â¨aâ© ;
    lâðnâ¾Ëð©(</â£)n â(Â¯1âð©)Ã·2
    râðâ¾(-ân)ð©(>/â£)n
    lâ¾r }â¾(+`) ð©
}

lâ16Ã· Break â¨2,4,1,1,2,2,4,5,3,8â©

# LilyPond notation
Splice â {aâ¿zðð©:(-â z)ââ¾{aâ¾ð©â¾z}Â¨ð©}
â¢Out ""â¿" "Splice{"a"â¿"~ "Spliceâ¢FmtÂ¨ð©}Â¨ l
