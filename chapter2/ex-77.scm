; 因为之前的复数表示只有一层标志 -- rectangular 或 polar
; 而现在有两层, 所以要为 complex 包中加入对应的选择函数

; apply-generic 调用了两次，第一次除去 complex 标志，调用
; complex 包中的 magnitude 函数, 第二次出去 rectangular 
; 标志, 调用 rectangular 中的 magnitude 函数
