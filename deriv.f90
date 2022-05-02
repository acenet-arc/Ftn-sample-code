program main

type student_record
   character(len=20):: firstName, familyName
   integer:: age, id
   real:: gpa
end type

type(student_record):: students(500)
students(1) = student_record("Ann", "Lee", 19, 9876, 4.0)
print *, students(1)%familyName, students(1)%firstName

end program main
