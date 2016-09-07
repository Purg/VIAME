
function( FormatPassdowns _str _varResult )
  set( _tmpResult "" )
  get_cmake_property( _vars VARIABLES )
  string( REGEX MATCHALL "(^|;)${_str}[A-Za-z0-9_]*" _matchedVars "${_vars}" )
  foreach( _match ${_matchedVars} )
    set( _tmpResult ${_tmpResult} "-D${_match}=${${_match}}" )
  endforeach()
  set( ${_varResult} ${_tmpResult} PARENT_SCOPE )
endfunction()

function( DownloadFile URL OutputLoc MD5 )
  file( DOWNLOAD ${URL} ${OutputLoc} EXPECTED_MD5 ${MD5} )
endfunction()
