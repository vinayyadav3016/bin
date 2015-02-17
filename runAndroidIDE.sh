#!/bin/bash

createSession()
{
	tmux new-session -d -s $1 
	#sleep 5
	tmux rename-window "Run Window : ${1}"
	tmux set-option default-path ${1}/
	tmux split-window -h
	tmux select-pane -L
	tmux kill-pane 
	tmux split-window -h
	tmux split-window -d "top"
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
	tmux set-option default-path ${1}/
	tmux new-window -n "Run Window" # "cd ${1}/codes/scripts/utils/"
	tmux split-window -h 
	#tmux select-pane -t 1
	tmux split-window -d "top"
}

createCodeEditorWindow()
{
	tmux set-option default-path ${1}/src/
	tmux new-window -n "Code Editor" "vim" # "cd ${1}/codes/python/"
	#tmux split-window -h "vim" 
}

createLayoutEditorWindow()
{
	tmux set-option default-path ${1}/res/layout/
	tmux new-window -n "Layout Editor" "vim" # "cd ${1}/codes/python/"
	#tmux split-window -h #"vim" 
}

createValuesEditorWindow()
{
	tmux set-option default-path ${1}/res/values/
	tmux new-window -n "Values Editor" "vim" # "cd ${1}/codes/python/"
	#tmux split-window -h #"vim" 
}

createManifestEditorWindow()
{
	tmux set-option default-path ${1}/
	tmux new-window -n "Editor" "vim" # "cd ${1}/codes/python/"
	#tmux split-window -h #"vim" 
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
		if [[ -d "$1" ]]
		then
			createSession "$1"
			#createRunWindow "$1"
			#createManifestEditorWindow "$1"
			#createCodeEditorWindow "$1"
			#createLayoutEditorWindow "$1"
			#createValuesEditorWindow "$1"
			attachSession "$1"
		else
			echo "Project $1 do not exists!!!!"
		fi
	fi
else
	echo "Please give project name"
	exit 1
fi
