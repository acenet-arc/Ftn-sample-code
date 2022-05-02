program main
Implicit none
! This a comment
    integer :: a = 5 ; real :: b = 10.5, c
    c = a + b ; print*, 'c = ', & ! Ampersand to
            ! continue in the next line
    c
 end program main

