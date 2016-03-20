RPL
( C:\Users\noten\Documents\Debug4x\Projects\CIRCUITOS\PARALELO.s, part of the CIRCUITOS.hpp project, created by <> on 13/03/2016 )

INCLUDE CIRCUITOS.h
INCLUDE CONFIGME.h

( Calcula el valor de un arreglo de impedancias en paralelo )
( x es Simbólico )
( $ es String )
xNAME ZPRL                   ( xA xB -> tagged1 )
::
	 CK2                        ( Verificar 2 ARG.: xA xB )
	 ::
	 	 2DUP                     ( xA xB xA xB )
				x*                       ( xA xB xA*B )
				UNROT                    ( xA*B xA xB )
	 		x+                       ( xA*B xA+B )
				x/                       ( x[A*B]/[A+B] )
 			xEVAL                    ( xU EVAL o no EVAL, esa es la cuestion )
				"ZPRL"                   ( xU $ )
				>TAG                     ( tagged1 )                   ( @@ )
				NOSABE                   ( tagged # )
	   GETCFGID                 ( tagged flag )
	   IT                       ( tagged )                    ( @@ )
	   ::
	     DUP                    ( tagged tagged )
	     ' ID ZPRL xSTO> DROP   ( tagged )                    ( @@ )
	   ;
	 ;
;

