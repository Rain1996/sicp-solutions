; 假设 (try try) 能返回一个值, 那么 (halts? try try) 的结果是 true
; 就会进入 (run-forever) 这个分支，结果就是会永远运行下去
; 假设 (try try) 不能返回一个值, 那么 (halts? try try) 的结果是 false
; 就会返回 'halted, 结果就是返回一个值
; 综上, halts? 过程不可能被写出
