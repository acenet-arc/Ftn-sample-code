program main
integer, parameter :: r15 = selected_real_kind(15, 50)
real (kind=r15) :: a = 1./3.
real * 8        :: b = 1./3.
real * 4        :: c = 1./3.
print *, 'value                   precision'
print *, a, precision(a)
print *, b, precision(b)
print *, c, precision(c)
end program
