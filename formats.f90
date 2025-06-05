program read_demo
implicit none
real :: a, b
integer :: i, j

print *, 'Enter two floating point numbers and two integers, please:'
read *, a, b, i, j

print *
print *, 'Default (list-directed) formatting for reals:'
print *, a, b

print *
print *, 'Formatted 2F10.1:'
print 100, a, b
100 format(2F10.1)

print *
print *, 'Formatted 2E12.3:'
print '(2E12.3)', a, b        ! format can be inline instead of a statement

print 200
200 format(/,'12345678901234567890')  ! / gives newline, aka "vertical tab"
print '(2I10)', i, j 

end program
