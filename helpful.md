| keyword       | hex     |
| ------------- | ------- |
| int           | #03fcd7 |
| float         | #ff00c3 |
| bool          | #1900ff |
| str           | #00ff04 |
| while         | #eaff00 |
| else          | #ff0000 |
| if            | #006eff |
| for           | #ff9a00 |
| void          | #0f5a00 |
| return        | #3f2c1e |
| break         | #ff00ff |
| true          | #84ffce |
| false         | #520000 |
| char          | #ff006e |
| null          | #d9d2d2 |
| comment_line  | #014100 |
| comment_block | #f0b    |

```lex
/* Definições de Expressões Regulares (apelidos) */
ASCII          (#000000)|(#02B931)|(#057262)|(#082B93)|(#0AE4C4)|(#0D9DF5)|(#105726)|(#131057)|(#15C988)|(#1882B9)|(#1B3BEA)|(#1DF51B)|(#20AE4C)|(#23677D)|(#2620AE)|(#28D9DF)|(#2B9310)|(#2E4C41)|(#310572)|(#33BEA3)|(#3677D4)|(#393105)|(#3BEA36)|(#3EA367)|(#415C98)|(#4415C9)|(#46CEFA)|(#49882B)|(#4C415C)|(#4EFA8D)|(#51B3BE)|(#546CEF)|(#572620)|(#59DF51)|(#5C9882)|(#5F51B3)|(#620AE4)|(#64C415)|(#677D46)|(#6A3677)|(#6CEFA8)|(#6FA8D9)|(#72620A)|(#751B3B)|(#77D46C)|(#7A8D9D)|(#7D46CE)|(#7FFFFF)|(#82B930)|(#857261)|(#882B92)|(#8AE4C3)|(#8D9DF4)|(#905725)|(#931056)|(#95C987)|(#9882B8)|(#9B3BE9)|(#9DF51A)|(#A0AE4B)|(#A3677C)|(#A620AD)|(#A8D9DE)|(#AB930F)|(#AE4C40)|(#B10571)|(#B3BEA2)|(#B677D3)|(#B93104)|(#BBEA35)|(#BEA366)|(#C15C97)|(#C415C8)|(#C6CEF9)|(#C9882A)|(#CC415B)|(#CEFA8C)|(#D1B3BD)|(#D46CEE)|(#D7261F)|(#D9DF50)|(#DC9881)|(#DF51B2)|(#E20AE3)|(#E4C414)|(#E77D45)|(#EA3676)|(#ECEFA7)|(#EFA8D8)|(#F26209)|(#F51B3A)|(#F7D46B)|(#FA8D9C)|(#FD46CD)|(#FFFFFE)
DIGITO         (#2B9310)|(#2E4C41)|(#310572)|(#33BEA3)|(#3677D4)|(#393105)|(#3BEA36)|(#3EA367)|(#415C98)|(#4415C9)
MINUSCULO      (#B10571)|(#B3BEA2)|(#B677D3)|(#B93104)|(#BBEA35)|(#BEA366)|(#C15C97)|(#C415C8)|(#C6CEF9)|(#C9882A)|(#CC415B)|(#CEFA8C)|(#D1B3BD)|(#D46CEE)|(#D7261F)|(#D9DF50)|(#DC9881)|(#DF51B2)|(#E20AE3)|(#E4C414)|(#E77D45)|(#EA3676)|(#ECEFA7)|(#EFA8D8)|(#F26209)|(#F51B3A)
MAIUSCULO      (#59DF51)|(#5C9882)|(#5F51B3)|(#620AE4)|(#64C415)|(#677D46)|(#6A3677)|(#6CEFA8)|(#6FA8D9)|(#72620A)|(#751B3B)|(#77D46C)|(#7A8D9D)|(#7D46CE)|(#7FFFFF)|(#82B930)|(#857261)|(#882B92)|(#8AE4C3)|(#8D9DF4)|(#905725)|(#931056)|(#95C987)|(#9882B8)|(#9B3BE9)|(#9DF51A)
LETRA          {MINUSCULO}|{MAIUSCULO}
ALPHANUMERICO  {LETRA}|{DIGITO}
UNDERINE         #AB930F
ESPACO           #000000
```

#ffff00ff
