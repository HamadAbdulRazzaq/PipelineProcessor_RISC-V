addi x10, x0, 200 				# Base Address of the array 
addi x11, x0, 40 				# Length of Array {x11 = len(A)}
#----Initializing the array----#
addi x9,  x0, 18
SW   x9,  0(x10)
addi x9,  x0, 62
SW   x9,  4(x10)
addi x9,  x0, 94
SW   x9,  8(x10)
addi x9,  x0, 63
SW   x9,  12(x10)
addi x9,  x0, 98
SW   x9,  16(x10)
addi x9,  x0, 46
SW   x9,  20(x10)
addi x9,  x0, 71
SW   x9,  24(x10)
addi x9,  x0, 66
SW   x9,  28(x10)
addi x9,  x0, 31
SW   x9,  32(x10)
addi x9,  x0, 75
SW   x9,  36(x10)
# Array Initialization Done
#----Sorting via insertion sort----#
addi x1, x0, 4 					# j = 1 {x1 = j}
blt  x1, x10, Outer_Loop 		# if j < len(A) -> Start the loop
Outer_Loop:
add  x3, x1, x10 				# j + base address
LW   x4, 0(x3) 					# key = A[j] {x4 = A[j]}
addi x5, x1, -4 				# i = j - 1 {x5 = i}
add  x6, x5, x10 				# i + base address
LW   x7, 0(x6) 					# {x7 = A[i]}
ble  x5, x0, Inner_Loop_Exit    # if i <= 0 -> break
ble  x7, x4, Inner_Loop_Exit 	# if A[i] <= key -> break
Inner_Loop:
SW   x7, 4(x6)					# A[i+1] = A[i]
addi x5, x5, -4 				# i = i - 1
add  x6, x5, x10 				# i + base address
LW   x7, 0(x6) 					# {x7 = A[i]}
ble  x5, x0, Inner_Loop_Exit 	# if i <= 0 -> break
bgt  x7, x4, Inner_Loop 		# if A[i] > key -> continue
Inner_Loop_Exit:
SW   x4, 4(x6) 					# A[i+1] = key
addi x1, x1, 4 					# j = j + 1
blt  x1, x11, Outer_Loop 		# if j< Len(A) -> continue
#----End of Code----#







