program main
integer, parameter :: r20 = selected_real_kind(20, 100)
real * 4        :: a = 1./3.
real * 8        :: b = 1./3.
real (kind=r20) :: c = 1./3.
print *, '  precision                  size  value'
print *, precision(a), sizeof(a), a
print *, precision(b), sizeof(b), b
print *, precision(c), sizeof(c), c
end program
