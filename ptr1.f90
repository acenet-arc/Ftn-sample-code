program pointer1
integer, pointer :: p1                 ! pointer to integer
real, pointer, dimension (:) :: pra    ! ptr to 1-dim real array
real, pointer, dimension (:,:) :: pra2 ! ptr to 2-dim real array
integer, target :: t1 = -1
p1 => t1			! pointer association operator
p1 = 42
print *, p1, t1
end program
