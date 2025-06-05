program exitcycle
integer :: i
print*,'------exit at 3-------'
do i = 1, 5
	if (i == 3) exit
	print *, i
end do
print*,'------cycle at 3-------'
do i = 1, 5
	if (i == 3) cycle
	print *, i
end do
end program
