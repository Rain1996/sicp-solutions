; 将系统的map版本作为基本过程安装到自己的元循环求值器中
; 在求值map表达式会得到以下过程
;    输入 (map + '(1 2) '(3 4))
; => eval 这个表达式，识别为 application
; => (eval (operator exp) env) 得到 (list 'primitive <map-proc>)
; => (list-of-values (operands exp) env) 得到 (list (list 'primitive <add-proc>) (list 1 2) (list 3 4))
; => (apply (list 'primitive <map-proc>) (list (list 'primitive <add-proc>) (list 1 2) (list 3 4)))
; => (apply-primitive-procedure (list 'primitive <map-proc>) (list (list 'primitive <add-proc>) (list 1 2) (list 3 4)))
; => (apply-in-underlying-scheme <map-proc> (list (list 'primitive <add-proc>) (list 1 2) (list 3 4)))
; => 由于(list 'primitive <add-proc>)不是可执行的过程，所以会导致报错。

; 而实现了map的定义，会在eval-sequence过程的作用下逐语句eval map 的定义。
; eval (list 'primitive <add-proc>) 可得到<add-proc>过程，所以不会报错
