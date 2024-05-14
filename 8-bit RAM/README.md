- Depth of memory is assumed to be 16-bits, so we are keeping address as 4-bits. 2^4 = 16.

- there is no reset pin in the design. Based on WR being 1/0,data will be written-to or read-from the memory.

- constraint added for addr == 3, to be able to write and read back 10 txns from the same location. Constraints can be modified as per requirement


