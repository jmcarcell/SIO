SET(CMAKE_INSTALL_CMAKEDIR "${CMAKE_INSTALL_LIBDIR}/cmake")

INCLUDE(CMakePackageConfigHelpers)

# Write a version file
WRITE_BASIC_PACKAGE_VERSION_FILE(${PROJECT_BINARY_DIR}/SIOConfigVersion.cmake
  VERSION ${SIO_VERSION}
  COMPATIBILITY SameMajorVersion)

EXPORT(EXPORT SIOTargets NAMESPACE SIO:: FILE ${PROJECT_BINARY_DIR}/SIOTargets.cmake)

CONFIGURE_PACKAGE_CONFIG_FILE(${PROJECT_SOURCE_DIR}/cmake/SIOConfig.cmake.in
                              ${PROJECT_BINARY_DIR}/SIOConfig.cmake
                              INSTALL_DESTINATION ${CMAKE_INSTALL_CMAKEDIR}/${PROJECT_NAME}
                              PATH_VARS CMAKE_INSTALL_INCLUDEDIR CMAKE_INSTALL_LIBDIR
                              )

# Install
INSTALL(FILES
  ${CMAKE_CURRENT_BINARY_DIR}/SIOConfig.cmake
  ${CMAKE_CURRENT_BINARY_DIR}/SIOConfigVersion.cmake
  DESTINATION ${CMAKE_INSTALL_CMAKEDIR}/${PROJECT_NAME})

INSTALL(EXPORT SIOTargets
  DESTINATION ${CMAKE_INSTALL_CMAKEDIR}/${PROJECT_NAME}
  NAMESPACE SIO:: )
