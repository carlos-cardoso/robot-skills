FIND_PROGRAM( DOT_CMD dot )

# Set some variables to configure Doxyfile.in==================================
IF( UNIX AND NOT APPLE )
   SET( SHORT_NAMES "NO" )
ELSE()
   SET( SHORT_NAMES "YES" )
ENDIF()

IF( APPLE )
   SET(GENERATE_DOCSET "YES")
ELSE()
   SET(GENERATE_DOCSET "NO")
ENDIF()

IF( DOT_CMD )
   SET(HAVE_DOT "YES")
ELSE()
   SET(HAVE_DOT "NO")
ENDIF()

SET( DOC_OUTPUT_DIRECTORY ${PROJECT_BINARY_ROOT}/doc )

CONFIGURE_FILE( Doxyfile.in Doxyfile )
#==============================================================================

ADD_CUSTOM_TARGET( doc )

IF( DOXYGEN_CMD )
   ADD_CUSTOM_TARGET(
      doc-doxygen
      COMMAND ${DOXYGEN_CMD} Doxyfile
      WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
   )
   ADD_DEPENDENCIES(doc doc-doxygen)
   IF( GENERATE_DOCSET )
      ADD_CUSTOM_TARGET(
         docset
         COMMAND make
         DEPENDS doc-doxygen
         WORKING_DIRECTORY html
      )
      ADD_DEPENDENCIES(doc docset)
   ENDIF()
ELSE()
   MESSAGE( STATUS "You do not have doxygen. Documentation will not be built." )
ENDIF()
