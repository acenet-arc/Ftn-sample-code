program arrayReshape
implicit none

real, dimension (9)  :: a = (/ 21, 22, 23, 24, 25, 26, 27, 28, 29 /)
real, dimension (1:3, 1:3) :: b
integer :: i, j

b = reshape( a, (/3, 3/) )

do i = 1,3
   write(*,*) (b(i,j), j=1,3)
end do
end program
