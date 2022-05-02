program writeread
   parameter(npart=100)
   double precision x(npart), y(npart), p(npart), q(npart)
   ! generate data  
   do i=1,npart
      x(i) = i * 0.1
      y(i) = sin(x(i))
   end do
   ! write output data on to a file 
   open(1, file='output.dat', status='new')
   do i=1,npart
      write(1,*) x(i), y(i)
   end do
   close(1)
   ! opening the file for reading
   open(2,file='output.dat',status='old')
   do i=1,npart
      read(2,*)p(i), q(i)
   end do
   close(2)
   ! print to stdout
   do i=1,npart
     write(*,*) p(i), q(i)
  end do
end program
