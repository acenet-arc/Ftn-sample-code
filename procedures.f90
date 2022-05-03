program main
   real :: a = 10.5, b = 2.0
   print *, a, b
   call swapreals(a, b)
   print *, a, b
   print *, proportion(a, b)
end program main

subroutine swapreals(x, y)
   real :: x, y, t
   t = x; x = y; y = t
end subroutine swapreals

function proportion(x, y)
   real :: x, y, proportion  ! matches name of function
   proportion = (x-y)/(x+y)
end function proportion
