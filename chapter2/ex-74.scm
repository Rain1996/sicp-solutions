 ; a) 
 (define (get_record division employee_name) 
   ((get division 'record) employee_name)) 
  
 ; b) 
 (define (get_salary division record) 
   ((get division 'salary) record)) 
  
 ; c) 
 (define (find_employee_record employee_name division_list) 
    (if (null? division_list) 
        False 
        (or (get_record (car division_list) employee_name) 
            (find_employee_record employee_name (cdr division_list)))))

; d) 以新分支的名字为键将对应的函数（get_record, get_salary）安装到系统中
