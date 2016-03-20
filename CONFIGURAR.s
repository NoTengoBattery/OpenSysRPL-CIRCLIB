RPL
( C:\Users\noten\Documents\Debug4x\Projects\CIRCUITOS\CONFIGURAR.s, part of the CIRCUITOS.hpp project, created by <> on 14/03/2016 )

INCLUDE CIRCUITOS.h
INCLUDE CONFIGME.h

EXTERNAL xRECT
EXTERNAL xCYLIN
EXTERNAL ~xDEG
EXTERNAL ~xRAD

( Los índices de las listas inician en 1 )

( Menú de configuración de la biblioteca )
xNAME CONFIG333              ( -> )
::
		#0                         ( # )
		GETCFGID                   ( flag )
		ITE                        ( )
		::
	   MIMENU                   ( {} )
	   InitMenu                 ( )
	 ;                          ( )                           ( @@ )
	 ::
	   REMAKECFG                ( )
	 ;                                                        ( @@ )
;                            ( )

( Menu de Configuraciones )
NULLNAME MIMENU              ( -> {} )
  {
   {                         ( :: ETIQUETA ; :: ACCION ; )
 	  ::                       ( Frecuencia o Vel. Angular )
 		   TakeOver               (  )
 		   OMEGAF                 ( # )
 		   GETCFGID               ( flag )
 			 	DUP ITE "f"
				 	"š" ( flag $ )
 			 	SWAP                   ( $ flag )
 			 	Std/BoxLabel           ( grob )
 		 ;
 		 ::
 		   OMEGAF                 ( # )
	     TOOGLECFG              ( )
	   ;
	  }
	  {                         ( :: ETIQUETA ; :: ACCION ; )
 	  ::                       ( Frecuencia o Vel. Angular )
 		   TakeOver               (  )
 		   NOSABE                 ( # )
 		   GETCFGID               ( flag )
 			 	DUP ITE "VAR"
				 	""       ( flag $ )
 			 	SWAP                   ( $ flag )
 			 	Std/BoxLabel           ( grob )
 		 ;
 		 ::
 		   NOSABE                 ( # )
	     TOOGLECFG              ( )
	   ;
	  }
	  
	
		 { "RECTANGULAR" :: xRECT ; }
		 { "CILINDRICO" :: xCYLIN ; }
			{ "GRADOS" :: xDEG ; }
		 { "RADIANES" :: xRAD ; }
	
	  NullMenuKey
	
	  {
	  "SALIR"
	  ::
	    LastMenuDef@
	    LastMenuRow@
	    StartMenu
	  ;
	  }
  }                                                        ( @@ )

* --------------------------------------------------------------------

( Regresa True o False si existe la configuración solicitada )
( Si no existe, regenera la lista de conf. y devuelve TRUE )
( Verifica la existencia de la lista, su tamaño y el tipo de datos
	 que corresponde a la posición solicitada. )
( Si el número solicitado N es mayor a U, muestra un error )
( Si el número solicitado es 0, sólo comprueba la existencia y
	 dimensión de la lista )
NULLNAME GETCFGID            ( #N -> flag )
::
	 DUP                        ( #N #N )
	 PROPS                      ( #N #N #U )
	 #>                         ( #N flag )
	 ITE                        ( #N )
	 ::                         ( Si N > U )
	   DROP                     ( )
	   "No hay tal elemento."   ( $ )
	   FlashWarning             ( )
	   FALSE                    ( F )                         ( @@ )
	 ;
	 ::                         ( Si N <= U )
	   ERRSET                   ( #N )
	   ::
	     ID CIRCFG              ( #N Obj )
	     CK&DISPATCH0           ( #N Obj #  )
		    #5                     ( #N Obj # # )
		    ::                     ( #N {} ) ( Si Obj es Lista )
		      DUPLENCOMP           ( #N {} #L )
		      PROPS                ( #N {} #L #U )
		      #= ITE               ( #N {} flag )
		      ::                   ( Si es del tam. esperado )
		        SWAP               ( {} #N )
		        BINT0              ( {} #N #0 )
		        #2 PICK            ( {} #N #0 #N )
		        #= ITE             ( {} #N flag )
		        ::                 ( {} #N )
		          2DROP TRUE       ( T )                         ( @@ )
		        ;
		        ::                 ( {} #N )
		          NTHCOMPDROP      ( Obj )                       ( @@ )
		        ;
		      ;                    ( flag )
		      ::                   ( Si no es del tam. esperado )
		        REMAKECFG          ( #N {} )
		        2DROP TRUE         ( T )                         ( @@ )
		      ;                    ( flag )
		    ;
	   ;
	   ERRTRAP                  ( #N {} )
	   ::
	     2DROP                  ( )
	     REMAKECFG              ( )
	     TRUE                   ( T )                         ( @@ )
	   ;
	 ;
;

( Regenera la configuración )
NULLNAME REMAKECFG           ( -> )
::
 	TRUE                       ( T )
	 PROPS                      ( T # )
	 NULL{}                     ( T # {} )
	 LIST>NLIST                 ( {} )
	 ' ID CIRCFG                ( {} ID )
		xSTO> DROP                 ( )                           ( @@ )
	 "¡Config. regenerada!"     ( $ )
		FlashWarning               ( )                           ( @@ )
;

( Actualiza el valor de cualquier CFG )
NULLNAME UPDTECFG            ( Obj # -> )
::
		ID CIRCFG                  ( Obj # {} )
	 PUTLIST                    ( {} )
	 ' ID CIRCFG                ( {} ID )
		xSTO> DROP                 ( )                           ( @@ )
;

( Hace un NOT booleano y actualiza la lista de conf. )
NULLNAME TOOGLECFG           ( # -> )
::                           ( # )
	 ID CIRCFG                  ( # {} )
	 DUP                        ( # {} {} )
	 #3 PICK                    ( # {} {} # )
	 NTHCOMPDROP                ( # {} flag )
	 NOT                        ( # {} flag' )
	 XYZ>ZXY                    ( flag' # {} )
	 PUTLIST                    ( {} )
  ' ID CIRCFG                ( {} ID )
	 xSTO> DROP                 ( )                           ( @@ )
;

( Dada una lista de U objetos, devuelve una lista de N objetos )
( Si U==N, no hace nada )
( Si U>N, se trunca a N )
( Si U<N, se rellena hasta llegar a N con el Obj provisto )
NULLNAME LIST>NLIST          ( Obj #N {} -> {}' )
::                           ( Obj #N {} )
	 DUPLENCOMP                 ( Obj #N {} #U )
	 ROT                        ( Obj {} #U #N )
	 2DUP#= case                ( Obj {} #U #N flag )
	 ::                         ( Obj {} #U #N )
	   2DROP                    ( Obj {} )
	   SWAPDROP                 ( {} )                        ( @@ )
	 ;
	 2DUP#< case                ( Obj {} #U #N flag )
	 ::                         ( Obj {} #U #N )
	   SWAP                     ( Obj {} #N #U )
	   #-                       ( Obj {} #N-U )
	   ROTSWAP                  ( {} Obj #N-U )
	   NDUPN                    ( {} Obj..ObjN-U #N-U )
	   {}N                      ( {} {}' )
	   &COMP                    ( {} )                        ( @@ )
	 ;                                 	
	 2DUP#> case                ( Obj {} #U #N flag )
	 ::                         ( Obj {} #U #N )
	   SWAPDROP #0 SWAP         ( Obj {} #0 #N )
	   SUBCOMP                  ( Obj {}' )
	   SWAPDROP                 ( {} )                        ( @@ )
	 ;
;


