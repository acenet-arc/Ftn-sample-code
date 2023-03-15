! Demonstrates that 'reshape()' makes a copy
program arrayReshape
implicit none

real, dimension (9)  :: a = (/ 21, 22, 23, 24, 25, 26, 27, 28, 29 /)
real, dimension (1:3, 1:3) :: b
integer :: i, j

b = reshape( a, (/3, 3/) )

write(*,'(9f6.1)') a
do i = 1,3
   write(*,'(3f6.1)') (b(i,j), j=1,3)
end do

a(1) = 99.0

write(*,'(9f6.1)') a
do i = 1,3
   write(*,'(3f6.1)') (b(i,j), j=1,3)
end do

end program
