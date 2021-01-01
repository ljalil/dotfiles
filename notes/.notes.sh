#!/bin/bash

notes_path="/home/abdeljalil/Documents/Notes/"

function notenew() {
	printf "Choose notebook: "
	new_note_notebook=$(find $notes_path -type d | fzf)
	echo $new_note_notebook
	printf 'Note title: '
	read new_note_title
	simplified_new_note_title=$new_note_title #to lowercase
#	simplified_new_note_title=${new_note_title,,} #to lowercase
#	simplified_new_note_title="${simplified_new_note_title// /_}"
#	simplified_new_note_title="${simplified_new_note_title/-/_}"
#	simplified_new_note_title="${simplified_new_note_title//\'/}"
#	touch "${new_note_notebook}/${simplified_new_note_title}.tex"
	vim -c 'call feedkeys("itexnote\<Tab>")' -c "call feedkeys('${new_note_title}')" -c 'call feedkeys("\<Tab>")'  "${new_note_notebook}/${new_note_title}.tex" --servername tex 	
}

function notezip() {
	for var in "$@"
	do
		if [[ "${var}" =~ .*\.tex ]]
		then
			IFS='.' read -ra notetozip <<< "$var"
   		zip -m ".${notetozip}.zip" "${notetozip}__"* "${notetozip}.tex"
		fi
	done
#		echo "Note ${1} zipped"
}

function noteunzip() {
	for var in "$@"
	do
		IFS='.' read -ra notetounzip <<< "$var"
		unzip ".${notetounzip}.zip" && rm ".${notetounzip}.zip"
		echo "Note ${notetounzip} unzipped."
	done
}

function notetree() {
				tree -P "*.pdf" $notes_path
}

function notetitlesearch() {
				tree -P "*${1}*" $notes_path
}

function noteopen() {
	note_path=$(find $notes_path -regextype sed -regex ".*.pdf" | fzf)
	zathura "${note_path}" & disown
}

function noteexists() {
				if [ -f $1 ]
				then
								return 1
				else
								return 0
				fi
}

function notebooknew() {
	printf "Choose new notebook parent directory: "
	new_notebook_directory=$(find $notes_path -type d | fzf)
	echo $new_notebook_directory
	printf "Choose new notebook name: "
	read new_notebook_name
	mkdir "${new_notebook_directory}/${new_notebook_name}" -p
	echo "Notebook ${new_notebook_name} created succesfully."
}

function notebookbrowse() {
	notebook_directory=$(find $notes_path -type d | fzf)
	cd "${notebook_directory}"
}
