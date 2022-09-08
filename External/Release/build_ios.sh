echo "Build ios"
echo "Test Commit: ${GIT_PREVIOUS_SUCCESSFUL_COMMIT}"
echo "Profiling_Support: ${Profiling_Support}"
if [ $PROFILING_SUPPORT == 'false' ]
  then
    echo "profile false"
  else
     echo "profile true"
fi
