################################# Computer Architecture ##############################################
######################################  Project 1 ####################################################
#  Student 1 ---> Name: Osaid Nur		***** 	ID: 1210733
#  Student 2 ---> Name: Moath Wajeeh 	*****	ID: 1210125
#  Section   : 3
#  Dr.Aziz Qaroush

.data

# the file location (with file name)
#filedes: .asciiz "C:/Users/moath/Desktop/MedicalTest.txt"
filedes: .asciiz "C:/Users/Osaid/Documents/-----Workspace 1--------/MedicalTest.txt"

Filedes: .space 200
NEWLINE: .asciiz "\n"
COMMA: .asciiz ","
welc: .asciiz "Welcom To Patient Record Management System.\n"
bye: "The data in the file have been updated ...\nThank you for using our programe ...\n************* Good Bye *************\n"
menu: .asciiz "\n**************************************************\n Choose the operation :\n 1- Add a new medical test\n 2- Search for a test by patient ID\n 3- Search for unnormal tests\n 4- Average test value\n 5- Update an existing test result\n 6- Delete a test\n 7- Exit and write the data to the file\n"
forsecondchoice: .asciiz " choose the operation :\n 1- Retrieve all patient tests\n 2- Retrieve all up normal patient tests\n 3- Retrieve all patient tests in a given specific period\n"
foradding1: .asciiz "Enter the ID (integer of 7 digits only): "
foradding2: .asciiz "Enter the test name: "
foradding3: .asciiz "Enter the date of the test with formate YYYY-MM only: "
foradding4: .asciiz "Enter the Result of the test: "
foradding5: .asciiz "Enter the Systolic pressure result: "
foradding6: .asciiz "Enter the diastolic pressure result: "
forchoice : .asciiz ">> "

forupdate1: .asciiz "Enter the new ID (integer of 7 digits only): "
forupdate2: .asciiz "Enter the new test name: "
forupdate3: .asciiz "Enter the new date of the test (with formate YYYY-MM only): "
forupdate4: .asciiz "Enter the new Result of the test: "
forupdate5: .asciiz "Enter the new result for Systolic pressure: "
forupdate6: .asciiz "Enter the new result diastolic pressure: "

errorAdding1: .asciiz "Invalid ID Number ! , try again please ...\n"
errorAdding2: .asciiz "Invalid Test Name ! , try again please ... \n"
errorAdding3: .asciiz "Invalid Date ! , try again please ... \n"
errorAdding4: .asciiz "Invalid Result ! , try again please ... \n"


errorinfile: .asciiz "Error while opening the file !\n"
errorindata: .asciiz "The Error is in Row "
successopen: .asciiz "The file has opened succesfully...\n"
successread: .asciiz "Reading from file done, with this number of char: "
errorinread: .asciiz "Error while reading the file !\n"
errorinchoice: .asciiz "invalid input, try again !\n"
unknown: .asciiz "Unknown Error Occured , check the data in the file !\n"

# for average test values
avgvalues: "The average test values :\n"
hgbavg: .asciiz "HGB: "
bgtavg: .asciiz "BGT: "
ldlavg: .asciiz "LDL: "
bptavg: .asciiz "BPT: "

# measuring units
mmhg: .asciiz "mm Hg"
mgdl: .asciiz "mg/dL"
gdl: .asciiz "g/dL"

.align 2
strHGB: .byte 'H','G','B','\0'
strBGT: .byte 'B','G','T','\0'
strLDL: .byte 'L','D','L','\0'
strBPT: .byte 'B','P','T','\0'

comma_space: .asciiz ", "
semi_space: .asciiz ": "

fp2: .float 10.0 #for converting the string to floating point.
myFloat: .float 500.0
.align 1
idArr: .word 0:60 #initialize a 60 word in memory with zero value. each time i have to skip 32bit
testNameArr: .space 240 #this space is for the testname.(60*4=240B)
testDateArr: .space 480 # 60*8=420B
testResArr:  .space 960 #initialize a 60 word in memory with zero value(floating point use).
rowsLength : .space 60
.align 1
tempID : .space 8
tempRes: .space 8
tempName: .space 4
tempDate: .space 8
tempDate2: .space 8
systolic: .space 8
diastolic: .space 8
tempWrite: .space 8
toWrite: .space 8 
charToWrite: .space 2
.align 2
year: .space 8
month: .space 4
.align 2



OutputOfTheSearch1: .space 32
readBuffer: .space 5000 #This space is for the reading data from thie file.
writeBuffer: .space 5000 # this space will be written to the file

immfloat1: .float 13.8
immfloat2: .float 17.2
immfloat3: .float 70
immfloat4: .float 99
immfloat5: .float 100
immfloat6: .float 120
immfloat7: .float 80
foradding321: .asciiz "Enter the lower date with formate YYYY-MM only: "
foradding322: .asciiz "Enter the upper date with formate YYYY-MM only: "
foradding53: .asciiz "Enter the Date with formate YYYY-MM only: "

forSearch21: .asciiz "ID: "
forSearch22: .asciiz "TestName: "
forSearch23: .asciiz "TestDate: "
forSearch24: .asciiz "TestResult: "
forSearch241: .asciiz "Systolic Blood Pressure: "
forSearch242: .asciiz "Diastolic Blood Pressure: "

spacesBetween: .asciiz "    "
successAdding: .asciiz "The Test has been added successfully ... \n"
successRemoving:.asciiz "The Test was deleted successfully ... \n"
successUpdate:.asciiz "The Test has been Updated successfully ... \n"
fornotfound5: .asciiz "The patient test does not exist !\n"
fornotfound3: .asciiz "\nThere are no abnormal tests ...\n"
forunnormal: .asciiz "Unnormal tests :\n"
fornotfound231: .asciiz "\nThere are no tests for this patient in this period ...\n"
fornotfound221: .asciiz "\nThere are no abnormal tests for this patient ...\n"
forprint: .asciiz "The patient has the the following tests :\n"
LSIR: .ascii "   "
hgbe: .asciiz "HGB"
bgte: .asciiz "BGT"
ldle: .asciiz "LDL"
bpte: .asciiz "BPT"
#######################################################################################
# NOTES : 
# s0 is used to store the number of characters have read from the file.
# s1 is used to store the number of rows in the input file .
# s2 is for idArr.
# s3 is for testNameArr.
# s4 is for testDateArr.
# s5 is for testResArr.
# s6 is 1 if the test is BPT , 0 if it's not.
# t1 is for the validity of data.
####################################################################################### 

.text
.globl main
main:

la $a0,welc
jal printString #To print the welcome string.

#read the data stored in the file
jal readFile

#All things before is working good, but i need to transfer the data from the buffer, to corrosponding
#arrays, ID testname testdata testresult, to append the new tests to them......

# the following function will count the number of rows of data we have in the file and 
# store it into $s1 , and will count the number of characters in every single line 
# and store it into the array rowsLength
jal countRows

# the following function will fill the arrays from the data in the file , it will 
# split every field of data into the suitable array
#after this function, the arrays now is filled correctly by its type.
jal fillArrays


#To print the menu and do the functions.
loop:
	la $a0, menu
	jal printString #Printing the menu for the user by calling the printString function.
	#Now, I have to read the user choice(integer).
	la $a0,forchoice
	jal printString

	li $v0,5
	syscall #Now, the readen number is in $v0......
	#Now, i need to check if the choice is valid or not.
	move $t0,$v0 #transfers the choice to $t0.
	#If the choice is bigger that 7 or less than 0, then the choice is wrong.
	ble $t0,0,errorchoice
	bgt $t0,7,errorchoice 
	#else do the jobs needed.
	beq $t0,1,one
	beq $t0,2,two
	beq $t0,3,three
	beq $t0,4,four
	beq $t0,5,five
	beq $t0,6,six
	beq $t0,7,seven
	b exit  # this branch is usless because it won't reach it.
	
	#1 add new **********************************************************************************
	one:
		#First , read the ID for the patient -----------------------------------------------------------------
		readIdAgain:
		la $a0,foradding1
		jal printString
		
		#reading the int 
		li $v0,5
		syscall
		move $v1,$v0
		jal checkTID
		beqz $t1,readIdAgain
		sw $v1,($s2) # store the new ID to the array of IDs
		addi $s1,$s1,1 # increase the number of data record we have 
		addi $s2, $s2, 4 # increase the pointer for id array 
		
		
		# Second , read the test name for the patient-------------------------------------
		readNameAgain:
		la $a0,foradding2 
		jal printString
		#reading the string
		li $v0,8
		la $a0,tempName
		li $a1,10		
		syscall

		jal checkTName
		beqz $t1,readNameAgain
		sb $t7,($s3) # store the first char of test name into the array
		addi $s3,$s3,1 # increase the pointer to the array
		sb $t8,($s3) # store the second char of test name into the array
		addi $s3,$s3,1 # increase the pointer to the array
		sb $t9,($s3) # store the third char of test name into the array
		addi $s3,$s3,1 # increase the pointer to the array
		
		li $t5,'\0' # define the null character
		sb $t5,($s3) # add the null character to the test name , to make the test name in a single word
		addi $s3,$s3,1
		
		# checking if the test entered by the user is BPT or not
		li $s7,0 # a counter to check if all characters of BPT is the same as entered string
		li $s6,0 # initialize a flage for BPT test , it's supposed it's not BPT
		
		# check the first character
		beq $t7,'B',y1 # if the first char is B , increase the counter
		b n1
		y1:addi $s7,$s7,1
		n1:
		
		# check the second character
		beq $t8,'P',y2 # if the first char is B , increase the counter
		b n2
		y2:addi $s7,$s7,1
		n2:
		
		# check the third character
		beq $t9,'T',y3 # if the first char is B , increase the counter
		b n3
		y3:addi $s7,$s7,1
		n3:
		
		# check if the three character are BPT , implies that the counter must be 3 
		beq $s7,3,isbpt # if it's BPT set the flag with 1
		b nobpt 
		isbpt: li $s6,1
		nobpt:
		
		
		# Third, read the test date from the user------------------------------------------ 
		readDateAgain:
		la $a0,foradding3
		jal printString
		#reading the string
		li $v0,8
		la $a0,tempDate
		li $a1,10		
		syscall
		jal checkTDate  # check the validity of the date 
		beqz $t1,readDateAgain
		
		la $t2,tempDate # load the date that we want to add it to the array of dates 
		li $k0,'\0' # load the null character
		sb $k0,7($t2) # replace the \n character at the end of date , with null character 
		lw $t3,($t2) # load a word of the date 
		sw $t3,($s4) # store in the array of dates
		addi $s4,$s4,4 # increase the pointer to the array by a size of word
		lw $t3,4($t2) # load a word of the date 
		sw $t3,($s4) # store in the array of dates
		addi $s4,$s4,4 # increase the pointer to the array by a size of word
		
		
		# Fourth , read the test result from the user ----------------------------------------
		beq $s6,1,bptagain
		
		readResultAgain:
		la $a0,foradding4
		jal printString
		#reading the float number
		li $v0,6
		syscall
		jal checkTResult # check the validity of the number entered by the user
		beqz $t1,readResultAgain # read the number again if it's invalid
		
		# store the floating point number (test result ) entered by the user 
		# into the array of test results
		swc1 $f0,($s5)
		addi $s5,$s5,4 # increae the pointer to the array of test results 
		li $t4,'\0'
		sw $t4,($s5)
		addi $s5,$s5,4 # increae the pointer to the array of test results 
		
		# show a message for the successful adding
		la,$a0,successAdding
		jal printString
		
		b loop
		
		bptagain:

			la $a0,foradding5
			jal printString
			#reading the first result float number
			li $v0,6
			syscall
			jal checkTResult # check the validity of the number entered by the user
			beqz $t1,bptagain # read the number again if it's invalid
			
			# save the value of systolic result , and we will check the diastolic value
			# and at the last , we will store the two values in the array after we check 
			# chat the two values are valid 
			mov.s $f2,$f0 

			la $a0,foradding6
			jal printString
			# reading the second result float number 
			li $v0,6
			syscall
			jal checkTResult # check the validity of the number entered by the user
			beqz $t1,bptagain # read the number again if it's invalid
			
			# at this point, the two values are valid , so we will store them in the array
			
			# store the floating first point number (first test result ) entered by the user 
			# into the array of test results
			swc1 $f2,($s5)
			addi $s5,$s5,4 # increae the pointer to the array of test results 
			
			# store the floating first point number (second test result ) entered by the user 
			# into the array of test results
			swc1 $f0,($s5)
			addi $s5,$s5,4 # increae the pointer to the array of test results 
			
			# show a message for the successful adding
			la,$a0,successAdding
			jal printString
			b loop
			
	#2 search **********************************************************************************
	two:
		li $s0,0
		# $s0 a flag , will be 2 if the user choose the update a test , i want to print all patient tests
		# and will be 1 if the user choose to delete a test , so i want to retrive 
		# all patient tests ,and then return to the function delete , 
		# and will be zero , if the user chooses to just retrive the patient tests
		
		readAgainfor2:
			la $a0,forsecondchoice
			jal printString
			la $a0,forchoice
			jal printString

			li $v0,5
			syscall #to read the user second choice.....
			move $v1,$v0
			#Check if the choice is valid or no.
			ble $v1,0,e2
			bge $v1,4,e2
			beq $v1,1,one2
			beq $v1,2,two2
			beq $v1,3,three2
	
		one2:# Retrieve all patient tests
			
			#reading the id from the user to search for.
			readAgainfor21:
				la $a0,foradding1
				jal printString
				li $v0,5
				syscall #to read the id from the user......
				move $v1,$v0
				#checking for the validity of the id.
				jal checkTID
				#if $t1 is 1 --> no error, if 0 --> error.
				bne $t1,1,readAgainfor21    #error, so repeat the input again.
				#else the id is good.
			
			#traversing the id array is needed now, i need a counter to count how many tests i have to
			#this person (the loop counter is the number of rows).
			fromDelete:
			fromUpdate:
			la $t2,idArr #loading the address of the id array to $t2.
			move $t0,$s1 #make $t0 the loop counter.
			move $t4,$zero #for the number of people having the same id as the entered.
			la $a0,forprint
			jal printString
			loop21:
				beq $t0,0,done211 #stop if the counter == 0.
				lw $t3,($t2)
				addi $t2,$t2,4 #increment the address one byte (to the next id).
				subi $t0,$t0,1
				beq $v1,$t3,TargetFound21 #comparing the Entered value with the id in the array.
				#else if not the same retry.
				b loop21
				
			TargetFound21:# this id is the same as the entered one, so increment the counter and print the values.
				addi $t4,$t4,1
				#Returning (printing on the screen) the the id, testname, testDate and test result.
				la $t5,OutputOfTheSearch1 #loading the address where to write the output then print it.
				#write -store- the id.
				subi $t2,$t2,4 #return back to the id.
				lw $t3,($t2)
				#print the id, without any buffers or anythings, its easier.
				
				
				la $a0,forSearch21
				jal printString
				move $a0,$t3
				jal printInt
				la $a0,spacesBetween
				jal printString
				#done.
				
				#addi $t2,$t2,4 #go back to the next target id.
				
				#id is now ready, now testname, i need to know what is the address of the id from 0 -like if it the first element, second .... and so on-.
				#i can get it by subtract the head of this array by the current address and the result will be the 
				#index of it - to get the other element like namd and date and result.- ((current address - head of array) / size)
			
			la $t7,idArr
			#$t2 has the current address.
			sub $k0,$t2,$t7
			div $k1,$k0,4
			move $s7,$k1 # save the index in $s7.
			#ToStoreTestName.
				la $t7,testNameArr
				li $t8,4
				mul $t6,$t8,$s7 # $t6 = 4xindex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target testname address = offset + head of testnamearr.
				
				la $a0,forSearch22
				jal printString
				
				move $a0,$t8
				jal printString#will print to the null char, which is the end of this testname.
				
				#lw $a2,($t8)
				#la $a0,forSearch22
				#jal printStirng
				#move $a0,$a2
				#jal printString
				#no no no no no no
				
				la $a0,spacesBetween
				jal printString
			#ToStoreTestDate.
				la $t7,testDateArr
				li $t8,8
				mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target testdate address = offset + head of testdatearr.
				
				la $a0,forSearch23
				jal printString
				move $a0,$t8
				jal printString #will print to the null char, which is the end of this data.
				
				#ld $a2,($t8)
				#sd $a2,($t5) # storing the testname to the output buffer after id.
				#addi $t5,$t5,8
				la $a0,spacesBetween
				jal printString
			#ToStoreTestResult.
				#here, two cases are faced, for not bpt, and for bpt.
				#for not bpt, there is a one result. else there are two results.
				#i need to check the second register, if it is zero, then one result, else two results.
				la $t7,testResArr
				li $t8,8
				mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target testres address = offset + head of testresarr.
				
				addi $t8,$t8,4 # second register. i need to check if it is zero or no.
				lw $t9,($t8)
				subi $t8,$t8,4 # return to the first reg.
				beqz $t9,PrintOneRes #go to the easy, print jsut the first res.
				#PrintTwoRes.
					lwc1 $f12,($t8) #load the first res
					la $a0,forSearch241
					jal printString
					li $v0,2
					syscall # to print the floating in $f12
				la $a0,spacesBetween
				jal printString
				addi $t8,$t8,4 # second register. i need to check if it is zero or no.
				lwc1 $f12,($t8) #load the first res
				la $a0,forSearch242
				jal printString
				li $v0,2
				syscall # to print the floating in $f12
				addi $t2,$t2,4 #increment the address one byte (to the next id).
				li $s6,15
				la $a0,NEWLINE
				jal printString
				b loop21
		PrintOneRes:
			lwc1 $f12,($t8) # load the first and only register of floating point res.
			#and print them.
			la $a0,forSearch24
			jal printString
			
			li $v0,2
			syscall # to print the floating in $f12
			addi $t2,$t2,4 #increment the address one byte (to the next id).
			la $a0,NEWLINE
			jal printString

				
			li $s6,15
			b loop21
			
		done211:#now the count of the persions having the same id as the entered is in $t4.
			
			bne $s6,15,notfound521
			beq $s0,1,retFromPrint # return to the delete part of the code
			beq $s0,2,retFromPrintU # return to the update part of the code
			b loop
		 
		 notfound521:
			la $a0,fornotfound5
			jal printString
			# beq $s0,1,retFromPrint # return to the delete part of the code
			# beq $s0,2,retFromPrintU # return to the update part of the code
			b loop
		
		#b exit
		
		two2:# Retrieve all up normal patient tests.
		la $a0,foradding1
		jal printString
		#reading the value from the user.
		readAgainfor22:
		li $v0,5
		syscall #to read the id from the user......
		move $v1,$v0
		#checking for the validity of the id.
		jal checkTID
		#if $t1 is 1 --> no error, if 0 --> error.
		bne $t1,1,readAgainfor22   #error, so repeat the input again.
		#else the id is good.
		
		#traversing the id array is needed now, i need a counter to count how many tests i have to
		#this person (the loop counter is the number of rows).
		la $t2,idArr #loading the address of the id array to $t2.
		move $t0,$s1 #make $t0 the loop counter.
		move $t4,$zero #for the number of persions having the same id as the entered.
		la $a0,forunnormal
		jal printString
		loop22:
			beq $t0,0,done221 #stop if the counter == 0.
			lw $t3,($t2)
			addi $t2,$t2,4 #increment the address one byte (to the next id).
			subi $t0,$t0,1
			beq $v1,$t3,TargetFound22 #comparing the Entered value with the id in the array.
			#else if not the same retry.
			b loop22
			
		TargetFound22:# this id is the same as the entered one, so increment the counter and print the values.
			addi $t4,$t4,1 #this counter is useless.
			#now i need to check the test name, to know what is the up normal cases.
			subi $t2,$t2,4 #return back to the id.
			la $t7,idArr
			#$t2 has the current address.
			sub $k0,$t2,$t7
			div $k1,$k0,4
			move $s7,$k1 # save the index in $s7.
			#Going to the testname index in its array.
			li $a3,0 #this var is to determine the test name, 0:hgb, 1:bgt, 2:ldl, 3:bpt.
			la $t7,testNameArr
			li $t8,4
			mul $t6,$t8,$s7 # $t6 = 4xindex (to get the offset)
			add $t8,$t7,$t6 # $t8 is the target testname address = offset + head of testnamearr.
							#-------------------
			lw $k0,($t8) # $k0=this testname, now compare this name with the test names.
							#-------------------
			la $v1,hgbe
			lw $k1,($v1)#contain the string to compare "HGB"
			bne $k1,$k0,goanother
			#if equal...
			li $a3,0
			b twoTestNameDone
			
				
		goanother:
			la $v1,bgte
			lw $k1,($v1)#contain the string to compare "HGB"
			bne $k1,$k0,goanother2
			#if equal...
			li $a3,1
			b twoTestNameDone
		goanother2:
			la $v1,ldle
			lw $k1,($v1)#contain the string to compare "HGB"
			bne $k1,$k0,goanother3
			#if equal...
			li $a3,2
			b twoTestNameDone
		goanother3:
			li $a3,3
				
			#Now, the testname is in $a3
		twoTestNameDone:
			beq $a3,0,CaseOne
			beq $a3,1,CaseTwo
			beq $a3,2,CaseThree
			beq $a3,3,CaseFour
			b errorchoice
					
		CaseOne:#hgb
			#i need to get the res to check if it is normal or upnormal
			la $t7,testResArr
			li $t8,8
			mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
			add $t8,$t7,$t6 # $t8 is the target testres address = offset + head of testresarr.
			
			lwc1 $f1,($t8) #$f1 = res
			l.s $f2,immfloat1
			c.lt.s $f1,$f2 #if less than 13.8 then upnormal.
				bc1t printThisnotbpt
				#else
			l.s $f2,immfloat2
			c.lt.s $f2,$f1 #if greater than 17.2 then upnormal.
				bc1t printThisnotbpt
			#else normal(don't print and go back).
			addi $t2,$t2,4 #increment the address one byte (to the next id).
			b loop22
			
		CaseTwo:#bgt
			#i need to get the res to check if it is normal or upnormal
			la $t7,testResArr
			li $t8,8
			mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
			add $t8,$t7,$t6 # $t8 is the target testres address = offset + head of testresarr.
			
			lwc1 $f1,($t8) #$f1 = res
			l.s $f2,immfloat3
			c.lt.s $f1,$f2 #if less than 70 then upnormal.
				bc1t printThisnotbpt
			l.s $f2,immfloat4
			c.lt.s $f2,$f1 #if greater than 99 then upnormal.
				bc1t printThisnotbpt
			#else normal(don't print and go back).
			addi $t2,$t2,4 #increment the address one byte (to the next id).
			b loop22
									
		CaseThree:#ldl
			#i need to get the res to check if it is normal or upnormal
			la $t7,testResArr
			li $t8,8
			mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
			add $t8,$t7,$t6 # $t8 is the target testres address = offset + head of testresarr.
			
			lwc1 $f1,($t8) #$f1 = res
			l.s $f2,immfloat5
			c.lt.s $f2,$f1 #if greater than 100 then upnormal.
			bc1t printThisnotbpt
			#else normal(don't print and go back).
			addi $t2,$t2,4 #increment the address one byte (to the next id).
			b loop22
			
		CaseFour:#bpt
			#i need to get the two reses to check if they are normal or upnormal
			la $t7,testResArr
			li $t8,8
			mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
			add $t8,$t7,$t6 # $t8 is the target testres address = offset + head of testresarr.
			
			lwc1 $f1,($t8) #$f1 = res1
			l.s $f2,immfloat6	
			c.lt.s $f2,$f1 #if greater than 100 then upnormal.
				bc1t printThisbpt
			lwc1 $f3,4($t8) #$f3 = res2
			l.s $f2,immfloat7
			c.lt.s $f2,$f3 #if greater than 100 then upnormal.
				bc1t printThisbpt
			#else normal(don't print and go back).
				
			addi $t2,$t2,4 #increment the address one byte (to the next id).
			b loop22
					
			printThisnotbpt:#printing the res as the previous choice.
				lw $t3,($t2)
				#print the id, without any buffers or anythings, its easier.
				la $a0,forprint
				jal printString
				
				la $a0,forSearch21
				jal printString
				move $a0,$t3
				jal printInt
				la $a0,spacesBetween
				jal printString
				#done.
		
				#addi $t2,$t2,4 #go back to the next target id.
		
				#id is now ready, now testname, i need to know what is the address of the id from 0 -like if it the first element, second .... and so on-.
				#i can get it by subtract the head of this array by the current address and the result will be the 
				#index of it - to get the other element like namd and date and result.- ((current address - head of array) / size)
		
				
			#ToStoreTestName.
				la $t7,testNameArr
				li $t8,4
				mul $t6,$t8,$s7 # $t6 = 4xindex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target testname address = offset + head of testnamearr.
	
				la $a0,forSearch22
				jal printString
		
				move $a0,$t8
				jal printString#will print to the null char, which is the end of this testname.
	
				#lw $a2,($t8)
				#la $a0,forSearch22
				#jal printStirng
				#move $a0,$a2
					#jal printString
				#no no no no no no
	
				la $a0,spacesBetween
					jal printString
			#ToStoreTestDate.
				la $t7,testDateArr
				li $t8,8
				mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target testdate address = offset + head of testdatearr.
	
				la $a0,forSearch23
				jal printString
				move $a0,$t8
				jal printString #will print to the null char, which is the end of this data.
		
				#ld $a2,($t8)
				#sd $a2,($t5) # storing the testname to the output buffer after id.
				#addi $t5,$t5,8
				la $a0,spacesBetween
				jal printString
			
			
			#for resss
			#lwc1 $f12,($t8) # load the first and only register of floating point res.
			#and print them.
			la $a0,forSearch24
			jal printString
			mov.s $f12,$f1 #the res is in $f1 from before.
			li $v0,2
			syscall # to print the floating in $f12
			addi $t2,$t2,4 #increment the address one byte (to the next id).
			la $a0,NEWLINE
			jal printString
			li $s6,15
	
			addi $t2,$t2,4 #increment the address one byte (to the next id).
			b loop22
			
		printThisbpt:
			lw $t3,($t2)
				#print the id, without any buffers or anythings, its easier.	
				
				la $a0,forSearch21
				jal printString
			move $a0,$t3
				jal printInt
				la $a0,spacesBetween
				jal printString
			#done.
	
			#addi $t2,$t2,4 #go back to the next target id.
	
			#id is now ready, now testname, i need to know what is the address of the id from 0 -like if it the first element, second .... and so on-.
			#i can get it by subtract the head of this array by the current address and the result will be the 
			#index of it - to get the other element like namd and date and result.- ((current address - head of array) / size)
	

			#ToStoreTestName.
				la $t7,testNameArr
				li $t8,4
				mul $t6,$t8,$s7 # $t6 = 4xindex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target testname address = offset + head of testnamearr.
	
				la $a0,forSearch22
				jal printString
		
				move $a0,$t8
				jal printString#will print to the null char, which is the end of this testname.
	
				#lw $a2,($t8)
				#la $a0,forSearch22
				#jal printStirng
				#move $a0,$a2
					#jal printString
				#no no no no no no
	
				la $a0,spacesBetween
					jal printString
			#ToStoreTestDate.
				la $t7,testDateArr
				li $t8,8
				mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target testdate address = offset + head of testdatearr.
	
				la $a0,forSearch23
				jal printString
				move $a0,$t8
				jal printString #will print to the null char, which is the end of this data.
		
				#ld $a2,($t8)
				#sd $a2,($t5) # storing the testname to the output buffer after id.
				#addi $t5,$t5,8
				la $a0,spacesBetween
				jal printString
			
			
			#for two reses.
			
				#ToStoreTestResult.
			#here, two cases are faced, for not bpt, and for bpt.
			#for not bpt, there is a one result. else there are two results.
			#i need to check the second register, if it is zero, then one result, else two results.
			la $t7,testResArr
			li $t8,8
			mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
			add $t8,$t7,$t6 # $t8 is the target testres address = offset + head of testresarr.

				lwc1 $f12,($t8) #load the first res
				la $a0,forSearch241
				jal printString
				li $v0,2
				syscall # to print the floating in $f12
			la $a0,spacesBetween
				jal printString
	
			addi $t8,$t8,4 # second register. i need to check if it is zero or no.
			lwc1 $f12,($t8) #load the first res
			la $a0,forSearch242
			jal printString
			li $v0,2
			syscall # to print the floating in $f12
			addi $t2,$t2,4 #increment the address one byte (to the next id).
			
			
			la $a0,NEWLINE
			jal printString
			
			addi $t2,$t2,4 #increment the address one byte (to the next id).
			
			li $s6,15
			b loop22

		done221:
            bne $s6,15,notfound221
            beq $s0,1,retFromPrint # return to the delete part of the code
			b loop
		notfound221:
			la $a0,fornotfound221
			jal printString
			beq $s0,1,retFromPrint # return to the delete part of the code
			b loop   			

		#b exit
		three2:# Retrieve all patient tests in a given specific period (need to read the id and the date.)
		la $a0,foradding1
		jal printString
		#reading the value from the user.
		readAgainfor23:
			li $v0,5
			syscall #to read the id from the user......
			move $v1,$v0
			#checking for the validity of the id.
			jal checkTID
			#if $t1 is 1 --> no error, if 0 --> error.
			bne $t1,1,readAgainfor23    #error, so repeat the input again.
			#else the id is good.
			move $k1,$v1
			#now read the period of dates, lower data, upper date.
			#read the test date from the user------------------------------------------ 
			readDateAgain231:
				la $a0,foradding321
				jal printString
				#reading the string
				li $v0,8
				la $a0,tempDate
				li $a1,10		
				syscall
				# li $t5,'\0'
				# la $t9,tempDate
				# sb $t5,7($t9)
				jal checkTDate  # check the validity of the date 
				beqz $t1,readDateAgain231
			#the lower date is ready, now the upper one.
			readDateAgain232:
				la $a0,foradding322
				jal printString
				#reading the string
				li $v0,8
				la $a0,tempDate2
				li $a1,10		
				syscall
				#jal checkTDate  # check the validity of the date 
				#beqz $t1,readDateAgain232
				
				move $v1,$k1
			#the upper date is ready.
			#now, search for the index of the same id as the input.
			
			#traversing the id array is needed now, i need a counter to count how many tests i have to
			#this person (the loop counter is the number of rows).
			la $t2,idArr #loading the address of the id array to $t2.
			move $t0,$s1 #make $t0 the loop counter.
			move $t4,$zero #for the number of persions having the same id as the entered.
			loop23:
				beq $t0,0,end231 #stop if the counter == 0.
				lw $t3,($t2)
				addi $t2,$t2,4 #increment the address one byte (to the next id).
				subi $t0,$t0,1
				beq $v1,$t3,TargetFound23 #comparing the Entered value with the id in the array.
				#else if not the same retry.
				b loop23
			
				TargetFound23:# this id is the same as the entered one, so increment the counter and print the values.
					addi $t4,$t4,1 #this counter is useless.
					#now i need to check the date,
					subi $t2,$t2,4 #return back to the id.
					la $t7,idArr
					#$t2 has the current address.
					sub $k0,$t2,$t7
					div $k1,$k0,4
					move $s7,$k1 # save the index in $s7.
					#Going to the date index in its array.
					#li $a3,0 #this var is to determine the test name, 0:hgb, 1:bgt, 2:ldl, 3:bpt.
					la $t7,testDateArr #string
					li $t8,8
					mul $t6,$t8,$s7 # $t6 = 4xindex (to get the offset)
					add $t8,$t7,$t6 # $t8 is the target testdate address = offset + head of testdatearr.
									#-------------------
						#lw $k0,($t8) # $k0=this year of the date, now compare this year with lower and upper date.
									#-------------------
					move $k1,$v1
					move $a0,$t8
					jal str2int
					move $k0,$v0 #$k0=the year as integer.
					#if the date is smaller than the lower or bigger the upper, go to other id.
					move $v1,$k1
					move $k1,$v1
					la $a1,tempDate
					#lw $a2,($a1) #loading the lower year date
					move $a0,$a1
					jal str2int
					move $a2,$v0 #$a2=the lower year as int.
					#move $v1,$k1
					blt $k0,$a2,go23 #if (testdate < lowerdate) go to other one.
					
					la $a1,tempDate2
					#lw $a2,($a1) #loading the upper year date
					
					move $a0,$a1
					jal str2int
					move $a3,$v0 #$a2=the upper year as int.
					bgt $k0,$a3,go23#if (testdate > upperdate) go to other one.
					#else, i need to check if the year is equal to lower or upper, to 
					#make the comparasion easier.
					#BUT HERE I FORGOT TO CHECK IF THE UPPER AND LOWER ARE EQUAL,,,,...
					beq $a2,$a3,checkmonth3
					beq $k0,$a2,checkmonth1 #if it is equal the lower.
					beq $k0,$a3,checkmonth2 #if it is equal the upper.
					
					
					
					#if the year was in the middle, take it.
					blt $k0,$a3,cch
					b go23
					
					cch:
						bgt $k0,$a2,go22
						b go23
					
					#now i need to check it is equal the edges.
					
					
					
					
					checkmonth1:#the month must be greater than the (no need to make it int)
						la $t6,month
						# check the validity of month
						lb $t5,5($t8)
						lb $t7,6($t8)
	
						# split the month and store in into separate string
						sb $t5,($t6)
						sb $t7,1($t6)
						#month contain month, to make it integer.
						li $t7,'\0' # add null character
						sb $t7,2($t6)
	
							# check if the year entered is more than the current year
						la $a0,month
						jal str2int
						move $k0,$v0 #$k0 contains an integer represent the test month.
						#now i need to compare it with the lower month.
						la $v1,tempDate
						la $t6,month
						# check the validity of month
						lb $t5,5($v1)
						lb $t7,6($v1)
	
						# split the month and store in into separate string
						sb $t5,($t6)
						sb $t7,1($t6)
		#month contain month, to make it integer.
						li $t7,'\0' # add null character
						sb $t7,2($t6)
	
							
						la $a0,month
						jal str2int
						move $a2,$v0 #$a2 contains an integer represent the lower month.

						blt $k0,$a2,go23
						bge $k0,$a2,go22
					checkmonth2:	
						la $t6,month
						
						lb $t5,5($t8)
						lb $t7,6($t8)
	
						# split the month and store in into separate string
						sb $t5,($t6)
						sb $t7,1($t6)
		#month contain month, to make it integer.
						li $t7,'\0' # add null character
						sb $t7,2($t6)
	
							# check if the year entered is more than the current year
						la $a0,month
						jal str2int
						move $k0,$v0 #$k0 contains an integer represent the test month.
						#now i need to compare it with the upper month.
						#now upper month.
						
						la $v1,tempDate2
						la $t6,month
						# check the validity of month
						lb $t5,5($v1)
						lb $t7,6($v1)
	
						# split the month and store in into separate string
						sb $t5,($t6)
						sb $t7,1($t6)
						#month contain month, to make it integer.
						li $t7,'\0' # add null character
						sb $t7,2($t6)

						# check if the year entered is more than the current year
						la $a0,month
						jal str2int
						move $a2,$v0 #$a2 contains an integer represent the upper month.

						bgt $k0,$a2,go23
						ble $k0,$a2,go22
					checkmonth3:
							la $t6,month
						
						lb $t5,5($t8)
						lb $t7,6($t8)
	
						# split the month and store in into separate string
						sb $t5,($t6)
						sb $t7,1($t6)
		#month contain month, to make it integer.
						li $t7,'\0' # add null character
						sb $t7,2($t6)
	
							# check if the year entered is more than the current year
						la $a0,month
						jal str2int
						move $k0,$v0 #$k0 contains an integer represent the test month.
						#now i need to compare it with the upper month and the lower.
						#now upper month.
						
						la $v1,tempDate2
						la $t6,month
						# check the validity of month
						lb $t5,5($v1)
						lb $t7,6($v1)
	
						# split the month and store in into separate string
						sb $t5,($t6)
						sb $t7,1($t6)
						#month contain month, to make it integer.
						li $t7,'\0' # add null character
						sb $t7,2($t6)

						# check if the year entered is more than the current year
						la $a0,month
						jal str2int
						move $a2,$v0 #$a2 contains an integer represent the upper month.
						#********************************************
						#now the lower
						la $v1,tempDate
						la $t6,month
						# check the validity of month
						lb $t5,5($v1)
						lb $t7,6($v1)
	
						# split the month and store in into separate string
						sb $t5,($t6)
						sb $t7,1($t6)
		#month contain month, to make it integer.
						li $t7,'\0' # add null character
						sb $t7,2($t6)
	
							
						la $a0,month
						jal str2int
						move $a3,$v0 #$a3 contains an integer represent the lower month.
						#now i need to check if the test month was in the middle of them or no.
						ble $k0,$a2,con231
						#else other....
						b go23
						con231:
						bge $k0,$a3,go22
						#else other...
						b go23

					
				go23:
				move $v1,$k1
					addi $t2,$t2,4 #increment the address one byte (to the next id).
					b loop23
				
				
				#else, this is a goal!!! so print the data.
				go22:	
				move $v1,$k1					
				#Returning (printing on the screen) the the id, testname, testDate and test result.
				lw $t3,($t2)
					#print the id, without any buffers or anythings, its easier.
					
					
					la $a0,forSearch21
					jal printString
				move $a0,$t3
					jal printInt
					la $a0,spacesBetween
					jal printString
				#done.

				#id is now ready, now testname, i need to know what is the address of the id from 0 -like if it the first element, second .... and so on-.
				#i can get it by subtract the head of this array by the current address and the result will be the 
				#index of it - to get the other element like namd and date and result.- ((current address - head of array) / size)
				
				la $t7,idArr
				#$t2 has the current address.
				sub $k0,$t2,$t7
				div $k1,$k0,4
				move $s7,$k1 # save the index in $s7.
				#ToStoreTestName.
					la $t7,testNameArr
					li $t8,4
					mul $t6,$t8,$s7 # $t6 = 4xindex (to get the offset)
					add $t8,$t7,$t6 # $t8 is the target testname address = offset + head of testnamearr.
					
					la $a0,forSearch22
					jal printString
					
					move $a0,$t8
					jal printString#will print to the null char, which is the end of this testname.
					
					#lw $a2,($t8)
					#la $a0,forSearch22
					#jal printStirng
					#move $a0,$a2
					#jal printString
					#no no no no no no
					
			la $a0,spacesBetween
					jal printString
				#ToStoreTestDate.
					la $t7,testDateArr
					li $t8,8
					mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
					add $t8,$t7,$t6 # $t8 is the target testdate address = offset + head of testdatearr.
					
					la $a0,forSearch23
					jal printString
					move $a0,$t8
					jal printString #will print to the null char, which is the end of this data.
					
					#ld $a2,($t8)
					#sd $a2,($t5) # storing the testname to the output buffer after id.
					#addi $t5,$t5,8
					la $a0,spacesBetween
					jal printString
				#ToStoreTestResult.
					#here, two cases are faced, for not bpt, and for bpt.
					#for not bpt, there is a one result. else there are two results.
					#i need to check the second register, if it is zero, then one result, else two results.
					la $t7,testResArr
					li $t8,8
					mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
					add $t8,$t7,$t6 # $t8 is the target testres address = offset + head of testresarr.
					
					addi $t8,$t8,4 # second register. i need to check if it is zero or no.
					lw $t9,($t8)
					subi $t8,$t8,4 # return to the first reg.
					beqz $t9,PrintOneRes3 #go to the easy, print jsut the first res.
					#PrintTwoRes.
						lwc1 $f12,($t8) #load the first res
						la $a0,forSearch241
						jal printString
						li $v0,2
						syscall # to print the floating in $f12
					la $a0,spacesBetween
					jal printString
					addi $t8,$t8,4 # second register. i need to check if it is zero or no.
					lwc1 $f12,($t8) #load the first res
					la $a0,forSearch242
					jal printString
					li $v0,2
					syscall # to print the floating in $f12
					addi $t2,$t2,4 #increment the address one byte (to the next id).
					li $s6,15
					b loop23
					la $a0,NEWLINE
					jal printString
					PrintOneRes3:
						lwc1 $f12,($t8) # load the first and only register of floating point res.
						#and print them.
						la $a0,forSearch24
						jal printString
						
						li $v0,2
						syscall # to print the floating in $f12
					addi $t2,$t2,4 #increment the address one byte (to the next id).
					la $a0,NEWLINE
					jal printString
					li $s6,15
					
				
				b loop23			

		end231:
			bne $s6,15,notfound231
			beq $s0,1,retFromPrint # return to the delete part of the code
			b loop
		notfound231:
			la $a0,fornotfound231
			jal printString
			beq $s0,1,retFromPrint # return to the delete part of the code
			b loop   								
		
		b exit
		e2:
			la $a0,errorAdding1
			jal printString
			b readAgainfor2

		beq $s0,1,retFromPrint # return to the delete part of the code
		b loop

	#3 search **********************************************************************************
	three: #the user will input a testname, and i need to find all upnormal of these tests, bsmellah.
	
		
		#reading the value from the user.
		readAgainfor31:
			la $a0,foradding2
			jal printString
			la $a0,tempName
			li $a1,6 #will read the testname with null char at the end of it.
			li $v0,8
			syscall #to read the testname from the user......
			#checking for the validity of the testname.
			jal checkTName
			#if $t1 is 1 --> no error, if 0 --> error.
			beqz $t1,readAgainfor31   #error, so repeat the input again.
			#else the name is good.
		la $a0,tempName
		
		#$a1 containing the address of the testname
		lw $a1,($a0)
		#$a1 containing the name itself.
		#traversing the name array is needed now, i need a counter to count how many tests i have to
		#this person (the loop counter is the number of rows).
		la $t2,testNameArr #loading the address of the name array to $t2.
		
		move $t0,$s1 #make $t0 the loop counter.
		move $t4,$zero #for the number of persions having the same name as the entered.
		la $a0,forunnormal
		jal printString
		loop31:
			beq $t0,0,end3 #stop if the counter == 0.
			lw $t3,($t2)
			addi $t2,$t2,4 #increment the address one byte (to the next id).
			subi $t0,$t0,1
			beq $a1,$t3,TargetFound31 #comparing the Entered value with the id in the array.
			#else if not the same retry.
			b loop31
			
			TargetFound31:# this testname is the same as the entered one, so increment the counter and print the values.
				addi $t4,$t4,1 #this counter is useless.
				#now i need to check the test name, to know what is the up normal cases.
				subi $t2,$t2,4 #return back to the name.(current address)
				la $t7,testNameArr
				#$t2 has the current address.
				sub $k0,$t2,$t7
				div $k1,$k0,4
				move $s7,$k1 # save the index in $s7.
				
				li $a3,0 #this var is to determine the test name, 0:hgb, 1:bgt, 2:ldl, 3:bpt.
				
		#$a1 contains the read testname to comapre with, to determine the result range.
				la $v1,hgbe
				lw $k1,($v1)#contain the string to compare "HGB"
				bne $k1,$a1,goanother31
				#if equal...
				li $a3,0
				b threeTestNameDone
				
				
				goanother31:
					la $v1,bgte
					lw $k1,($v1)#contain the string to compare "HGB"
					bne $k1,$a1,goanother32
					#if equal...
					li $a3,1
					b threeTestNameDone
					goanother32:
						la $v1,ldle
						lw $k1,($v1)#contain the string to compare "HGB"
						bne $k1,$a1,goanother33
						#if equal...
						li $a3,2
						b threeTestNameDone
						goanother33:
							li $a3,3
				
				#Now, the testname is in $a3
				threeTestNameDone:
					beq $a3,0,CaseOne31
					beq $a3,1,CaseTwo31
					beq $a3,2,CaseThree31
					beq $a3,3,CaseFour31
					b errorchoice
					
					CaseOne31:#hgb
						#i need to get the res to check if it is normal or upnormal
						la $t7,testResArr
						li $t8,8
						mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
						add $t8,$t7,$t6 # $t8 is the target testres address = offset + head of testresarr.
						
						lwc1 $f1,($t8) #$f1 = res
						l.s $f2,immfloat1
						c.lt.s $f1,$f2 #if less than 13.8 then upnormal.
							bc1t printThisnotbpt31
							#else
						l.s $f2,immfloat2
						c.lt.s $f2,$f1 #if greater than 17.2 then upnormal.
							bc1t printThisnotbpt31
						#else normal(don't print and go back).
						addi $t2,$t2,4 #increment the address one byte (to the next id).
						b loop31
						
						
							
					CaseTwo31:#bgt
						#i need to get the res to check if it is normal or upnormal
						la $t7,testResArr
						li $t8,8
						mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
						add $t8,$t7,$t6 # $t8 is the target testres address = offset + head of testresarr.
						
						lwc1 $f1,($t8) #$f1 = res
						l.s $f2,immfloat3
						c.lt.s $f1,$f2 #if less than 70 then upnormal.
							bc1t printThisnotbpt31
						l.s $f2,immfloat4
						c.lt.s $f2,$f1 #if greater than 99 then upnormal.
							bc1t printThisnotbpt31
						#else normal(don't print and go back).
						addi $t2,$t2,4 #increment the address one byte (to the next id).
						b loop31
						
						
						
						
						
						
					CaseThree31:#ldl
						#i need to get the res to check if it is normal or upnormal
						la $t7,testResArr
						li $t8,8
						mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
						add $t8,$t7,$t6 # $t8 is the target testres address = offset + head of testresarr.
						
						lwc1 $f1,($t8) #$f1 = res
						l.s $f2,immfloat5
						c.lt.s $f2,$f1 #if greater than 100 then upnormal.
						bc1t printThisnotbpt31
						#else normal(don't print and go back).
						addi $t2,$t2,4 #increment the address one byte (to the next id).
						b loop31
						
						
						
						
						
						
						
					CaseFour31:#bpt
						#i need to get the two reses to check if they are normal or upnormal
						la $t7,testResArr
						li $t8,8
						mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
						add $t8,$t7,$t6 # $t8 is the target testres address = offset + head of testresarr.
						
						lwc1 $f1,($t8) #$f1 = res1
						l.s $f2,immfloat6	
						c.lt.s $f2,$f1 #if greater than 100 then upnormal.
							bc1t printThisbpt31
						lwc1 $f3,4($t8) #$f3 = res2
						l.s $f2,immfloat7
						c.lt.s $f2,$f3 #if greater than 100 then upnormal.
							bc1t printThisbpt31
						#else normal(don't print and go back).
						addi $t2,$t2,4 #increment the address one byte (to the next id).
						b loop31
						
						
					printThisnotbpt31:#printing the res as the previous choice.
						li $s6,15
						la $t7,idArr
								li $t8,4
								mul $t6,$t8,$s7 # $t6 = 4xindex (to get the offset)
								add $t8,$t7,$t6 # $t8 is the target testname address = offset + head of testnamearr.
							lw $t3,($t8)
								#print the id, without any buffers or anythings, its easier.
								la $a0,forSearch21
								jal printString
							move $a0,$t3
								jal printInt
								la $a0,spacesBetween
								jal printString
							#done.
					
							#addi $t2,$t2,4 #go back to the next target id.
					
							#id is now ready, now testname, i need to know what is the address of the id from 0 -like if it the first element, second .... and so on-.
							#i can get it by subtract the head of this array by the current address and the result will be the 
							#index of it - to get the other element like namd and date and result.- ((current address - head of array) / size)
					
				
							#ToStoreTestName.
								la $t7,testNameArr
								li $t8,4
								mul $t6,$t8,$s7 # $t6 = 4xindex (to get the offset)
								add $t8,$t7,$t6 # $t8 is the target testname address = offset + head of testnamearr.
					
								la $a0,forSearch22
								jal printString
						
								move $a0,$t8
								jal printString#will print to the null char, which is the end of this testname.
					
								#lw $a2,($t8)
								#la $a0,forSearch22
								#jal printStirng
								#move $a0,$a2
									#jal printString
								#no no no no no no
					
								la $a0,spacesBetween
									jal printString
							#ToStoreTestDate.
								la $t7,testDateArr
								li $t8,8
								mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
								add $t8,$t7,$t6 # $t8 is the target testdate address = offset + head of testdatearr.
					
								la $a0,forSearch23
								jal printString
								move $a0,$t8
								jal printString #will print to the null char, which is the end of this data.
						
								#ld $a2,($t8)
								#sd $a2,($t5) # storing the testname to the output buffer after id.
								#addi $t5,$t5,8
								la $a0,spacesBetween
								jal printString
							
							
							#for resss
							#lwc1 $f12,($t8) # load the first and only register of floating point res.
							#and print them.
							la $a0,forSearch24
							jal printString
							mov.s $f12,$f1 #the res is in $f1 from before.
							li $v0,2
							syscall # to print the floating in $f12
							addi $t2,$t2,4 #increment the address one byte (to the next id).
								la $a0,NEWLINE
							jal printString
							li $s6,15
							addi $t2,$t2,4 #increment the address one byte (to the next id).
							b loop31
							
					printThisbpt31:
						li $s6,15
						lw $t3,($t2)
							#print the id, without any buffers or anythings, its easier.

							la $a0,forSearch21
							jal printString
						move $a0,$t3
							jal printInt
							la $a0,spacesBetween
							jal printString
						#done.
				
						#addi $t2,$t2,4 #go back to the next target id.
				
						#id is now ready, now testname, i need to know what is the address of the id from 0 -like if it the first element, second .... and so on-.
						#i can get it by subtract the head of this array by the current address and the result will be the 
						#index of it - to get the other element like namd and date and result.- ((current address - head of array) / size)
				
			
						#ToStoreTestName.
							la $t7,testNameArr
							li $t8,4
							mul $t6,$t8,$s7 # $t6 = 4xindex (to get the offset)
							add $t8,$t7,$t6 # $t8 is the target testname address = offset + head of testnamearr.
				
							la $a0,forSearch22
							jal printString
					
							move $a0,$t8
							jal printString#will print to the null char, which is the end of this testname.
				
							#lw $a2,($t8)
							#la $a0,forSearch22
							#jal printStirng
							#move $a0,$a2
								#jal printString
							#no no no no no no
				
							la $a0,spacesBetween
								jal printString
						#ToStoreTestDate.
							la $t7,testDateArr
							li $t8,8
							mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
							add $t8,$t7,$t6 # $t8 is the target testdate address = offset + head of testdatearr.
				
							la $a0,forSearch23
							jal printString
							move $a0,$t8
							jal printString #will print to the null char, which is the end of this data.
					
							#ld $a2,($t8)
							#sd $a2,($t5) # storing the testname to the output buffer after id.
							#addi $t5,$t5,8
							la $a0,spacesBetween
							jal printString
						
						
						#for two reses.
						
							#ToStoreTestResult.
						#here, two cases are faced, for not bpt, and for bpt.
						#for not bpt, there is a one result. else there are two results.
						#i need to check the second register, if it is zero, then one result, else two results.
						la $t7,testResArr
						li $t8,8
						mul $t6,$t8,$s7 # $t6 = 8xIndex (to get the offset)
						add $t8,$t7,$t6 # $t8 is the target testres address = offset + head of testresarr.
			
							lwc1 $f12,($t8) #load the first res
							la $a0,forSearch241
							jal printString
							li $v0,2
							syscall # to print the floating in $f12
						la $a0,spacesBetween
							jal printString
				
						addi $t8,$t8,4 # second register. i need to check if it is zero or no.
						lwc1 $f12,($t8) #load the first res
						la $a0,forSearch242
						jal printString
						li $v0,2
						syscall # to print the floating in $f12
						addi $t2,$t2,4 #increment the address one byte (to the next id).
						
						
						la $a0,NEWLINE
						jal printString
						li $s6,15
						
						addi $t2,$t2,4 #increment the address one byte (to the next id).
						
						b loop31

				end3:
					bne $s6,15,notfound3
					b loop
				notfound3:
					la $a0,fornotfound3
					jal printString

		b loop
	
	#4 average **********************************************************************************
	four:
		# $t6 will hold the test name that we want to recognize it 
		# $t7 will hold the unique code for every test , 1 for HGB,2 for BGT,3 for LDL ,4 for BPT
		li $t3,0
		
		mtc1 $t3,$f8 # $f8 will hold the number of HGB tests
		mtc1 $t3,$f9 # $f9 will hold the number of BGT tests
		mtc1 $t3,$f10 # $f10 will hold the number of LDL tests
		mtc1 $t3,$f11 # $f11 will hold the number of BPT tests
		
		mtc1 $t3,$f2 # define $f2 for tthe sum of HGB result
		mtc1 $t3,$f3 # define $f3 for the sum of BGT
		mtc1 $t3,$f4 # define $f4 for the sum of LDL
		mtc1 $t3,$f5 # define $f5 for the sum of Systolic values
		mtc1 $t3,$f6 # define $f6 for the sum of Diastolic values
		
		li $t7,0 # the test name code will be stored here
		li $t2,1 # load the number 1 (float)
		mtc1 $t2,$f12 # store the number 1 in float to f12


		la $t0,testNameArr # load the address of the array of test names into t0
		la $s7,testResArr # load the address of the arary of test results into s7
		li $v1,0 # this is the counter for the loop
		
		avgRes:
			bge $v1,$s1,endAvg # break if we finish the elements of the array
			addi $v1,$v1,1 # increase the loop counter
			lw $t6,($t0) # load the test name into the register t6
			addi $t0,$t0,4 # increase the pointer by a word size
			jal determineTest # it will store the unique test code into $t7 
			
			
			
			beq $t7,1,sHGB
			beq $t7,2,sBGT
			beq $t7,3,sLDL
			beq $t7,4,sBPT
			jal unknownError
			
			# move $a0,$t7
			# li $v0,1
			# syscall
			# b avgRes
			
			sHGB: 
				add.s $f8,$f8,$f12 # increase the counter for HGB
				lwc1 $f7,($s7) # load the result
				add.s $f2,$f2,$f7 # add the result to the accumelate sum register
				addi $s7,$s7,8 # increase the pointer to the result array
				b avgRes


			sBGT:
				add.s $f9,$f9,$f12
				lwc1 $f7,($s7) # load the result
				add.s $f3,$f3,$f7 # add the result to the accumelate sum register
				addi $s7,$s7,8 # increase the pointer to the result array
				b avgRes

			sLDL:
				add.s $f10,$f10,$f12
				lwc1 $f7,($s7) # load the result
				add.s $f4,$f4,$f7 # add the result to the accumelate sum register
				addi $s7,$s7,8 # increase the pointer to the result array
				b avgRes
			
			sBPT:
				add.s $f11,$f11,$f12
				lwc1 $f7,($s7) # load the first result (systolic)
				add.s $f5,$f5,$f7 # add the result to the accumelate sum register

				lwc1 $f7,4($s7) # load the second result (diastolic)
				add.s $f6,$f6,$f7 # add the result to the accumelate sum register
				
				addi $s7,$s7,8 # increase the pointer to the result array
				b avgRes


		
		endAvg:
			# some corrections to the numbers that represent the counters for the tests
			cvt.s.w $f8,$f8
			cvt.s.w $f9,$f9
			cvt.s.w $f10,$f10
			cvt.s.w $f11,$f11

			div.s $f2,$f2,$f8 # calculate the average value of HGB test
			div.s $f3,$f3,$f9 # calculate the average value of BGT test
			div.s $f4,$f4,$f10 # calculate the average value of LDL test
			div.s $f5,$f5,$f11 # calculate the average value of systolic tests
			div.s $f6,$f6,$f11 # calculate the average value of diastolic tests
			
			# printing the average test values 
				la $a0,avgvalues
				jal printString
			
			# print the average value of HGB
				la $a0,hgbavg
				jal printString
				mov.s $f12,$f2
				jal printFloat
				la $a0,spacesBetween # print a space 
				jal printString

			# print the average value of BGT
				la $a0,bgtavg
				jal printString
				mov.s $f12,$f3
				jal printFloat
				la $a0,spacesBetween # print a space 
				jal printString

			# print the average value of LDL
				la $a0,ldlavg
				jal printString
				mov.s $f12,$f4
				jal printFloat
				la $a0,spacesBetween # print a space 
				jal printString


			# print the average value of BPT
				la $a0,bptavg
				jal printString
				mov.s $f12,$f5 # print the systolic value
				jal printFloat
				la $a0,COMMA # print slash to sperate the systolic and diastolic average values
				jal printString

				mov.s $f12,$f6 # print the diastolic value
				jal printFloat

				la $a0,NEWLINE # print a new line 
 				jal printString

		b loop

	
	#5 update **********************************************************************************
	five:
		# here i want to take the id, testname and testdate from the user, then find this test,
		#then if found, take another id, testname, testdate and testresult and replace the old ones.
	
		
			#reading the value from the user.
			readAgainfor51:
				la $a0,foradding1 #reading the id.
				jal printString
				li $v0,5
				syscall #to read the id from the user......
				move $v1,$v0
				move $k0,$v0
				#checking for the validity of the id.
				jal checkTID
				#if $t1 is 1 --> no error, if 0 --> error.
				bne $t1,1,readAgainfor51   #error, so repeat the input again.
				#else the id is good.
				
				move $v1,$k0
				#$v1 contains the id.
				
				# print all patient tests to let him choose the test to be deleted
				li $s0,2 # set the flag to go to retrive patient tests function , and return here
				b fromUpdate
				
				retFromPrintU:
				
				la $a0,NEWLINE
				jal printString

				readAgainfor52:
				la $a0,foradding2 #reading the test name
				jal printString
				
				la $a0,tempName
				li $a1,6 #will read the testname with null char at the end of it.
				li $v0,8
				syscall #to read the testname from the user......
				#checking for the validity of the testname.
				jal checkTName
				#if $t1 is 1 --> no error, if 0 --> error.
				beqz $t1,readAgainfor52   #error, so repeat the input again.
				#else the name is good.
				
			la $a0,tempName
			#the name is saved into tempName.
			#now the name is correct, read the date.
			#read the test date from the user------------------------------------------ 
				move $k0,$v1
				readDateAgain53:
					la $a0,foradding53
					jal printString
					#reading the string
					li $v0,8
					la $a0,tempDate
					li $a1,10		
					syscall
					jal checkTDate  # check the validity of the date 
					beqz $t1,readDateAgain53
				#the date now is saved into tempDate and $v1 is having the id.
				#now search for this test, for the first one.
				#The read date has a new line last of it, i need to clean it.
				la $a0,tempDate
				addi $a0,$a0,7 #to go to the monthes
				li $a1,'\0'
				sb $a1,($a0)
				
				move $v1,$k0
				move $v1,$k0
				move $v1,$k0
				#first thing, search for id.
				#traversing the id array is needed now, i need a counter to count how many tests i have to
				#this person (the loop counter is the number of rows).
				move $s6,$k0
				la $t2,idArr #loading the address of the id array to $t2.
				move $t0,$s1 #make $t0 the loop counter.
				move $t4,$zero #for the number of persions having the same id as the entered.
				loop51:
					beq $t0,0,end5 #stop if the counter == 0.
					lw $t3,($t2)
					addi $t2,$t2,4 #increment the address one byte (to the next id).
					subi $t0,$t0,1
					beq $s6,$t3,TargetFound51 #comparing the Entered value with the id in the array.
					#else if not the same retry.
					b loop51
				
				TargetFound51:# this id is the same as the entered one, so increment the counter and print the values.
					addi $t4,$t4,1 #this counter is useless.
					
					subi $t2,$t2,4 #return back to the id.
					la $t7,idArr
					#$t2 has the current address.
					sub $k0,$t2,$t7
					div $k1,$k0,4
					move $s7,$k1 # save the index in $s7.
				#now check the name, if not equal, go to another person.
					
					#Going to the testname index in its array.
				la $v1,tempName
				
				li $a3,0 #this var is to determine the test name, 0:hgb,bgt,ldl and 1:bpt(two cases of write, no need for all cases.).
				la $t7,testNameArr
				li $t8,4
				mul $t6,$t8,$s7 # $t6 = 4xindex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target testname address = offset + head of testnamearr.
								#-------------------
				lw $k0,($t8) # $k0=this testname, now compare this name with the test name that the user entered.
								#-------------------
				
				lw $k1,($v1)#contain the string to compare
				bne $k1,$k0,goanother51 #if not equal, go to another id.
				#if equal.. continue.
				
				#now check the data.
				#The needed date is saved in tempDate buffer.
				la $k1,tempDate
				ld $k0,($k1) #now the Date from the user is saved into $k0 and $k1 --> double.
				#getting the testDate.
				la $t7,testDateArr
				li $t8,8
				mul $t6,$t8,$s7 # $t6 = 8xindex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target testdate address = offset + head of testnamearr.
				ld $t6,($t8) #--> $t6 and $t7 has the test date.
				#comparing these two dates.
				bne $t6,$k0,goanother51
				#if equal, check the monthes.
				bne $t7,$k1,goanother51
				#if equal, then match, now update the values.
					#read the new id from the user.
				
				
				#reading the value from the user.
				readAgainfor512:
					la $a0,forupdate1 #reading the id.
					jal printString	
					li $v0,5
					syscall #to read the id from the user......
					move $v1,$v0
					#checking for the validity of the id.
					
					move $s6,$t0
					jal checkTID
					move $t0,$s6
					#if $t1 is 1 --> no error, if 0 --> error.
					bne $t1,1,readAgainfor512   #error, so repeat the input again.
					#else the id is good.
					#$v1 contains the id.
					#now save the id to its corosponding address in the main array.
					la $t7,idArr
					li $t8,4
					mul $t6,$t8,$s7 # $t6 = 8xindex (to get the offset)
					add $t8,$t7,$t6 # $t8 is the target id address = offset + head of testnamearr.
					sw $v1,($t8)#the id has updated.
					
				#now read the new testname.
				
				move $t5,$s7
				move $v1,$a3
				#reading the value from the user.
				readAgainfor522:
					la $a0,forupdate2
					jal printString
					la $a0,tempName
					li $a1,6 #will read the testname with null char at the end of it.
					li $v0,8
					syscall #to read the testname from the user......
					#checking for the validity of the testname.
					move $s6,$t0
					jal checkTName
					move $t0,$s6
					#if $t1 is 1 --> no error, if 0 --> error.
					beqz $t1,readAgainfor522   #error, so repeat the input again.
				li $a3,'\0'
				move $s7,$t5
				la $v1,tempName
				lb $a3 , 3($v1)
				lw $k0,($v1)#contain the string to compare

				la $v1,bpte
				lw $k1,($v1)
				bne $k0,$k1,setZero
				#if equal
				li $a3,1
				b con
				
				setZero:
					li $a3,0 
					b con
							
				
				con:
				la $a0,tempName
				lw $v1,($a0)
				la $t7,testNameArr
					li $t8,4
					mul $t6,$t8,$s7 # $t6 = 4xindex (to get the offset)
					add $t8,$t7,$t6 # $t8 is the target testname address = offset + head of testnamearr.
					move $k0,$k0
					
					sw $v1,($t8)#the testname has updated.
				#all above is working correctly, now update the data and the testres.
				
					#read the test date from the user------------------------------------------ 
					#move $k0,$v1
				readDateAgain533:
					la $a0,forupdate3
					jal printString
					#reading the string
					li $v0,8
					la $a0,tempDate
					li $a1,10		
					syscall
					move $s6,$t0
					jal checkTDate  # check the validity of the date 
					move $t0,$s6
					beqz $t1,readDateAgain533
				#the date now is saved into tempDate 
				
				#The read date has a new line last of it, i need to clean it.
				la $a0,tempDate
				addi $a0,$a0,7 #to go to the monthes
				li $a1,'\0'
				sb $a1,($a0)
				
				la $a0,tempDate
				ld $k0,($a0) # the read date is in k0 and k1.
				#getting the address.
				la $t7,testDateArr
				li $t8,8
				mul $t6,$t8,$s7 # $t6 = 8xindex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target id address = offset + head of testnamearr.
				
				sd $k0,($t8) #the testDate has updated.
				li $k1,15
				#if the test is bpt then read two results, else read one.
				la $t7,testResArr
				li $t8,8
				mul $t6,$t8,$s7 # $t6 = 8xindex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target id address = offset + head of testnamearr.

				beqz $a3,readOneRes51
				#else readTwoRes51....
				la $a0,forupdate5
					jal printString
					
					li $v0,6
					syscall
					mfc1 $k0,$f0 #the first res
					sw $k0,($t8)#the first res has updated.
					
					la $a0,forupdate6
					jal printString
					
					li $v0,6
					syscall
					mfc1 $k0,$f0 #the first res
					sw $k0,4($t8)#the second res has updated.
					la $a0,successUpdate
					jal printString
					li $s6,15
					
				b loop
				readOneRes51:
					la $a0,forupdate4
					jal printString
					
					li $v0,6
					syscall
					mfc1 $k0,$f0
					sw $k0,($t8)#the res has updated.
					#and store zero in the next mem add.
					li $k0,0
					sw $k0,4($t8)
					la $a0,successUpdate
					jal printString
					li $s6,15
					b loop

				goanother51:#to go to other person with different id or name or date.
					addi $t2,$t2,4
					b loop51
		
				end5:
					bne $s6,15,notfound5
					b loop
					notfound5:
						la $a0,fornotfound5
						jal printString
						b loop
		b loop
	#6 delete **********************************************************************************
	six:
		li $s6,0 # a sign that we found the target data
		readAgainfor511:
			la $a0,foradding1 #reading the id.
			jal printString
			li $v0,5
			syscall #to read the id from the user......
			move $v1,$v0
			#checking for the validity of the id.
			jal checkTID
			#if $t1 is 1 --> no error, if 0 --> error.
			bne $t1,1,readAgainfor511   #error, so repeat the input again.
			#else the id is good.
			
			# print all patient tests to let him choose the test to be deleted
			li $s0,1 # set the flag to go to retrive patient tests function , and return here
			b fromDelete
			
			retFromPrint:
			la $a0,NEWLINE
			jal printString
			
			readAgainfor521:
				la $a0,foradding2 # display a message to read the test name 
				jal printString
				
				la $a0,tempName
				li $a1,6 #will read the testname with null char at the end of it.
				li $v0,8
				syscall #to read the testname from the user......
				#checking for the validity of the testname.
				jal checkTName
				#if $t1 is 1 --> no error, if 0 --> error.
				beqz $t1,readAgainfor521   #error, so repeat the input again.
				#else the name is good.
			li $a1,'\0'	
			la $a0,tempName
			sb $a1,3($a0)
			#the name is saved into tempName.
			#now the name is correct, let's move to read the date.
			#read the test date from the user------------------------------------------ 
				move $k0,$v1 # now , k0 contains the id number
				readDateAgain531:
					la $a0,foradding53
					jal printString
					#reading the string
					li $v0,8
					la $a0,tempDate
					li $a1,10		
					syscall
					jal checkTDate  # check the validity of the date 
					beqz $t1,readDateAgain531
				#the date now is saved into tempDate and $v1 is having the id.
				#now search for this test, for the first one.
				#The read date has a new line last of it, i need to clean it.
				li $a1,'\0'	
				la $a0,tempDate
				# append a null character to the tempdate
				addi $a0,$a0,7 #to go to the monthes
				sb $a1,($a0)

				li $s6,0 # a sign that we found the target data
				#first thing, search for id.
				#traversing the id array is needed now, i need a counter to count how many tests i have to
				#this person (the loop counter is the number of rows).
				move $s6,$k0
				la $t2,idArr #loading the address of the id array to $t2.
				move $t0,$s1 #make $t0 the loop counter.
				move $t4,$zero #for the number of people having the same id as the entered.
				loop511:
					beq $t0,0,end51 #stop if the counter == 0.
					lw $t3,($t2)
					addi $t2,$t2,4 #increment the address one byte (to the next id).
					subi $t0,$t0,1
					beq $s6,$t3,TargetFound511 #comparing the Entered value with the id in the array.
					#else if not the same retry.
					b loop511
				
				TargetFound511:# this id is the same as the entered one, so increment the counter and print the values.
					addi $t4,$t4,1 #this counter is useless.
					
					subi $t2,$t2,4 #return back to the id.
					la $t7,idArr
					#$t2 has the current address.
					sub $k0,$t2,$t7
					div $k1,$k0,4
					move $s7,$k1 # save the index in $s7.
				#now check the name, if not equal, go to another person.
					
					#Going to the testname index in its array.
				la $v1,tempName
				
				li $a3,0 #this var is to determine the test name, 0:hgb,bgt,ldl and 1:bpt(two cases of write, no need for all cases.).
				la $t7,testNameArr
				li $t8,4
				mul $t6,$t8,$s7 # $t6 = 4xindex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target testname address = offset + head of testnamearr.
								#-------------------
				lw $k0,($t8) # $k0=this testname, now compare this name with the test name that the user entered.
								#-------------------
				
				lw $k1,($v1)#contain the string to compare
				bne $k1,$k0,goanother511 #if not equal, go to another id.
				#if equal.. continue.

				#now check the data.
				#The needed date is saved in tempDate buffer.
				la $k1,tempDate
				ld $k0,($k1) #now the Date from the user is saved into $k0 and $k1 --> double.
				#getting the testDate.
				la $t7,testDateArr
				li $t8,8
				mul $t6,$t8,$s7 # $t6 = 8xindex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target testdate address = offset + head of testnamearr.
				ld $t6,($t8) #--> $t6 and $t7 has the test date.
				#comparing these two dates.
				bne $t6,$k0,goanother511
				#if equal, check the monthes.
				bne $t7,$k1,goanother511
				li $s6,15 # a sign that we found the target data
				b end51 # we found the target , no need to complete !

			goanother511:#to go to other person with different id or name or date.
				addi $t2,$t2,4
				b loop511	
			
			notfound51:
				la $a0,fornotfound5
				jal printString
				b loop
			
			end51:
				bne $s6,15,notfound51
				li $t4,'\0'
				# get the address of the target id number to delete
				la $t7,idArr
				li $t8,4
				mul $t6,$t8,$s7 # $t6 = 4xindex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target testname address = offset + head of testnamearr.
				subi $s2,$s2,4 # decrease the pointer for id array (now it points to the last element)
				lw $t6,($s2) # load the last id in the array to move it instead of deleted id
				sw $t6,($t8) # store the id instead of the deleted id. so, actually we delete the target id
				sw $t4,($s2) # store null characters instead of the last raw
				beq $t8,$s2,last # in this case , the deleted test is the last element of the array 
							# we need to store null instead of deleted test only

				# get the address of the target test name to delete
				la $t7,testNameArr
				li $t8,4
				mul $t6,$t8,$s7 # $t6 = 4xindex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target testname address = offset + head of testnamearr.
				subi $s3,$s3,4 # decrease the pointer for test names array
				lw $t6,($s3) # load the last name in the array to move it instead of deleted name
				sw $t6,($t8) # store the name instead of the deleted name. so, actually we delete the target name
				sw $t4,($s3) # store null characters instead of the last raw


				# get the address of the target test date to delete
				la $t7,testDateArr
				li $t8,8
				mul $t6,$t8,$s7 # $t6 = 8xindex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target testdate address = offset + head of testnamearr.
				subi $s4,$s4,8 # decrease the pointer for test dates array
				ld $t5,($s4) # load the last date in the array to move it instead of deleted date
				sd $t5,($t8) # store the date instead of the deleted date. so, actually we delete the target date
				sw $t4,($s4) # store null characters instead of the last raw
				sw $t4,4($s4) # store null characters instead of the last raw

				# get the address of the target test result to delete
				la $t7,testResArr
				li $t8,8
				mul $t6,$t8,$s7 # $t6 = 8xindex (to get the offset)
				add $t8,$t7,$t6 # $t8 is the target id address = offset + head of testnamearr.
				subi $s5,$s5,8 # decrease the pointer for test result arrays 

				lwc1 $f2,($s5) # load the first result for the last element of result array
				swc1 $f2,($t8) # store the first result for the last element of result array instead 
							   # of the deleted result
				
				lwc1 $f2,4($s5) # load the second result for the last element of result array
				swc1 $f2,4($t8) # store the second result for the last element of result array instead 
							   # of the deleted result
				sw $t4,($s5) # store null characters instead of the last raw
				sw $t4,4($s5) # store null characters instead of the last raw
				
				subi $s1,$s1,1 # decrease the number of rows of data  
				
				
				la $a0,successRemoving
				jal printString  # print the success removing message 
				b loop	

			last: 
				sw $t4, ($s2) # store the null character instead of deleted id

				subi $s3,$s3,4 # decrease the pointer for test names array
				sw $t4, ($s3) # store the null character instead of 
				
				subi $s4,$s4,8 # decrease the pointer for test dates array
				sw $t4, ($s4) # store the null character instead of
				sw $t4, 4($s4) # store the null character instead of

				subi $s5,$s5,8 # decrease the pointer for test result arrays 
				sw $t4, ($s5) # store the null character instead of
				sw $t4, 4($s5) # store the null character instead of
				
				subi $s1,$s1,1 # decrease the number of rows of data  
				la $a0,successRemoving 
				jal printString # print the success removing message 

				b loop
	#7 exit with write to the file.**********************************************************************************
	seven:
		jal write2File
		b exit


#------------------------------------------------------------------------------------------------------
# Functions Section -----------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------

##### Error in choice selection #################################################################
errorchoice:
	la $a0,errorinchoice #putting the string to print in $a0.
	jal printString      #Calling printString function.
	b loop #return me back to choose another choice by returning to the first of the loop.

##### Error in reading ########################################################################
errorInReading:
	la $a0,errorinread
	li $v0,4
	syscall
	b exit

##### Error in opening file ####################################################################
errorFile: 
	la $a0,errorinfile
	li $v0,4
	syscall
	b exit

##### Error in the Data stored in the file ########################################################
errorInData:
   la $a0,errorindata
   li $v0,4
   syscall
   addi $s0,$s0,1 # the row index starts form 0 , so we need to add 1 , to start from 1
   move $a0,$s0 # move the row number that contains the errro
   li $v0 ,1
   syscall
   b exit

##### Unknown Error #############################################################################
unknownError:
	la,$0,unknown
	li $v0,4
	syscall
	b exit

##### Check the ID number entered by the user ##################################################
checkTID:
	# this function will check the value of id entered by the user and saved in $v1
	li $t2,1000000
	li $t3,9999999
	blt $v1,$t2,errid # compare the entered id if it's in the allowed range
	bgt $v1,$t3,errid
	li $t1,1 # set the register t1 to 1 if the id number is accepted
	jr $ra
	
	errid:  li $t1,0 # reset the register t1 if the id number is no rejected
	li,$v0,4
	la,$a0,errorAdding1 # show the error message
	syscall
	jr $ra

##### Check the test name entered by the user ##################################################
checkTName:
	move $s7,$ra
	li $t0,0 # this is a counter for the number of characters in the entered string
	la $t3,tempName
	
	# this loop will check for the test name if it contains only three characters , if true, 
	# it will store the characters into t7,t8,t9
	loopCheckName:
			lb $t4,($t3) # load every character in the entered string
			addi $t3,$t3,1 # increase the pointer to the string
			beq $t4,'\0',endCheckName
			addi $t0,$t0,1 # increase the counter for the characters
			bgt $t0,4,errname
			b loopCheckName
			
	errname:
			li $t1,0 # reset the t1 if the test name is rejected
			li,$v0,4
			la,$a0,errorAdding2 # show the error message
			syscall
			jr $s7

	endCheckName: 
		blt $t0,3,errname # check if the test name size is less than two
		la $t3,tempName # reinitialize the pointer to the temp test name (in this case it's accepted)
		li $t2,'\0' 
		sb $t2,3($t3)  # insert a null character to the test name 
		
		lw $t6,($t3) # check if the test name is one of the 4 defined test in our program
		jal determineTest
		beqz $t7,errname # if the t7 is zero , the test name is undefined

		li $t1,1 # set the t1 by 1 if the test name is accepted 
		# store the three characters into 3 registers to prepar them to be adding into the array
		lb $t7,($t3) 
		lb $t8,1($t3)
		lb $t9,2($t3)
		jr $s7

##### Check the test date entered by the user ##################################################
checkTDate:
	move $t9,$ra
	li $t0,0 # this is a counter for the number of characters in the entered string
	la $t3,tempDate
	
	# this loop will check for the test name if it contains only sevem characters , if true, 
	# it will store the characters into t7,t8,t9
	loopCheckDate:
			lb $t4,($t3) # load every character in the entered string
			addi $t3,$t3,1 # increase the pointer to the string
			beq $t4,'\0',endCheckDate
			addi $t0,$t0,1 # increase the counter for the characters
			bgt $t0,8,errdate
			b loopCheckDate
			
	errdate:
			li $t1,0 # reset the t1 if the test name is rejected
			li,$v0,4
			la,$a0,errorAdding3 # show the error message
			syscall
			jr $t9

	endCheckDate: 
		blt $t0,8,errdate # check if the test name size is less than 7
		la $t0,tempDate # reinitialize the pointer to the string antered by user (date)
		la $t2,year
		la $t3,month
		
		# check the validity of the year
		lb $t5,($t0) #2
		lb $t6,1($t0)#0
		lb $t7,2($t0)#2
		lb $t8,3($t0)#4
		
		# split the year and store it into separate string 
		sb $t5,($t2)
		sb $t6,1($t2)
		sb $t7,2($t2)
		sb $t8,3($t2)
		
		li $t6,'\0' # add null character 
		sb $t6,4($t2)
		
		# check if the year entered is more than the current year
		la $a0,year
		jal str2int	
		bgt $v0,2024,errdate
			
		# check the validity of month
		lb $t5,5($t0)
		lb $t6,6($t0)
		
		# split the month and store in into separate string
		sb $t5,($t3)
		sb $t6,1($t3)
		
		li $t6,'\0' # add null character
		sb $t6,2($t3)
		
		# check if the year entered is more than the current year
		la $a0,month
		jal str2int
		
		bgt $v0,12,errdate
		li $t1,1 # set the t1 by 1 if the test name is accepted 
		jr $t9

##### Check the test result entered by the user ##################################################
checkTResult:
	l.s $f1, myFloat
	c.lt.s $f0,$f1
	bc1f errres
	li $t1,1 # set the flag with 1 if the value is accepted
	jr $ra
	
	errres:
			li $t1,0 # reset the t1 if the test name is rejected
			li,$v0,4
			la,$a0,errorAdding4 # show the error message
			syscall
			jr $ra

##### Determine the test name unique code ########################################################
determineTest:
	la,$a0,strHGB # store the address of the string "HGB"
	la,$a1,strBGT # store the address of the string "BGT"
	la,$a2,strLDL # store the address of the string "LDL"
	la,$a3,strBPT # store the address of the string "BPT"

	lw	$k0 , ($a0) # k0 will contain the word "HGB"
	lw	$k1 , ($a1) # k1 will contain the word "BGT"
	lw	$t8 , ($a2) # t8 will contain the word "LDL"
	lw	$t9 , ($a3) # t9 will contain the word "BPT"

	beq	$t6,$k0,isHGB # check if the test is HGB
	beq	$t6,$k1,isBGT # check if the test is BGT
	beq	$t6,$t8,isLDL # check if the test is LDL
	beq	$t6,$t9,isBPT # check if the test is BPT
	li $t7,0 # if none, reset $t7 to zero
	jr	$ra # if none, branch 
	
	isHGB:
		li $t7,1 # the code is 1 for HGB
		jr $ra
	isBGT:
		li $t7,2 # the code is 2 for BGT
		jr $ra
	isLDL: 
		li $t7,3 # the code is 3 for LDL
		jr $ra
	isBPT: 
		li $t7,4 # the code is 4 BPT
		jr $ra

###### Print integer ###########################################################################
printInt:
	li $v0,1
	syscall
	jr $ra

##### Print string #############################################################################
printString:
	li $v0,4
	syscall
	jr $ra	

##### Print float ################################################################################
printFloat:
	li $v0,2
	syscall
	jr $ra


##### Print on the file #############################################################################
	# when calling this function , put the number of characters you want to write into $a2
	# and put the string you want to write into the buffer "toWrite"
printf:
	# the address of input buffer will be loaded into a1
	la $s0,charToWrite
	la $k1,toWrite
	li $k0,8 # the max number of characters to write 
	
	
	lprint:
		beqz $k0,endlprint
		subi $k0,$k0,1 # decrease the loop counter
		lb $a0,($k1) # load the character from the buffer to write
		beq $a0,'\0',endlprint
		sb $a0,($s0) # store the single character 
		addi $k1,$k1,1 # increase the pointer to the buffer to write
		
		move $a0,$s7 # file descriptor
		la $a1,charToWrite # load the address of the input buffer
		li $a2,1 # we want to write every character separately
		li,$v0,15 # the write to file code is 15
		syscall
		b lprint

	endlprint:
		jr $ra

#### Read File ####################################################################################
readFile:
	move $t1,$ra
	
	la $a0,filedes  #loading the file address.
	li $a2,0 #ignored
	li $a1,0  #open file to read.
	li $v0,13  # open file with system call.
	syscall
	#Now the file is opened, I need to read the file..


	blt $v0,0,errorFile # check if there is an error while opening the file ( if $v0 negative )
	#else if the file opend, print the file opened successflyy.
	move $t0,$v0   #now $t0 contains the file descreptor.
	move $t2,$v0   # save the file descriptor to close the file 	 
	la $a0,successopen
	jal printString


	#Now let's read from the file.
	move $a0,$t0  #file descreptor.
	la $a1,readBuffer # address of input buffer.
	li $a2,5000   #Maximum number of char to read.
	li $v0,14   #Read file code
	syscall 
	move $t8,$a0 #to save the file descreptor.

	blt $v0,0,errorInReading #Print a message if there is an error while reading from the file.
	#else.....
	move $t0,$v0 #To save the number of char reads.
	la $a0,successread
	jal printString

	#Printing the number of char readen.
	move $a0,$t0
	jal printInt
	la $a0,NEWLINE
	jal printString
	move $s0,$t0 # to store the number of chracter read from the file 
	
	# close the file 
	li $v0,16
	move $a0,$t2 # move the file decsriptor to the a0
	syscall # close the file 

	jr $t1


##### Write the the File #########################################################################
write2File:
	move $t9,$ra

	la $a0,filedes  #loading the file address.
	li $a2,1 #open file to write.
	li $a1,1  #ignore.
	li $v0,13  # open file with system call.
	syscall

	blt $v0,0,errorFile # check if there is an error while opening the file ( if $v0 negative )
	#else if the file opend, print the file opened successflyy.
	move $s7,$v0   #now $s7 contains the file descreptor.
	la $a0,successopen
	jal printString
	
	# store the addresses of data arrays in our program
	li $t0,0
	la $t1,idArr 
	la $t2,testNameArr
	la $t3,testDateArr
	la $t4,testResArr
	la $t5, toWrite # the address of the buffer for writing 
	li $t6,0 # this is the loop counter 
	li $t8,0
	li $a0,0
	li $a1,0
	li $a2,0
	li $a3,0
	li $k0,0
	li $k1,0

	loopwrite:
		bge $t6,$s1,endwrite
		addi $t6,$t6,1 # increase the loop counter
		
		# (((((((((( print the id number ))))))))))))))) 
		
		lw $t7,($t1) # load the integer value into t7 to prepare it to covert to string
		jal resetWrite # reset the buffer
		jal int2str # call the function that convert the integer value to string
		# now the string is stored in the tempWrite
		jal printf
		addi $t1,$t1,4 # increase the pointer to array of IDs (by an 4byte offset)
		
		# (((((((((( print the ': ' )))))))))))))))  
		jal resetWrite # reset the buffer
		la $t8,semi_space
		lb $t7,($t8) # load the first char which is ':'
		sb $t7,($t5) # write the first char to the buffer

		lb $t7,1($t8) # load the second char which is ' '
		sb $t7,1($t5) # write the second char to the buffer

		jal printf


		# (((((((((( print the test name )))))))))))))))  
		li $s6,0 # initialize the counter for the BPT test 
		jal resetWrite # reset the buffer

		lb $t7,($t2) # load the first character of test name
		beq $t7,'B',yub1
		b nop1
		yub1: addi $s6,$s6,1 # put 1 if it's bpt
		nop1:
		sb $t7,($t5) # store the first character of test name 


		lb $t7,1($t2) # load the first character of test name
		beq $t7,'P',yub2
		b nop2
		yub2: addi $s6,$s6,1 # put 1 if it's bpt
		nop2:
		sb $t7,1($t5) # store the first character of test name 
		
		lb $t7,2($t2) # load the first character of test name
		beq $t7,'T',yub3
		b nop3
		yub3: addi $s6,$s6,1 # put 1 if it's bpt
		nop3:
		sb $t7,2($t5) # store the first character of test name 
		
		addi $t2,$t2,4 # increase the pointer to the array of test names

		jal printf

		# (((((((((( print the ', ' )))))))))))))))  
		jal resetWrite # reset the buffer
		la $t8,comma_space
		lb $t7,($t8) # load the first char which is ':'
		sb $t7,($t5) # write the first char to the buffer

		lb $t7,1($t8) # load the second char which is ' '
		sb $t7,1($t5) # write the second char to the buffer

		jal printf

		# (((((((((( print the date ))))))))))))))) 
		jal resetWrite # reset the buffer
		lw $t7,($t3) # load the integer value into t7 to prepare it to covert to string
		sw $t7,($t5) # store the first part of the date into the buffer
		jal printf # print the first part of the date 

		jal resetWrite # reset the buffer
		lw $t7,4($t3) # load the integer value into t7 to prepare it to covert to string
		sw $t7,($t5) # store the first part of the date into the buffer
		jal printf # print the first part of the date 
		
		addi $t3,$t3,8 # increase the pointer to array of tests dates

		# (((((((((( print the ', ' )))))))))))))))  
		jal resetWrite # reset the buffer
		la $t8,comma_space
		lb $t7,($t8) # load the first char which is ':'
		sb $t7,($t5) # write the first char to the buffer

		lb $t7,1($t8) # load the second char which is ' '
		sb $t7,1($t5) # write the second char to the buffer

		jal printf

		# (((((((((( print the result )))))))))))))))
		beq $s6,3,bptres # check if the test is bpt

		lwc1 $f2 , ($t4) # load the first and only result (float number)
		jal float2int  # split the integer part and fraction part in a3 and t7  		
		jal resetWrite # reset the buffer
		jal int2str # t7 already have the value of integer part of the result , so we will write it first
		
		jal printf

		# print the dot between the integer value and fraction value
		jal resetWrite # reset the buffer
		li $t8,'.'
		sb $t8,($t5) 
		jal printf

		move $t7,$a3 # now we want to write the fraction part stored in a3
		jal resetWrite # reset the buffer
		jal int2str # t7 already have the value of integer part of the result , so we will write it first

		jal printf

		addi $t4,$t4,8 # move the pointer to array of results to the next result

		b prtline # to print a new line before continue the loop

		bptres:
			# the test is bpt , so we need to store 2 results , the systolic and diastolics
			lwc1 $f2 , ($t4) # load the first and result (systolic)
			jal float2int  # split the integer part and fraction part in a3 and t7
			jal resetWrite # reset the buffer
			jal int2str # t7 already have the value of integer part of the result , so we will write it first

			jal printf

			# print the dot between the integer value and fraction value
			jal resetWrite # reset the buffer
			li $t8,'.'
			sb $t8,($t5) 
			jal printf
			
			move $t7,$a3 # now we want to write the fraction part stored in a3
			jal resetWrite # reset the buffer
			jal int2str # t7 already have the value of integer part of the result , so we will write it first

			jal printf

			# (((((((((( print the ', ' )))))))))))))))  
			jal resetWrite # reset the buffer
			la $t8,comma_space
			lb $t7,($t8) # load the first char which is ':'
			sb $t7,($t5) # write the first char to the buffer

			lb $t7,1($t8) # load the second char which is ' '
			sb $t7,1($t5) # write the second char to the buffer

			jal printf


			lwc1 $f2 , 4($t4) # load the second result (diastolic)			
			jal float2int  # split the integer part and fraction part in a3 and t7
			jal resetWrite # reset the buffer
			jal int2str # t7 already have the value of integer part of the result , so we will write it first

			jal printf

			# print the dot between the integer value and fraction value
			jal resetWrite # reset the buffer
			li $t8,'.'
			sb $t8,($t5) 
			jal printf

			move $t7,$a3 # now we want to write the fraction part stored in a3
			jal resetWrite # reset the buffer
			jal int2str # t7 already have the value of integer part of the result , so we will write it first

			jal printf

			addi $t4,$t4,8 # move the pointer to array of results to the next result

		prtline:
			# (((((((((( print the new line )))))))))))))))  
			jal resetWrite # reset the buffer
			beq	 $t6,$s1,endwrite # in the last row, i don't want a new line character to be written
			la $t8,NEWLINE
			lb $t7,($t8) # load the first char which is ':'
			sb $t7,($t5) # write the first char to the buffer

			jal printf
			
			b loopwrite
	
	endwrite:
		# close the file 
		li $v0,16
		move $a0,$s7 # move the file decsriptor to the a0
		syscall # close the file 
		
		la $a0,bye
		jal printString
		jr $t9

##### String to Float #############################################################################
str2float:
	#input--> $a1 is the address of the null terminated string. $f0 is the output floating point.
	li $v0, 0 # Initialize: $v0 = sum = 0
	li $v1, 10 # Initialize: $v1 = 10
	L1: 
		lb $a1, 0($a2) # load $t1 = str[i], each char is one byte, so taking each char alone.
	
	
	beq $a1,'.',L2 #if the char is '.', then i have to divide by 10 then 100 then 1000 and so on.
	blt $a1, '0', done # exit loop if ($t1 < '0'), if not number.
	bgt $a1, '9', done # exit loop if ($t1 > '9'), if not number.
	addiu $a1, $a1, -48 # Convert character to digit.
	mul $v0, $v0, $v1 # $v0 = sum * 10.
	addu $v0, $v0, $a1 # $v0 = sum * 10 + digit.
	addiu $a2, $a2, 1 # $a0 = address of next char.
	mtc1 $v0,$f0
	cvt.s.w $f0,$f0
	j L1 # loop back
	
	L2:#this loop is for the after '.' numbers.
		#v0 has the integer result, i need to make it float.
		mtc1 $v0,$f0
		cvt.s.w $f0,$f0 #now $f0 carries the floating point of the integer sum.($f0 is the sum.)
		l.s $f2,fp2 #the base to multiplly.
		l.s $f3,fp2 #fixed.
	loopForfloating:
		addiu $a2,$a2,1 #moving to the first number after the '.'.
		lb $a1,0($a2) #loading this char.
		blt $a1,'0',done #not number.
		bgt $a1,'9',done #also not number.
		#if number, convert it to digit.
		addiu $a1,$a1,-48 #Converts the char to digit.(integer)
		mtc1 $a1,$f1
		cvt.s.w $f1,$f1 # the digit now is floating.
		div.s $f1,$f1,$f2 #dividing the digit with 10 then after 100 then 1000 and so on.
		mul.s $f2,$f2,$f3 #make 10 100, and 100 1000 and so on.
		add.s $f0,$f1,$f0 #add the float to the normal sum.
		j loopForfloating
	
	done: jr $ra # return to caller


##### String to Ineger #######################################################################
str2int:
	li $v0, 0 # Initialize: $v0 = sum = 0
	li $a1, 10 # Initialize: $a1 = 10
	lp1: lb $v1, 0($a0) # load $t1 = str[i]
		blt $v1, '0', lp1done # exit loop if ($t1 < '0')
		bgt $v1, '9', lp1done # exit loop if ($t1 > '9')
		addiu $v1, $v1, -48 # Convert character to digit
		mul $v0, $v0, $a1 # $v0 = sum * 10
		addu $v0, $v0, $v1 # $v0 = sum * 10 + digit
		addiu $a0, $a0, 1 # $a0 = address of next char
		j lp1 # loop back
	lp1done: jr $ra # return to caller

###### count the number of rows #################################################################
countRows:
	la $t3,readBuffer # $t1 points to the frist char from our data from the file
	li $t0, 0       # initialize newline count to 0
  	li $t1, 0       # initialize loop counter to 0
  	li $t2, 0 		# initialize loop counter for the single row
  	move $t5,$s0   # t2 is the counter that contains initially the number of character of our data
	la $t6,rowsLength 
	looprows:
	
		# check if loop has reached the end
		# branch to end if loop counter exceeds total characters
		bge $t1, $t5, end  
		
		lb $t4, ($t3)  # load byte into t4 from the string stored in t3 (our data)
		addi $t3,$t3,1 # increase the pointer to the next byte
		
		# increase the counter for the loop
		addi $t1,$t1,1 
		
		# Check for newline character
		beq $t4,10, next 
		
		# increase the counter for the single line
		addi $t2,$t2,1 
		b looprows

	next:
		addi $t0,$t0,1 # increase the counter for lines
		sb $t2,($t6) # store the length of every line to the array of rows length
		addi $t6,$t6,1 # increase the pointer to the array
		li $t2,0 # reset the counter for the single line
		b looprows

	end:
		addi $t0,$t0,1 # increase the counter for lines
		sb $t2,($t6) # store the length of every line to the array of rows length
		# Print newline count (modify to your desired output method)
		move $s1,$t0 # store the number of rows in my file 
	jr $ra

######### Convert float to integer #################################################################
float2int:
	# the input float number is in $f2
	# the output is in the buffer called "toWrite" 
	
	# Extract sign, exponent, and mantissa
	trunc.w.s $f1, $f2
	
	# Move the integer part to a general-purpose register
    mfc1 $t7, $f1
	
	cvt.s.w $f1,$f1

	# Subtract the integer part from the floating-point number to get the fractional part
    sub.s $f3, $f2, $f1 ##### there is a problem in this instruction , the result is not precise

	li $t8,1000
	mtc1 $t8,$f4 # $f4= 1000.0
	cvt.s.w $f4,$f4

	# Convert the fractional part to an integer 
    mul.s $f3, $f3, $f4  # Multiply by 1000
    cvt.w.s $f3, $f3     # Convert to integer

    # Move the fractional part to a general-purpose register
    mfc1 $a3, $f3

	# now , $a3 will contain the integer part of the floating point number 
	# and $t7 will contain the fraction part 
	jr $ra

###### convert integer to String ################################################################## 
int2str:
    # t7 will contain the integer number (input)
	# the output will be on the tempWrite space in the memory 

	# Initialize buffer pointer
    la $a0, tempWrite
	la $a1, toWrite
    
    # Load integer from register $t7
    move $t0, $t7 
        
	convert:
		# Convert integer to string
		li $k0, 10 # Base 10
		li $k1, 0  # counter for the number of digits
		
	convert_loop:
		div $t0, $k0   # Divide the number by 10
		mfhi $a2       # Remainder
		addi $a2, $a2, 48  # Convert digit to ascii
		sb $a2, 0($a0) # Store digit in buffer
		addi $a0, $a0, 1  # Move buffer pointer to the next position
		addi $k1, $k1, 1  # Increment digit counter
		mflo $t0       # Quotient
		bnez $t0, convert_loop  # Repeat until quotient is zero
		
	# Null-terminate the string
	sb $zero, 0($a0)
	subi $a0,$a0,1 # move the pointer to the character that is before the null character
	
	li $k0,7 # initialize the counter for the loop

	# the number stored in tempWrite is reversed , so we want to get the write form of the integer
	reverse:
		beqz $k0,endrev
		subi $k0,$k0,1 # decrease the loop counter
		lb $a2,($a0) # get the characters in reverse order
		sb $a2,($a1) # store the character in the final string
		subi $a0,$a0,1 # move the pointer for original string to the previous character
		addi $a1,$a1,1 # increase the pointer for the final string
		b reverse
	
	endrev:
		li $k0,'\0'
		sb $k0,($a1) # append the null character to the final string
		jr $ra


########### reset the temp buffer for write ########################################################
resetWrite: 
	li $v1,'\0'
	sb $v1,($t5)
	sb $v1,1($t5)
	sb $v1,2($t5)
	sb $v1,3($t5)
	sb $v1,4($t5)
	sb $v1,5($t5)
	sb $v1,6($t5)
	sb $v1,7($t5)
	jr $ra

######	Fill Arrays  ##############################################################################
fillArrays:
	# save the value of ra , because we will call the functions str2float and str2int
	# so that the progress will be lost if we don't save the value of $ra
	move $t9,$ra 
	la $t0,readBuffer # $t0 points to the frist char from our data from the file
	li $s0, 0 # the loop counter 
	#####################
	# Black list
	# t0 for read buffer
	# s0 loop counter
	# s6 for BPT


	# these adresses are used to fill the following arrays
	la $s2,idArr
	la $s3,testNameArr
	la $s4,testDateArr
	la $s5,testResArr	

	outer:
		bge $s0,$s1,end1 #if the loop counter is bigger than the number of rows, go to end1.
		############li $t4 , 7 # the id counter
		la $t2,tempID

		
		# a counter to check if the test name is BPT , this test has some specific operations
		# because it contains two results 
		li $s7,0 
	
	loopid:  #this loop will store the id from the file buffer, to a temp buffer to convert it to integer later.
		lb $t5,($t0) # load every digit in the read buffer
		addi $t0,$t0,1 # increase the pointer to the string in mempory (all data)
		beq $t5,':',continue_id # when we finish loading the 7 digits id , continue the outer loop
		beq $t5,' ',loopid
		sb $t5,($t2) # store the digit into an empty string to convert it to int later
		addi $t2,$t2,1 # increase the pointer to the empty space to store id 
		########################## subi $t4,$t4,1 # decrese the loop counter
		b loopid
		
	continue_id:
		li $t4,7 # reinitialize the coutner for id
		la $a0,tempID # store the address of our string id to convert it to int 
		jal str2int # convert the id string into unsigned int 
		move $v1,$v0 # move the converted int to v1 in order to check it's validity 
		jal checkTID # check the validity of id 
		beqz $t1,errorInData
		# if it reaches here, the id is correct
		sw $v0,($s2) # store the converted integer into the array of ids
		addi $s2,$s2,4 # increase the poiner to the array of ids (every element has word length)
		################### addi $t0,$t0,2 # increase the t0 twice , to ignore the ':' and space after it
	
	la $t4,tempName # load the address of temp name that we will check it's validity
	
	loopname:
		# load the characters of the test name
		lb $t5,($t0) # load the character into t5
		addi $t0,$t0,1 # increase the pointer to the buffer
		beq $t5,' ',loopname
		beq $t5,',',continue_name
		sb $t5,($t4) # store the test name to the temp name in order to check it's validity
		addi $t4,$t4,1 
		b loopname
		
	continue_name:
	# li $t5,'\0'
	# sb $t5,($t4)  # insert a null character to the last of test name 
	la $t4,tempName # load the address of temp name that we will check it's validity
	lw $t6,($t4) # load the test name into $t5
	
	move $t5,$t9 # save the progress because the function below modifies the value of $t9
	move $s6,$t0 # save the progress pointer
	jal checkTName # check the validity of the name 
	beqz $t1,errorInData
	
	move $t0,$s6 # recover the pointer to the buffer
	
	li $s7,0 # this is a counter to determine if the test is BPT or not 
	
	beq $t7,'B',yes1
	b no1
	yes1:addi $s7,$s7,1
	no1:
	
	beq $t8,'P',yes2
	b no2
	yes2:addi $s7,$s7,1
	no2:
	
	beq $t9,'T',yes3
	b no3
	yes3:addi $s7,$s7,1
	no3:


	# check if the test is BPT or not 
	li $s6,0 # initialize the flag for BPT with zero (suppose it's not BPT)
	beq $s7,3,bpt # if it's BPT set the flag with 1
	b notbpt 
	bpt: li $s6,1
	notbpt:
	
	
	
	sb $t7,($s3) # store the first char of test name into the array
	addi $s3,$s3,1 # increase the pointer to the array
	sb $t8,($s3) # store the second char of test name into the array
	addi $s3,$s3,1 # increase the pointer to the array
	sb $t9,($s3) # store the third char of test name into the array
	addi $s3,$s3,1 # increase the pointer to the array
	
	move $t9,$t5 # recover the progress again

	li $t5,'\0' # define the null character
	sb $t5,($s3) # add the null character to the test name , to make the test name in a single word
	addi $s3,$s3,1
	
	################addi $t0,$t0,2 # increase the t0 twice , to ignore the ',' and space after it
	
	####################li $t4 , 7 # we will use this as counter for the date 
	
	la $t4 , tempDate # load the buffer for temp date 

	loopdate:# this loop is for storing the date to date array
		lb $t5,($t0) # load every digit that we are sure that it's date digit
		addi $t0,$t0,1 # increase the pointer to the string in mempory (all data)
		beq $t5,',',continue_date # when we finish loading the 7 digits id , continue the outer loop
		beq $t5,' ',loopdate # skip the white space
		
		sb $t5,($t4) # store the digit into the temp date
		addi $t4,$t4,1 # increase the pointer to the empty space to store date
		#######################subi $t4,$t4,1 # decrese the loop counter
		b loopdate

	continue_date:
		li $t5,'\n' # define the null character
		sb $t5,($t4) # add the null character to the test date , to make the test date in a double word
		
		move $k0,$t9 # save the progress because the function below modifies the value of $t9
		
		move $k1,$t0 # save the progress of the input buffer
		jal checkTDate
		beqz $t1,errorInData
		
		move $t9,$k0
		move $t0,$k1 # save the progress of the input buffer
		# if it reaches here, the date is valid , and countinue 
		la $t4,tempDate # load the date that we want to add it to the array of dates 
		
		li $k0,'\0' # load the null character
		sb $k0,7($t4) # replace the \n character at the end of date , with null character 
		
		lw $t5($t4) # load a word of the date 
		sw $t5,($s4) # store in the array of dates
		addi $s4,$s4,4 # increase the pointer to the array by a size of word

		lw $t5,4($t4) # load a word of the date 
		sw $t5,($s4) # store in the array of dates
		addi $s4,$s4,4 # increase the pointer to the array by a size of word
		
		
		################ addi $t0,$t0,2 # increase the t0 twice , to ignore the ',' and space after it
		la $t7,tempRes
		beq $s6,1,BPT # if the test is BPT , there is two results for this test 
		
		# lb $t8,($t1) # t7 will contain the length of this row of data
		# addi $t1,$t1,1 # increase the pointer for rowsLength
		# subi $t8,$t8,23 # after this operation , we will have only the length of the float number
	
	
	
	loopRes:# this loop is to store the testresult into tempstring to convert it into floating point.
		lb $t5,($t0) # load every digit that we are sure that it's from testresult 
		addi $t0,$t0,1 # increase the pointer to the string in mempory (all data)
		
		beq $t5,' ',loopRes # if we have a white space , ignore it 
		beq $t5,'\n', continue_res # when we reach the last of the line , stop reading
		
		sb $t5,($t7) # store the digit into an empty string to convert it to float later
		addi $t7,$t7,1 # increase the pointer to the empty space to store id 
		################################33subi $t8,$t8,1 # decrese the loop counter
		b loopRes

	continue_res:
		 li $t5,'\0'
		 sb $t5,($t7) # add a null to the end of temp res 
		 
		 la $a2,tempRes # load the address of string float into a0 to convert to floating point	
		 jal str2float  # call the function that will convert the number in $a0 into float
		 				# the float value here is wrong 
		 jal checkTResult
		 beqz $t1 , errorInData
		 swc1 $f0,0($s5) # store the result of conversion into the array of test results
		 addi $s5,$s5,4 # increase the counter for result arrays by a word size
		 
		 # store the rest of double word size(this is for if the test is bpt it contains two 
		 #results, so to store the second res into the second florat register, if not bpt,
		 # then stor null chars into it.)
		 sw $t5,($s5) # store the null characters at the rest of the double word 

		 addi $s5,$s5,4 # increase the counter for result arrays by a word size
		 
		 # reset the tempRes
		 la $a0,tempRes # load the address of string float into a0 to reset it
		 # reset the tempRes from previous values
		 sw $t5,($a0)
		 sw $t5,4($a0) 
		 
		 # increase the t0 one time , to ignore the '\n' , and now it points to the 
		 # first character of the next row
		############### addi $t0,$t0,1
		 
		b notBPT

	BPT : # in this test , we have two results, systolic and diastolic results
		 la $k0,systolic
		 la $k1,diastolic
		 addi $t1,$t1,1 # increase the pointer for rowsLength
		 
		 loopBPT1:
		 	lb $t5,($t0) # load the first character of the result1
		 	addi $t0,$t0,1 # increase the pointer to the string in mempory (all data)
		 	beq $t5,' ',loopBPT1
		 	beq $t5,',',stoploop1
		 	sb $t5,($k0) # store the character into the systolic float number space
		 	addi $k0,$k0,1 # increase the pointer to systolic
		 	b loopBPT1
	
		 stoploop1:
		 	# increase the pointer to the string by 1 , to igonre the white space after the first result
		 	addi $t0,$t0,1 
		 	
		 	sub $v1,$s1,$s0 # check if we are at the last iteration of the loop
		 	beq $v1,1,special
		 	
		 	loopBPT2:
		 		lb $t5,($t0) # load the first character of the result1
		 		addi $t0,$t0,1 # increase the pointer to the string in mempory (all data)
		 		beq $t5,' ',loopBPT2
		 		beq $t5,'\n',stoploop2
		 		sb $t5,($k1) # store the character into the systolic float number space
		 		addi $k1,$k1,1 # increase the pointer to systolic
		 		b loopBPT2
		 
		 # this special block is when the test BPT is the last row of the file , in this case , we
		 # don't have a stop character to relay on , so that we load a word to solve this problem
		special: #there is an error here, because it must be 4 digits --> 30.5 but if 12.65 it will give error.
		 	lb $t5,($t0) # load the first character of the result2
		 	sb $t5,($k1) # store the character into the diastolic float number space
		 	
		 	lb $t5,1($t0) # load the second character of the result2
		 	sb $t5,1($k1) # store the character into the diastolic float number space
		 	
		 	lb $t5,2($t0) # load the third character of the result2
		 	sb $t5,2($k1) # store the character into the diastolic float number space
		 	
		 	lb $t5,3($t0) # load the foruth character of the result2
		 	sb $t5,3($k1) # store the character into the diastolic float number space
		 	
		 	addi $t0,$t0,4 # increase the pointer to the string in mempory (all data)
		 	addi $k1,$k1,4 # increase the pointer to diastolic
		 	
		 stoploop2:
		 	li $t5,'\0'
		 	sb $t5,($k0) # add a null to the end of systolic
		 	sb $t5,($k1) # add a null to the end of diastolic
		 	
		 	la $a2,systolic # load the address of string float into a0 to convert to floating point
			jal str2float # call the function that will convert the number in $a0 into float
			jal checkTResult
		 	beqz $t1 , errorInData
			swc1 $f0,0($s5) # store the result of conversion into the array of test results
			addi $s5,$s5,4 # increase the counter for result arrays by a word size
			
			 la $a0,systolic # load the address of string float into a0 to reset it
			 # reset the systolic from previous values
			 sw $t5,($a0)
		 	 sw $t5,4($a0) 
			
			la $a2,diastolic # load the address of string float into a0 to convert to floating point
			jal str2float # call the function that will convert the number in $a0 into float
			jal checkTResult
		 	beqz $t1 , errorInData
			swc1 $f0,0($s5) # store the result of conversion into the array of test results
			addi $s5,$s5,4 # increase the counter for result arrays by a word size
		 	
		 	la $a0,diastolic # load the address of string float into a0 to reset it
		 	sw $t5,($a0)
		 	sw $t5,4($a0)
		notBPT	:	 	 	 
			addi $s0,$s0,1 # decrease the counter for data rows
	b outer
	end1:
	jr $t9


######	Exit  ##############################################################################
exit:
	li $v0, 10  #Terminate the code.
	syscall