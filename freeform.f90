program freeform
implicit none
    ! This a comment
    integer :: a = 5 ; real :: b = 10.5, c
    c = a + b
    print*, 'c = ', &
             c      ! continuation of previous line
end program
