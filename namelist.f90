program namelist_example
  character (len=256) :: grid_name
  integer :: grid_dim
  real :: grid_init_value

  namelist /myparams/ grid_name,grid_dim,grid_init_value
  
  grid_dim=10
  grid_init_value=10.0
  grid_name="testing"
  
  open(unit=10,file="parameters.nml")
  read(10,myparams)
  close(10)

  print *, "grid_dim: ",grid_dim
  print *, "grid_name: ",grid_name
  print *, "grid_init_value:", grid_init_value
end program
