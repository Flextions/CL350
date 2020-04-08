#!/bin/bash

FILE=$1

while read LINE; do
  FILENAME=$(echo $LINE | awk -F'|' '{ print $1 }')
  LANG=$(echo $LINE | awk -F'|' '{ print $2 }')
  GENDER=$(echo $LINE | awk -F'|' '{ print $3 }')
  TEXT=$(echo $LINE | awk -F'|' '{ print $4 }')

  curl -G "https://texttospeech.responsivevoice.org/v1/text:synthesize?lang=$LANG&engine=g1&name=&pitch=0.5&rate=0.5&volume=1&key=PL3QYYuV&gender=$GENDER" \
  --data-urlencode "text=$TEXT" \
  -H 'Connection: keep-alive' --compressed  > "$FILENAME.mp3";

done < $FILE
