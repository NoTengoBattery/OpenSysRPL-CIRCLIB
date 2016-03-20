RPL 
( C:\Users\noten\Documents\Debug4x\Projects\CIRCUITOS\IMPEDANCIA.s, part of the CIRCUITOS.hpp project, created by <> on 14/03/2016 )

INCLUDE CIRCUITOS.h
INCLUDE CONFIGME.h

( Calcula la impedancia: C es la capacitancia, U es o f u omega )
xNAME ZC                     ( xC xU -> tagged )
::
	 CK2
	 ::                         ( xC xU )
	   OMEGAF                   ( xC xU # )
	   GETCFGID                 ( xC xU flag )
	   IT                       ( xC xU )
	   ::
	   ( Obtener el periodo de las configuraciones del CAS )
		    { xHOME ID CASDIR ID PERIOD }  ( xC xU {} )
						FLASHPTR 002 00C       ( xC xU xPERIOD flag )
						DROP                   ( xC xU xPERIOD )
		    x*                     ( xC xU )
		  ;
		  xi                       ( xC xU xi )
		  x* x*                    ( xC*U*i )
		  xINV                     ( x1/(C*U*i )
		  xEVAL                    ( xZC )
		  "ZC"                     ( $ x )
		  >TAG                     ( tagged )
				NOSABE                   ( tagged # )
	   GETCFGID                 ( tagged flag )
	   IT                       ( tagged )                    ( @@ )
	   ::
	     DUP                    ( tagged tagged )
	     ' ID ZC xSTO> DROP     ( tagged )                    ( @@ )
	   ;
		;
;

( Calcula la impedancia: L es la inductancia, U es o f u omega )
xNAME ZL                     ( xL xU -> tagged )
::
	 CK2
	 ::                         ( xL xU )
	   OMEGAF                   ( xL xU # )
	   GETCFGID                 ( xL xU flag )
	   IT                       ( xL xU )
	   ::
	     ( Obtener el periodo de las configuraciones del CAS )
		    { xHOME ID CASDIR ID PERIOD }  ( xL xU {} )
						FLASHPTR 002 00C       ( xL xU xPERIOD flag )
						DROP                   ( xL xU xPERIOD )
		    x*                     ( xL xU )
		  ;
		  xi                       ( xL xU xi )
		  x* x*                    ( xL*U*i )
		  xEVAL                    ( xZL )
		  "ZL"                     ( $ x )
		  >TAG                     ( tagged )                    ( @@ )
		  NOSABE                   ( tagged # )
	   GETCFGID                 ( tagged flag )
	   IT                       ( tagged )                    ( @@ )
	   ::
	     DUP                    ( tagged tagged )
	     ' ID ZL xSTO> DROP     ( tagged )                    ( @@ )
	   ;
		;
;

