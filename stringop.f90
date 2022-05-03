program stringops
  character (len=3) :: first, second
  character (len=6) :: name
  first = 'ACE'; second = 'NET'
  name = first//second
  print*, name, ' R'//name(1:3)
end program
