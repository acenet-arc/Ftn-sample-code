program product
implicit none
......., parameter :: lines = 5
....... :: line
real :: x, y
open(1, file=...........,  status= .....)
open(2, file=............, status= .....)
do .....
   read(....)  x, y
   write(....) x, y, x*y
end do
close(1)
close(2)
end program
