*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*
*     snFileOpenRead   snFileOpenAppend   snFileOpenReplace   snFileClose
*
*  This file is here for the Python/C/C++ interface.
*
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      subroutine snFileOpenRead
     &     ( unitno, filename )
      implicit
     &     none
      integer
     &     unitno
      character*(*)
     &     filename
!     ==================================================================
!     Intel compiler doesn't like opening a file in one library and
!     passing it to another.
!
!     Wrapper to open files for reading inside SNOPT library.
!
!     10 Jan 2017: First version.
!     ==================================================================
      integer len

      call s1trim(filename,len)
      open(unit=unitno, file=filename, status='old')

      end ! subroutine snFileOpenRead

!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      subroutine snFileOpenAppend
     &     ( unitno, filename, iostat)
      implicit
     &     none
      integer
     &     unitno
      integer
     &     iostat
      character*(*)
     &     filename
!     ==================================================================
!     Intel compiler doesn't like opening a file in one library and
!     passing it to another.
!
!     Wrapper to open files for append inside SNOPT library.
!
!     10 Jan 2017: First version.
!     ==================================================================
      integer len

      call s1trim(filename,len)
      open(unit=unitno, file=filename,
     &     status='unknown', position='append', iostat=iostat)

      end ! subroutine snFileOpenAppend

!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      subroutine snFileOpenReplace
     &     ( unitno, filename, iostat)
      implicit
     &     none
      integer
     &     unitno
      integer
     &     iostat
      character*(*)
     &     filename
!     ==================================================================
!     Intel compiler doesn't like opening a file in one library and
!     passing it to another.
!
!     Wrapper to open new files for write inside SNOPT library.
!
!     12 Jul 2022: First version.
!     ==================================================================
      integer len

      call s1trim(filename,len)
!       open(unit=unitno, file=filename,
!      &     status='new', action='write')
      open(unit=unitno, file=filename,
     &     status='replace', access='sequential', iostat=iostat)
      
      end ! subroutine snFileOpenReplace
      
!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      subroutine snFileClose
     &     ( unitno )
      implicit
     &     none
      integer
     &     unitno
!     ==================================================================
!     Close the given unit file.
!
!     10 Jan 2017: First version.
!     ==================================================================

      close(unitno)

      end ! subroutine snFileClose

!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
