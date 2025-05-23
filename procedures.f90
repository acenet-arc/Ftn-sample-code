program main
   use procedures_mod
   real :: a = 10.5, b = 2.0
   print *, a, b
   call swapreals(a, b)
   print *, a, b
   print *, proportion(a, b)
end program main

module procedures_mod
contains

subroutine swapreals(x, y)
   real :: x, y, t
   t = x; x = y; y = t
end subroutine swapreals

function proportion(x, y)
   real :: x, y, proportion  ! matches name of function
   proportion = (x-y)/(x+y)
end function proportion

end module procedures_mod
