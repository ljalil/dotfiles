#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

notes_path="/home/abdeljalil/Documents/Notes"

function nnew() {
	printf "Choose notebook: "
	new_note_notebook=$(find $notes_path -type d | fzf)
	echo $new_note_notebook
	printf 'Note title: '
	read new_note_title
	simplified_new_note_title=$new_note_title #to lowercase
	
	printf "Choose note type:\n1) Simple\n2) Math\n3) Code\nCreate note of type: "
	read new_note_type_choice

	if [[ "${new_note_type_choice}" == 1 ]]; then
		new_note_type="texnote"
	fi

	if [[ "${new_note_type_choice}" == 2 ]]; then
		new_note_type="texnotemath"
	fi
	
#	simplified_new_note_title=${new_note_title,,} #to lowercase
#	simplified_new_note_title="${simplified_new_note_title// /_}"
#	simplified_new_note_title="${simplified_new_note_title/-/_}"
#	simplified_new_note_title="${simplified_new_note_title//\'/}"
#	touch "${new_note_notebook}/${simplified_new_note_title}.tex"
vim -c 'call feedkeys("i")' -c "call feedkeys('${new_note_type}')" -c 'call feedkeys("\<Tab>")' -c "call feedkeys('${new_note_title}')" -c 'call feedkeys("\<Tab>")'  "${new_note_notebook}/${new_note_title}.tex" --servername tex 	
}

function nzip() {
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

function nunzip() {
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

function ntsearch() {
				tree -P "*${1}*" $notes_path
}

function nopen() {
	note_path=$(find $notes_path -regextype sed -regex ".*.pdf" | fzf)
	zathura "${note_path}" & disown
}

function nexists() {
				if [ -f $1 ]
				then
								return 1
				else
								return 0
				fi
}

function nsearch() {
	# Search recursively for a string, pass the output to grep and store each line in array element
#	IFS=$'\n' files_list=($(pdfgrep "${1}" "${notes_path}" -r | grep -oP "^.${notes_path}([^:]*)"))

	IFS=$'\n' files_list=($(pdfgrep "${1}" "${notes_path}" -r ))

	echo -e "There is a total of ${RED}${#files_list[@]}${NC} matches for ${GREEN}${1}${NC} in the following notes:"

	counter=1
	for file_match in ${files_list[@]}
	do
		[[ $file_match =~ Notes([a-zA-Z\/\ \.]*) ]]
		echo -e "${RED}${counter}${NC}: ${BASH_REMATCH[1]}"
		counter=$((counter+1))
	done

	printf "Choose a matching file to search within: "
	read matching_file_number 
	[[ ${files_list[$matching_file_number-1]} =~ (.*\.pdf) ]]
	# Open file in zathura and search for term
	zathura "${BASH_REMATCH[1]}" -f "${1}" & disown
}

function nbnew() {
	printf "Choose new notebook parent directory: "
	new_notebook_directory=$(find $notes_path -type d | fzf)
	echo $new_notebook_directory
	printf "Choose new notebook name: "
	read new_notebook_name
	mkdir "${new_notebook_directory}/${new_notebook_name}" -p
	echo "Notebook ${new_notebook_name} created succesfully."
}

function nbbrowse() {
	notebook_directory=$(find $notes_path -type d | fzf)
	cd "${notebook_directory}"
}
