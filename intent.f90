subroutine swapreals(x, y)
   real,intent(in) :: x, y
   real :: t
   t = x; x = y; y = t
end subroutine swapreals

program main
   real :: a = 10.5, b = 2.0
   print *, a, b
   call swapreals(a, b)
   print *, a, b
end program main
