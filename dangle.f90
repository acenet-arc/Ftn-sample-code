! Demonstrate dangling pointer problem.
! Run with different compilers to demonstrate
! different behavior, e.g. gfortran vs ifort
program dangle
integer, pointer :: p1, p2
allocate(p1)
p2 => p1
p2 = 99
print *, p1, p2
deallocate(p1)  ! ERROR dangling pointer
print *, p2
end program
