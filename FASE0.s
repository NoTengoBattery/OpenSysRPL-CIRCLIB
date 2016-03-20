RPL 
( C:\Users\noten\Documents\Debug4x\Projects\CIRCUITOS\FASE0.s, part of the CIRCUITOS.hpp project, created by <> on 16/03/2016 )

INCLUDE CIRCUITOS.h
INCLUDE CONFIGME.h

EXTERNAL xSOLVE

( Se le da un número complejo con una variable y resuelve para esta
	 de tal forma que la parte imaginaria resulte 0, es decir, que este
	 en fase )
xNAME €0FASE                 ( xA xB )
::
	 CK2&Dispatch               ( Verificar 2 ARG.: xA xB )
	 #96                        ( xA xB )
	 ::
	   #2 PICK                  ( xA xB xA )
	   "CPLX"                   ( xA xB xA $ )
	   >TAG UNROT               ( tA xB xA
	 	 SWAP xIM                 ( tA xB xIM[A] )
				ZINT 0 x=                ( tA xB xA=0 )
				SWAP                     ( tA xA xB )
	 		xSOLVE                   ( tA tagged )
				"€0"                     ( tA tS )
				>TAG                     ( tA tS )                     ( @@ )
				NOSABE                   ( tA tS # )
	   GETCFGID                 ( tA tS flag )
	   IT                       ( tA tS )                     ( @@ )
	   ::
	     DUP                    ( tA tS tS )
	     ' ID €0 xSTO> DROP     ( tA tS )                     ( @@ )
	   ;
	 ;
;
