! Mandelbrot set generator, with inspiration from
!   Chandra et al, "Parallel Programming in OpenMP", and
!   http://en.wikipedia.org/wiki/Mandelbrot_set#For_programmers
! Ross Dickson, ACENET, 2010.06.24, 2025.05.06 etc 

module mandelbrot
contains

   integer function mandelbrot_val(x0, y0, maxiter_in)
   ! Is point (x0,y0) in the Mandelbrot set?  
   ! If so return maxiter (default value of 999),
   ! else return the number of iterations taken before divergence.
   double precision, intent(in) :: x0, y0
   integer, intent(in), optional :: maxiter_in
   integer :: iter, maxiter
   double precision :: x, y, xtemp
   
   if (present(maxiter_in)) then
      maxiter = maxiter_in
   else
      maxiter = 999
   end if
   
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

end module

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
program mandel

use mandelbrot
implicit none
double precision :: xmin, xmax, ymin, ymax
integer:: x_resolution, y_resolution
integer,allocatable :: image(:,:)
integer :: i, j
double precision :: x, y
character(10) :: linefmt

read(*,*) xmin, xmax, ymin, ymax
read(*,*) x_resolution, y_resolution
allocate(image(x_resolution,y_resolution))
write(*,*) xmin, xmax, ymin, ymax
write(*,*) x_resolution, y_resolution

do i = 1, x_resolution
    do j = 1, y_resolution 
        x = xmin + i*(xmax-xmin)/x_resolution
        y = ymin + j*(ymax-ymin)/y_resolution
        image(i, j) = mandelbrot_val(x, y)
    end do
end do

do j = y_resolution, 1, -1
    write(*,'(*(I4))') image(:, j)
end do

end program
