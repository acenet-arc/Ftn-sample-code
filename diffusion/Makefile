all: diffusionf

F77=gfortran
MPIF77=mpif90
FFLAGS=-O2 -g

diffusionf: diffusion.f90
	${F77} ${FFLAGS} -o $@ $< 

clean:
	rm -rf diffusionf
	rm -rf *.o
	rm -rf *~
