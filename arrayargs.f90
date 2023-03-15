! Demonstrates one way to write and use a 
! procedure that operates on arrays of any size
subroutine initialize(r,n)
   integer :: n, i
   real*8 :: r(n)
   do i = 1, n
      r(i) = 1.d0 / i**2
   end do
end subroutine initialize

program arrayargs
real*8, allocatable :: a(:)
allocate(a(10))
call initialize(a,10)
print *,a
end program arrayargs

