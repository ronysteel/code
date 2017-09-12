func_load_config() {
	# Load configuration file
	# func_load_config config_file
	
	config_file=$1
	
	if [ "$config" = "" ]; then
		echo "Error: missing argument - configuration file name is required"
		exit 1
	fi
	
	if ! . $config_file; then
		echo "Error: failed to load configuration file"
		exit 1
	fi
	
	exit 0
}

func_is_cmd_in_path() {
	# Given a command and the PATH, tries to find the command. Returns 0
	# if found and executable; 1 if not. Note that this temporarily modifies
	# the IFS (internal field separator) but restores it upon completion.
	
	cmd=$1
	mypath=$(echo $2 | tr ':' '\n')
	result=1

	for directory in `echo $mypath`
	do
		if [ -x $directory/$cmd ] ; then
			result=0 # If we're here, we found the command.
		fi
	done
	
	return $result
}

func_check_for_cmd_in_path() {
	var=$1
	
	if [ "$var" != "" ] ; then
		if [ "${var:0:1}" = "/" ] ; then # check whether var has a leading slash
			if [ ! -x $var ] ; then # absolute path, check whether it is exists
				return 1
			fi
		elif ! func_is_cmd_in_path $var "$PATH" ; then # not exist, so we check in PATH
			return 2
		fi
	fi
}