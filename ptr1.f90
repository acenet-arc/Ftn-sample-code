program pointer1
integer, pointer :: p1                 ! pointer to integer
integer, target :: t1 = -1
p1 => t1			! pointer association operator
p1 = 42
print *, p1, t1
end program
