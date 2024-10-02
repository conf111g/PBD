SELECT 
    `student`.`#stud` as 'Номер студента', `vedomost`.`date` as "Дата" ,`vedomost`.`mark` as "Успехи", `subject`.`subjname` as "наименование предмета"
FROM
    `vedomost`,`student`,`subject`
WHERE
   `vedomost`.`mark` = 'Зачтено' and `subject`.`subjname` = 'Изо' and `vedomost`.`date` = '2024-09-12' and  `subject`.`#subj` = `vedomost`.`subject_#subj` and `vedomost`.`student_#stud` = `student`.`#stud`;