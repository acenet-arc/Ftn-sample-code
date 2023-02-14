program product
implicit none
integer, parameter :: lines = 5
integer :: line
real :: x, y
open(1,file='input.dat', status= 'old' )
open(2,file='output.dat', status= 'new' )
do line=1,lines
   read(1,*)  x, y
   write(2,*) x, y, x * y 
end do
close(1)
close(2)
end program
