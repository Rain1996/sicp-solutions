; z1 -> [ | ]
;        | |
;        v v
; x --> [ | ] -> [ | ] -> '()
;        |        |
;        v        v
;       'wow     'b

; z2 -> [ | ] -> [ | ] -> [ | ] -> '()
;        |        |        |
;        |        v        v
;        |       'a       'b
;        |                 ^
;        |                 |
;         -----> [ | ] -> [ | ] -> '()
;                 |
;                 v
;                'wow
