.data 

	message1: .asciiz "For how many days do you have sales amounts? \n"
	message2: .asciiz "Enter the sales for day "
	message3: .asciiz ": " 
	message4: .asciiz "\n the total sales are $" 
	
.text 

	# Display message1
	li $v0,4
	la $a0, message1
	syscall 
	
	# reading in a integer value from the user
	li $v0,5
	syscall
	move $s0,$v0 # $s0 = days
	
		
forLoop:

	bge $s1,$s0,exitLoop # if count > =  days branch outto exitLoop
	
	#move $f0,$0 # sale = 0.00
	addi $s1,$s1,1 # count++
	# Display message1
	li $v0,4
	la $a0, message2
	syscall 
	
	# Display the current day
	li $v0,1
	move $a0,$s1
	syscall
	
	# Display the message3
	
	li $v0,4
	la $a0, message3
	syscall 
	
	
	li $v0, 6
	syscall
	
	
	
	add.s $f1,$f1,$f0   # total = $f1 = $f1 + $f0
	
	
       b forLoop
       
  exitLoop:
  	# Display the message4	
	li $v0,4
	la $a0, message4
	syscall 
	
	li $v0,2
	add.s $f12,$f12,$f1
	syscall
  
  	li $v0, 10
 	syscall
  