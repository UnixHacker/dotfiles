# some default flags
# for more information install clang-3.2-doc package and
# check UsersManual.html
flags = [
'-Wall',
'-Werror',

'-std=c++11',

'-x', 'c++',

]

# youcompleteme is calling this function to get flags
# You can also set database for flags. Check: JSONCompilationDatabase.html in
# clang-3.2-doc package
def FlagsForFile( filename ):
  return {
    'flags': flags,
    'do_cache': True
  }
