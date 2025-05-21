program print_demo
implicit none
real, parameter :: a = 1.0, b=-10.0
integer, parameter :: i = 272, j = -314159
print *, 'Hello world'
print *, a, b
print 100, a, b
100 format(2F6.1)
print 200, '12345678901234567890'
200 format(A20)
print 300, i, j
300 format(2I10)
end program
