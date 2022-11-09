'XBOX AVIP selector:
'By professor_jonny
'program to automatically set a  default av pack type if no av pack
'is plugged into the xbox at boot up.
'
'Forced pack type can be set by the mode select pins,
'C.1 to C.2 is set as the mode select jumpers.
'
'B.3 to B.5 is the pins to the av port
'
'B.2 is the pin to connect to the Xbox reset line
'
'I believe there is only 5 pack types so there are other possible binary modes
'but none are used that I am aware of so I have ignored coding for them
'
'this is untested on an actual xbox as of yet but the program simulates perfectly


{ ;Symbols
symbol varA = b0
symbol varB = b1
symbol varC = b2
symbol varD = b3
symbol varE = b4
symbol varF = b5
symbol varG = b6
symbol varH = b7
symbol varI = b8
symbol varJ = b9
symbol varK = b10
symbol varL = b11
symbol varM = b12
symbol varN = b13
symbol varO = b14
symbol varP = b15
symbol varQ = b16
symbol varR = b17
symbol varS = b18
symbol varT = b19
symbol varU = b20
symbol varV = b21
symbol varTEMPBYTE1 = b22
symbol varTEMPBYTE2 = b23
symbol varTEMPBYTE3 = b24
symbol varTEMPBYTE4 = b25
symbol varTEMPBYTE5 = b26
symbol varTEMPBYTE6 = b27
symbol varTEMPWORD1 = w11
symbol varTEMPWORD2 = w12
symbol varTEMPWORD3 = w13
}


main:
Start:
	
	pullup %00000111						'enable internal pullup resistors
									'on port c pins
	input B.3, B.4, B.5 					'Set mode select pins as inputs
	
	pause 200							'wait .2 sec before checking
	if pinB.5=0 AND pinB.4=0 AND pinB.5=0 then 	'if no AV pack is plugged in

		goto AVpack_not_detected
	end if

	goto Xbox_reset_Check					'Pack detected wait for Xbox reset
									'to check for new pack

AVpack_not_detected:						'Check mode select jumpers 
									'and set aproprate pack type
	
	output B.3, B.4, B.5					'Set mode select terminals
									'as outputs
									
	if pinC.0=1 AND pinC.1=1 AND pinC.2=0 then	'Mode 110 standard AV jumper select

		goto Set_standard_AV_pack
	end if
	if pinC.0=1 AND pinC.1=0 AND pinC.2=0 then	'Mode 100 advanced AV jumper select

		goto Set_advanced_AV_pack
	end if
	if pinC.0=0 AND pinC.1=0 AND pinC.2=1 then	'Mode 001 component AV jumper select

		goto Set_component_AV_pack
	end if
	if  pinC.0=1 AND pinC.1=1 AND pinC.2=0 then	'Mode 010 VGA AV jumper select

		goto Set_VGA_AV_pack
	end if
	if pinC.0=0 AND pinC.1=0 AND pinC.2=0 then	'Mode 000 RGB AV jumper select

		goto Set_RGB_AV_pack
	end if
	goto Set_component_AV_pack				'if no jumper is selected select
									'Mode 110 component AV 

Set_standard_AV_pack:						'Set mode 110 standard AV
	
	high B.3, B.4
	low B.5

	goto Xbox_reset_Check

	
Set_advanced_AV_pack:						'Set mode 100 Advanced AV
	
	high B.3
	low B.4, B.5

	goto Xbox_reset_Check


Set_component_AV_pack:						''Set mode 001 component AV

	high B.5
	low B.3, B.4

	goto Xbox_reset_Check



Set_VGA_AV_pack:							'Set mode 010 VGA AV

		
	high B.4
	low B.3, B.5

	goto Xbox_reset_Check


Set_RGB_AV_pack:							'Set mode 000 RGB AV
	
	low B.3, B.4, B.5
	
	goto Xbox_reset_Check
	
	
Xbox_reset_Check:
	if pinB.2=1 then						'If Xbox is reset restart pack check

		goto Start
	end if

	goto Xbox_reset_Check


#no_data	'reduce download time


