program arrayReshape
implicit none

real, dimension (9)  :: a = [ 11, 12, 13, 21, 22, 23, 31, 32, 33 ]
real, dimension (1:3, 1:3) :: b
integer :: i

b = reshape( a, [3, 3] )

do i = 1,3
   write(*,*) b(i,1), b(i,2), b(i,3)
end do
end program
