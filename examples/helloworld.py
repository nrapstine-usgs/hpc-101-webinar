from mpi4py import MPI
import sys

message = "Hello World!  I'm process %d of %d on %s.\n"

myrank = MPI.COMM_WORLD.Get_rank()
numberproc = MPI.COMM_WORLD.Get_size()
procname = MPI.Get_processor_name()
sys.stdout.write(message % (myrank,numberproc,procname))
