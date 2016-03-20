RPL 
( C:\Users\noten\Documents\Debug4x\Projects\CIRCUITOS\DELTA-Y.s, part of the CIRCUITOS.hpp project, created by <> on 16/03/2016 )

INCLUDE CIRCUITOS.h
INCLUDE CONFIGME.h


xNAME ›Y                    ( xRA xRB xRC -> tagged tagged tagged )
::
  CK3
  ::
			 { LAM RA LAM RB LAM RC } BIND
			                          ( )
			 LAM RA LAM RB LAM RC     ( x x x )
				x+ x+                    ( x )
				{ LAM RU } BIND
				                         ( )
				LAM RA LAM RC x*         ( x )
				LAM RU x/                ( x )
				xEVAL
				"R1"                     ( x $ )
				>TAG                     ( tR1 )
								                     ( )
				LAM RB LAM RC x*         ( tR1 x )
				LAM RU x/                ( tR1 x )
				xEVAL
				"R2"                     ( tR1 x $ )
				>TAG                     ( tR1 tR2 )
				
								                     ( )
				LAM RA LAM RB x*         ( tR1 tR2 x )
				LAM RU x/                ( tR1 tR2 x )
				xEVAL
				"R3"                     ( tR1 tR2 x $ )
				>TAG                     ( tR1 tR2 tR3 )
				( @@ )
				NOSABE                   ( tR1 tR2 tR3 # )
	   GETCFGID                 ( tR1 tR2 tR3 flag )
	   IT                       ( tR1 tR2 tR3 )               ( @@ )
	   ::
	     #3 NDUP                ( tR1 tR2 tR3 tR1 tR2 tR3 )
	     ' ID R3 xSTO> DROP     ( tR1 tR2 tR3 tR1 tR2 )
	     ' ID R2 xSTO> DROP     ( tR1 tR2 tR3 tR1 )
	     ' ID R1 xSTO> DROP     ( tR1 tR2 tR3 )
	   ;                        ( tR1 tR2 tR3 )               ( @@ )
				ABND
			 ABND
  ;
;

xNAME Y›
::
  CK3
  ::
			 { LAM R1 LAM R2 LAM R3 } BIND
			                          ( )
			 LAM R1 LAM R2 x*         ( x )
			 LAM R1 LAM R3 x*         ( x x )
			 LAM R2 LAM R3 x*         ( x x x )
			 x+ x+                    ( x )
			 { LAM RU } BIND          ( )
			 
			 LAM RU LAM R2 x/         ( x )
			 xEVAL                    ( x )
			 "RA"                     ( x $ )
			 >TAG                     ( tRA )
			 
			 LAM RU LAM R1 x/         ( tRA x )
			 xEVAL                    ( tRA x )
				"RB"                     ( tRA x $ )
			 >TAG                     ( tRA tRB )
			 
			 LAM RU LAM R3 x/         ( tRA tRB x )
			 xEVAL                    ( tRA tRB x )
				"RC"                     ( tRA tRB x $ )
			 >TAG                     ( tRA tRB tRC )
			 
			 ( @@ )
				NOSABE                   ( tRA tRB tRC # )
	   GETCFGID                 ( tRA tRB tRC flag )
	   IT                       ( tRA tRB tRC )               ( @@ )
	   ::
	     #3 NDUP                ( tRA tRB tRC tRA tRB tRC )
	     ' ID RC xSTO> DROP     ( tRA tRB tRC tRA tRB )
	     ' ID RB xSTO> DROP     ( tRA tRB tRC tRA )
	     ' ID RA xSTO> DROP     ( tRA tRB tRC )
	   ;                        ( tRA tRB tRC )               ( @@ )
			 ABND
			 ABND
		;
;

