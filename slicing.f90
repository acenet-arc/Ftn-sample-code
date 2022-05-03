program slice_example
    implicit none
    integer :: b2d(9,10)
    integer :: i,j

    do i=1, 9
        do j=1, 10
            b2d (i,j) = 10*i+(j-1)
        end do
    end do

    print *, 'First row:'
    print *, b2d( 1, : )
    print *, 'Part of row 4:'
    print *, b2d( 4, 3:9)
    print *, 'Part of column 4:'
    print *, b2d( 6:9, 4)
    print *, 'A 3x3 square from the interior:'
    print *, b2d( 6:8, 6:8)
end program
