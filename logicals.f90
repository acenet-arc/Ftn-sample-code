program truefalse
logical :: a = .TRUE.
logical :: b = .False.
print *, (a .and. b)
print *, (a .eqv. .not.b)
end program
