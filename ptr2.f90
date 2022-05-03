program pointer_example
    implicit none

    real, pointer :: pa   
    integer, pointer :: pb(:)     
    integer, pointer :: pc(:,:) 
    
    real, target :: a = 10.0
    integer, target :: b2d(9,10)
    integer :: i,j

    nullify (pa, pb, pc)
    pa => a                ! pa =10.0 
    do i=1, 9
        do j=1, 10
            b2d (i,j) = 10*i+(j-1)
        end do
    end do
    pb => b2d(1,:)         !pb=10,11,12,….
    pb => b2d(4,3:9)       !pb=42,43,44,…
    pb => b2d(6:9,4)       !pb=63,73,83,93
    pc => b2d(6:8,6:8)     !65,66,…
    pc = 1
end program
