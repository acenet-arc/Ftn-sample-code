program mandel

! Mandelbrot set generator, with inspiration from
!   Chandra et al, "Parallel Programming in OpenMP", and
!   http://en.wikipedia.org/wiki/Mandelbrot_set#For_programmers
! Ross Dickson, ACENET, 2010.06.24, 2025.05.06 etc 
implicit none
integer,parameter :: maxiter=999
double precision,parameter :: xmin=-2.d0,xmax=1.d0
double precision,parameter :: ymin=-1.d0,ymax=1.d0
character(len=5) :: cmd_line_arg
integer:: x_resolution=30, y_resolution=20
integer,allocatable :: image(:,:)
integer :: i, j
double precision :: x, y
integer :: mandelbrot_val
character(10) :: linefmt

if (command_argument_count() == 2) then 
    call get_command_argument(1, cmd_line_arg)
    read(cmd_line_arg,'(i6)') x_resolution
    call get_command_argument(2, cmd_line_arg)
    read(cmd_line_arg,'(i6)') y_resolution
end if
write(*,*) 'Resolution: ',x_resolution,' X ',y_resolution
allocate(image(y_resolution,x_resolution))

do i = 1, x_resolution
    do j = 1, y_resolution 
        x = xmin + i*(xmax-xmin)/x_resolution
        y = ymin + j*(ymax-ymin)/y_resolution
        image(j, i) = mandelbrot_val(x, y, maxiter)
    end do
end do

do j = y_resolution, 1, -1
    write(*,'(*(I4))') image(j,:)
end do

end program

integer function mandelbrot_val(x0, y0, maxiter)
! Is point (x0,y0) in the Mandelbrot set?   If so return maxiter,
! else return the number of iterations taken to show non-membership.
double precision, intent(in) :: x0, y0
integer, intent(in) :: maxiter
double precision :: x, y, xtemp
integer :: iter

x = 0.d0
y = 0.d0
iter = 0
do while (( x*x + y*y <= 4.d0 ) .and. ( iter < maxiter ))
   xtemp = x*x - y*y + x0
   y = 2*x*y + y0
   x = xtemp
   iter = iter + 1
end do
mandelbrot_val = iter
end function
