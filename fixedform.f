      program main
C  This is a comment.
      integer i
      real a, b, c
      read(*,*) a, b, c
      do 100 i = 1, 10
         a = (a + b - c)
     +       / (a + b + c)      
  100 continue
      stop
      end
