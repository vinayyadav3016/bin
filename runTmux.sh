#!/bin/bash

createSession()
{
	tmux new-session -d -s $1 
	#sleep 5
	tmux rename-window -t 0 "HOME"
	tmux split-window -h
}

sessionExists()
{
	#echo "checking session"
	tmux has-session -t "$1" 2>tmux.err
	#echo "session checked"
}

attachSession()
{
	tmux attach-session -t "$1"
}

createRunWindow()
{
	tmux set-option default-path ${PROJECT_HOME}/code/scripts/utils/
	tmux new-window -n "Run ${1}" # "cd ${PROJECT_HOME}/codes/scripts/utils/"
	tmux split-window -h 
	#tmux select-pane -t 1
	tmux split-window -d "top"
}

createPythonEditorWindow()
{
	tmux set-option default-path ${PROJECT_HOME}/codes/python/
	tmux new-window -n "Python Editor ${1}" # "cd ${PROJECT_HOME}/codes/python/"
	tmux split-window -h 
}

createScriptEditorWindow()
{
	tmux set-option default-path ${PROJECT_HOME}/codes/scripts/
	tmux new-window -n "Script Editor ${1}" # "cd ${PROJECT_HOME}/codes/scripts/"
	tmux split-window -h
}

createOutputViewerWindow()
{
	tmux set-option default-path ${PROJECT_HOME}/data/output
	tmux new-window -n "Output ${1}" # "cd ${PROJECT_HOME}/data/output/"
	tmux split-window -h
}

createLogViewerWindow()
{
	tmux set-option default-path ${PROJECT_HOME}/logs/
	tmux new-window -n "Log Viewer ${1}" # "cd ${PROJECT_HOME}/logs/"
	tmux set-option default-path ${PROJECT_HOME}/errs/
	tmux split-window -h # "cd ${PROJECT_HOME}/errs/"
}

createInputViewerWindow()
{
	tmux set-option default-path ${PROJECT_HOME}/data/recieved/
	tmux new-window  -n "Input ${1}" # "cd ${PROJECT_HOME}/data/recieved/"
	tmux split-window -h
}

createIntermediateViewerWindow()
{
	tmux set-option default-path ${PROJECT_HOME}/data/generated/
	tmux new-window -n "Intermediate ${1}" # "cd ${PROJECT_HOME}/data/generated/"
	tmux split-window -h
}

createWindow()
{
	tmux new-window -n "$1"
}

if [[ "$#" = "1"  ]]
then
	if  sessionExists "$1"
	then
		echo "attaching"
		attachSession "$1"
	else
		echo "creating"
		createSession "$1"
		createRunWindow
		createPythonEditorWindow
		createScriptEditorWindow
		createLogViewerWindow
		createOutputViewerWindow
		createIntermediateViewerWindow
		createInputViewerWindow
		attachSession "$1"
	fi
else
	echo "Please give session name"
	exit 1
fi
