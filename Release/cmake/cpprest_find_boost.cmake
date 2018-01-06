function(cpprest_find_boost)
  if(Boost_FOUND)
    return()
  endif()

  if(IOS)
    set(IOS_SOURCE_DIR "${PROJECT_SOURCE_DIR}/../Build_iOS")
    set(Boost_FOUND 1 CACHE INTERNAL "")
    #set(Boost_FRAMEWORK "-F ${IOS_SOURCE_DIR} -framework boost" CACHE INTERNAL "")
    #set(Boost_INCLUDE_DIR "$<BUILD_INTERFACE:${IOS_SOURCE_DIR}/boost.framework/Headers>" 
    #CACHE INTERNAL "")
    # create a boost folder and a symbolic link to boost include folder
    # under IOS_SOURCE_DIR
    set(Boost_INCLUDE_DIR "$<BUILD_INTERFACE:${IOS_SOURCE_DIR}/boost/include>" CACHE INTERNAL "")
  elseif(ANDROID)
    set(Boost_COMPILER "-clang")
    if(ARM)
      set(BOOST_ROOT "${CMAKE_BINARY_DIR}/../boost" CACHE INTERNAL "")
      set(BOOST_LIBRARYDIR "${CMAKE_BINARY_DIR}/../boost/libs/armeabi-v7a/gnu-4.9" CACHE INTERNAL "")
    else()
      set(BOOST_ROOT "${CMAKE_BINARY_DIR}/../Boost-for-Android-x86/build" CACHE INTERNAL "")
      set(BOOST_LIBRARYDIR "${CMAKE_BINARY_DIR}/../Boost-for-Android-x86/build/lib" CACHE INTERNAL "")
    endif()
    find_host_package(Boost 1.59 EXACT REQUIRED COMPONENTS random system thread filesystem chrono atomic)
  elseif(UNIX)
      set(BOOST_ROOT "${CMAKE_BINARY_DIR}/../boost" CACHE INTERNAL "")
      set(BOOST_LIBRARYDIR "${CMAKE_BINARY_DIR}/../boost/stage/lib" CACHE INTERNAL "")
    find_package(Boost REQUIRED COMPONENTS random system thread filesystem chrono atomic date_time regex)
  else()
    find_package(Boost REQUIRED COMPONENTS system date_time regex)
  endif()

  set(Boost_FOUND 1 CACHE INTERNAL "")
  set(Boost_INCLUDE_DIR ${Boost_INCLUDE_DIR} CACHE INTERNAL "")
  set(Boost_LIBRARIES
    ${Boost_SYSTEM_LIBRARY}
    ${Boost_THREAD_LIBRARY}
    ${Boost_ATOMIC_LIBRARY}
    ${Boost_CHRONO_LIBRARY}
    ${Boost_RANDOM_LIBRARY}
    ${Boost_REGEX_LIBRARY}
    ${Boost_DATE_TIME_LIBRARY}
    ${Boost_FILESYSTEM_LIBRARY}
    ${BOOST_FRAMEWORK}
    CACHE INTERNAL "")
 endfunction()
