RPL 
( C:\Users\noten\Documents\Debug4x\Projects\CIRCUITOS\MISC.s, part of the CIRCUITOS.hpp project, created by <> on 16/03/2016 )

INCLUDE CIRCUITOS.h

EXTERNAL xCOLLECT
EXTERNAL xLINSOLVE
EXTERNAL xSOLVE
EXTERNAL xSIMPLIFY

xNAME TOOLS333               ( -> )
::
  {
	   { "COLLECT" :: xCOLLECT ; }
			 { "SIMPLIFY" :: xSIMPLIFY ; }
		  { "=" :: x= ; }
			 { "i" :: xi ; }
		  { "ARRY" :: x>ARRY ; }
		  { "LINSOLVE" :: xLINSOLVE ; }
		  { "SOLVE" :: xSOLVE ; }
		  
		  
		  NullMenuKey
		  
		  { "SALIR" ::
	     LastMenuDef@
	     LastMenuRow@
	     StartMenu
	   ; }
  }
		InitMenu
;

