       program diffuse
       implicit none
!
! Simulation parameters
!
       integer :: totpoints
       real    :: xleft, xright
       real    :: kappa
       integer :: nsteps, printsteps
!
! Storage for the positions (x), the calculated temperature, 
! and the analytical solution, "theory".
!
       real, allocatable           :: x(:)
       real, allocatable, target   :: temperature(:,:)
       real, allocatable           :: theory(:)
       real, dimension(:), pointer :: old, new, tmp
       real :: fixedlefttemp, fixedrighttemp

       integer :: step
       integer :: i
       integer :: red, grey, white
       real :: time
       real :: dt, dx
       real :: error
!
! Parameters of the original temperature distribution
!
       real :: a0, sigma0
       real :: a, sigma
!
! Read parameters
!
       namelist /grid/ totpoints,xleft,xright,kappa,nsteps,printsteps
       namelist /physics/ a0,sigma0
       open(10,file="diffusion_params.nml")
       read(10,grid) 
       read(10,physics)
       close(10)
!
! Cell size and timestep size
!
       dx = (xright-xleft)/(totpoints-1)
       dt = dx**2 * kappa/10.
! 
! Allocate data, including ghost cells, for old and new timesteps.
! Theory doesn't need ghost cells, but we include them for simplicity.
!
       allocate(temperature(totpoints+2,2))
       allocate(theory(totpoints+2))
       allocate(x(totpoints+2))
!
! Set up initial conditions
!
       old => temperature(:,1)
       new => temperature(:,2)
       time = 0.
       x = xleft + [((i-1+0.5)*dx,i=1,totpoints+2)]
       old    = a0*exp(-(x)**2 / (2.*sigma0**2))
       theory = a0*exp(-(x)**2 / (2.*sigma0**2))

       fixedlefttemp = a0*exp(-(xleft-dx)**2 / (2.*sigma0**2))
       fixedrighttemp= a0*exp(-(xright+dx)**2 / (2.*sigma0**2))

       write(*,*) '#Step        Time     rms Err    max Temp'
!
! Evolve
!
       do step=1, nsteps
!
! Boundary conditions: keep endpoint temperatures fixed.
!
           old(1) = fixedlefttemp
           old(totpoints+2) = fixedrighttemp
!
! Update solution
!
           forall (i=2:totpoints+1)
               new(i) = old(i) + dt*kappa/(dx**2) * &
                         (old(i+1) - 2*old(i) + old(i-1))
           end forall
           time = time + dt
! 
! Update analytical (correct) solution
!
           sigma = sqrt(2.*kappa*time + sigma0**2)
           a = a0*sigma0/sigma
           theory = a*exp(-(x)**2 / (2.*sigma**2))

           error = sqrt(sum((theory(1:totpoints+1) - new(1:totpoints+1))**2))
           if (mod(step, printsteps) == 0) then
               write(*,'(I6,E12.4,E12.4,F12.6)')  step, time, error, maxval(new)
           end if

           tmp => old
           old => new
           new => tmp
       enddo
!
! Dump final temperature profile to a file for plotting
!
       open(11,file="final_temperature.csv")
       write(11,*) 'x,temperature'
       do i=1, totpoints+2
           write(11,*) x(i),',',new(i)
       end do
       close(11)

       deallocate(temperature)
       deallocate(theory)
       deallocate(x)
       end
