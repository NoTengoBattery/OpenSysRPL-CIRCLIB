* entries of the file PARALELO.s
E xZPAR

* entries of the file IMPEDANCIA.s

* entries of the file CONFIGURAR.s
E xConfigurar
E MIMENU
E GETCFGID
E REMAKECFG
E TOOGLECFG
E LIST>NLIST

* The file has this format - all lines start in column 1:
*       *  Lines starting with * are ignored
*          Lines starting with a space are ignored
*          It is easy to turn off compression by changing E to space,
*          etc.
*       E xName     this will compress xName. When referenced xName
*                   will
*                   be uncompressed and (E)valuated.
*       U xName     this will compress xName. When referenced xName
*                   will
*                   be uncompressed and left (U)npacked on the stack.
*       S xName     this will compress xName. When referenced xName
*                   will
*                   be left on the stack in compressed, (S)imple,
*                   form.
*       N xName     do (N)ot compress xName. Same as if line was
*                   deleted.
*
* xName may be any ROMPTR entry including NULLNAME, xName etc.
* 726
* 1062
