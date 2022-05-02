program exitcycle
integer :: i, j
print*,'------exit at 3-------'
do i = 1, 5
		if (i == 3) exit
		print *, "Hello", i
end do
print*,'------cycle at 3-------'
do j = 1, 5
		if (j == 3) cycle
		print *, "Hello", j
end do
end program
