! Demonstrate basic elementwise operations on arrays
program arrayops

real :: a(5) = [2., 4., 6., 8., 10.]
real :: b(5) = [1., 3., 5., 7., 9.]
real :: c(5)

c = 1.         ! distribute scalar to each element
write(*,'(A3,5F7.2)') 'a: ',a
write(*,'(A3,5F7.2)') 'b: ',b
write(*,'(A3,5F7.2)') 'c: ',c

print *, 'c = c + a*b'
c = c + a * b  ! operate on corresponding elements
write(*,'(A3,5F7.2)') 'c: ',c

end program
