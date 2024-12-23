! Compare performance of an array operation and an explicit loop.
!
! Credit to Paul Norvig's blog:
! https://www.paulnorvig.com/guides/modern-fortran-for-high-performance-computing.html
!
program array_ops_1
implicit none
integer, parameter :: n = 100000000
real(kind=8), dimension(n) :: x, y
integer :: i
real(kind=8) :: alpha = 0.5
real(8) :: start, finish

! Populate arrays with initial values
x = 1.0
y = 2.0

! Loop using array operations
call cpu_time(start)
y = y + alpha * x
call cpu_time(finish)
print *, 'Time using array ops:     ', finish - start, ' seconds'

! Explicit loop
call cpu_time(start)
do i = 1, n
   y(i) = y(i) + alpha * x(i)
end do
call cpu_time(finish)
print *, 'Time using explicit loop: ', finish - start, ' seconds'

! Observations
!
! gfortran,        12.3.1 on Intel Xeon 6248 CPU @ 2.50GHz: 0.178s, 0.268s
! gfortran -Ofast, 12.3.1 on Intel Xeon 6248 CPU @ 2.50GHz: 0.127s, 0.127s
!
! Using -Ofast erases the performance difference and improves both, but
! see https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html for risks.
!
! ifort         2021.10.0 on Intel Xeon 6248 CPU @ 2.50GHz: 0.128s, 0.128s
!
! Intel appears to find similar optimizations to gcc even with no flag.

end program array_ops_1

