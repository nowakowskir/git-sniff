#!/bin/bash

BASE_DIR=$(git rev-parse --show-toplevel)
FILES=($(git diff HEAD --name-only --diff-filter=AM))
SNIFFER=$(git config --get sniff.cmd)
PARAMS=$(git config --get sniff.params)
BATCH_MODE=$(git config --get sniff.batchmode)

if ! command -v $SNIFFER > /dev/null; then
	echo "Sniffer doesn't exist. Use git config --add sniff.cmd <command> to set up code sniffer."
	
	exit 1
fi

if [ ! -z "$PARAMS" ]; then
	PARAMS=" $PARAMS"
fi

echo -e "\e[0;33mChecking files with code sniffer ($SNIFFER)\e[0m\n"

if [ -z "$BATCH_MODE" ] || [ $BATCH_MODE -ne 1 ]; then
	for FILE in "${FILES[@]}"
        do
	        CMD="$SNIFFER$PARAMS $FILE"
		echo -e "Executing: $CMD"
		eval $CMD
		CODE+=$?
        done
else

	for FILE in "${FILES[@]}"
	do
		PATHS+=" $BASE_DIR/$FILE"
	done

	CMD="$SNIFFER$PARAMS $PATHS"
        echo -e "Executing: $CMD"
	eval $CMD
	CODE=$?
fi

if [ $CODE -eq 0 ]; then
        echo -e "\e[0;32mFiles comply with codding standard\e[0m"

	exit 0
else
        echo -e "\e[01;31mFiles don't comply with codding standard\e[0m"

	exit 1
fi
