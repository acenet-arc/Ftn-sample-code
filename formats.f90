program read_demo
implicit none
real :: a, b
integer :: i, j
print *, 'Enter two floating point numbers and two integers, please:'
read *, a, b, i, j
print *, a, b
print 100, a, b
100 format(2F6.1)
print 200, '12345678901234567890'
200 format(A20)
print 300, i, j
300 format(2I10)
end program
