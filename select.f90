program main
implicit none
integer :: hours24, hours12
character (len=2) :: am_pm

print*, 'Please input the 24-hour time:'
read (*,*) hours24
select case (hours24)
case (0)
    hours12 = 12
    am_pm = 'AM'
case (1:11)
    hours12 = hours24
    am_pm = 'AM'
case (12)
    hours12 = hours24
    am_pm = 'PM'
case (13:23)
    hours12 = hours24-12
    am_pm = 'PM'
case default
    print *, 'Invalid input?'
    hours12 = hours24
    am_pm = '??'
end select
print*, '12-hour clock shows: ',  hours12, am_pm
end program main 
