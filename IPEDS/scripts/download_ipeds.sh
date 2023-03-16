#!/bin/bash
#Keeping it simple and old school

path="https://nces.ed.gov/ipeds/datacenter/data/"
download_path="../downloads"
data_path="../data"
dict_path="../dictionaries"

#Downloads files for year(s) specified
years=("2021" "2020")

#Downloads both the default data file and dictionary for each entry
#the YYYY character sequence is a placeholder for replacement in year loop

files=("HDYYYY" "CYYYY_A")

for ((y=0; y<${#years[@]}; y++)); do

    for ((i=0; i<${#files[@]}; i++)); do

        file=$(echo ${files[$i]/"YYYY"/${years[$y]}}) 
        
        wget -O ${download_path}/${file}.zip ${path}${file}.zip #data
        wget -O ${download_path}/${file}_Dict.zip ${path}${file}_Dict.zip #dict

        unzip -o ${download_path}/${file}.zip  -d ../data
        unzip -o ${download_path}/${file}_Dict.zip -d ../dictionaries

    done

done

echo "Finished!"