### Section 7: Partitions on Yeti

**Partitions** organize nodes into logical sets (possibly overlapping groups of nodes so that nodes can be in multiple partitions). Each partition has different constraints such as job time limit, job size limit, min CPU's required, and so on. 

#### **normal partition** 

Maximum wall time: 7 days. 

60 distributed memory compute nodes (1200 CPU cores total):

- each node has 2 x 10 core "Ivy Bridge" CPU's 

On Yeti, they are n3-[85-144].

![distributed](img/distributed.png)

#### UV partition

Maximum wall time: 3 days.

3 shared memory compute nodes (512 CPU cores and 35,072 GPU cores and 366 Coprocessor cores):

- 1 SGI UV2000 node (on Yeti, you will see this node as UV00000437-P001)
  - 32 x 8 core "Ivy Bridge" CPU's (256 CPU cores)
  - 4 TB RAM
  - 8 Quadro GPU's with 640 CUDA cores (5,120 GPU cores)
- 2 SGI UV300 nodes (on Yeti, they are UV00000395-P001and UV00000395-P002)
  - 8 x 16 core "Haswell" CPU's (256 CPU cores)
  - 2 TB RAM
  - 6 Telsa GPU's with 4,992 CUDA cores (29,952 GPU cores)
  - 6 Xeon Phi with 61 cores (366 Coprocessor cores)
  - 12 TB total for local scratch or short term use

#### **large** partition

Maximum wall time: 3 days

Minimum CPU's required: 240 CPU's

60 distributed memory nodes (1440 CPU cores):

- each node has 2 x 12 core "Haswell" CPU's 

On Yeti, they are n3-[145-204].



#### **long** partition

Maximum wall time: 30 days

60 distributed memory compute nodes (1200 CPU cores total):

- each node has 2 x 10 core "Ivy Bridge" CPU's 

On Yeti, they are n3-[85-144].

------

Go to Section 8: [Linux/Command Line](Linux.md)