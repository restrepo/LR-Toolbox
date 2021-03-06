      PROGRAM DRIVER
C**************************************************************************
C     THIS IS THE DRIVER FOR CHECKING THE STANDALONE MATRIX ELEMENT.
C     IT USES A SIMPLE PHASE SPACE GENERATOR
C     Fabio Maltoni - 3rd Febraury 2007
C     Modified Version for the decay Package (Pierre Artoisenet)
C**************************************************************************
      IMPLICIT NONE
C     
C     CONSTANTS  
C     
      REAL*8 ZERO
      PARAMETER (ZERO=0D0)
C     
C     INCLUDE FILES
C     
C---  the include file with the values of the parameters and masses	
      INCLUDE "coupl.inc"
C---  integer nexternal ! number particles (incoming+outgoing) in the me 
      INCLUDE "nexternal.inc" 
C---  particle masses
      REAL*8 PMASS(NEXTERNAL)	
C---  integer    n_max_cg
      INCLUDE "ngraphs.inc"     !how many diagrams (could be useful to know...)

      DOUBLE PRECISION AMP2(n_max_cg)
      COMMON/TO_AMPS/  AMP2


C     
C     LOCAL
C     
      INTEGER I,J,K
      REAL*8 P(0:3,NEXTERNAL)   ! four momenta. Energy is the zeroth component.
      REAL*8 SQRTS,MATELEM           ! sqrt(s)= center of mass energy 
      REAL*8 PIN(0:3), POUT(0:3)
      CHARACTER*120 BUFF(NEXTERNAL)
      CHARACTER*200 param_card
      real*8 new_alphas
      real*8 pi
C     
C     EXTERNAL
C     
      REAL*8 DOT
      EXTERNAL DOT
      
      pi = 3.141592653589793d0
C-----
C     BEGIN CODE
C-----
C     
C---  INITIALIZATION CALLS
C     
c---  Call to initialize the values of the couplings, masses and widths 
c     used in the evaluation of the matrix element. The primary parameters of the
c     models are read from Cards/param_card.dat. The secondary parameters are calculated
c     in Source/MODEL/couplings.f. The values are stored in common blocks that are listed
c     in coupl.inc .
      read(*,*) param_card
      call setpara(param_card)  !first call to setup the paramaters

c      include "../parameters.inc"
      call coup()
      include "pmass.inc"             !set up masses

c      read phase-space point (main loop)
1     read(*,*) new_alphas
      G = 2* DSQRT(new_alphas*pi)
      call UPDATE_AS_PARAM()
      do i=1,nexternal
         read (*,*) P(0,i),P(1,i),P(2,i),P(3,i) 
      enddo



c     
c     Now we can call the matrix element!
c

      CALL SMATRIX(P,MATELEM)
c

c      write (*,*) "Matrix element = ", MATELEM, " GeV^",-(2*nexternal-8)	
c      write (*,*) "-----------------------------------------------------------------------------"

       write(*,*) MATELEM
       call flush()
       goto 1

      end
	
	  
	  
	  
	   double precision function dot(p1,p2)
C****************************************************************************
C     4-Vector Dot product
C****************************************************************************
      implicit none
      double precision p1(0:3),p2(0:3)
      dot=p1(0)*p2(0)-p1(1)*p2(1)-p1(2)*p2(2)-p1(3)*p2(3)
      end

