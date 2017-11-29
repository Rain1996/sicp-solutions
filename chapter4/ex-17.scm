; 为什么对于变换之后的程序多了一个框架？
; 因为 let 表达式是语法糖, 实际上会替换成 lambda 表达式，而 lambda 表达式会扩展环境

; 为什么环境结构的这种差异不会造成正确程序的不同行为方式
; 新的环境限定在 let 表达式，不会影响外部环境

; 设计一种方式，使解释器能实现内部定义的“同时性”作用域规则，而又不需要构造额外的框架
; =_= 不会
