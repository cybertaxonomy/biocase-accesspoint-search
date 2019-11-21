#!/bin/bash

#
# 
#
if [ -z $(which http) ]; then
	echo "please install httpie:\napt-get install httpie"
	exit -1
fi

if [ -z $(which jq) ]; then
	echo "please install jq:\napt-get install jq"
	exit -1
fi 

if [ -z "$1" ]; then
	echo "USAGE biocase-accesspoint-search.sh QUERY_STRING"
	exit -1
fi

http http://api.gbif.org/v1/dataset q==$1 limit==100 | jq '.results[] | .title as $title | .endpoints[] | select( .type == "BIOCASE") | {title: $title, accesspointUrl: .url}' 

#
# TODO The script lists duplicate accesspointUrls since the GBIF api lists datasets. (see second example below)
#      The same accesspint can deliver multiple datasets. 
#      Can the duplicate entries be merged?
#

# -----------------------------------------------------------------------------------------------------------
# example reponse when searching for "Berolin":
#
# {
#   "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=Herbar",
#   "title": "Herbarium Berolinense, Berlin (B)"
# }
# {
#   "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=WillingHellas",
#   "title": "Herbarium Willing at Herbarium Berolinense, Berlin (B)"
# }
# {
#   "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=lichen",
#   "title": "Lichens at Herbarium Berolinense, Berlin (B)"
# }
# {
#   "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=Schweinfurth",
#   "title": "Collection of botanical drawings by Georg Schweinfurth at Herbarium Berolinense, Berlin (B)"
# }
# {
#   "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=Planktonproben",
#   "title": "Collections of Phytoplankton at Herbarium Berolinense, Berlin (B)"
# }
# {
#   "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=Bridel",
#   "title": "Herbarium Bridel at Herbarium Berolinense, Berlin (B)"
# }
#
# -----------------------------------------------------------------------------------------------------------
# example reponse when searching for "Mainz":
# {
#   "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=NaturkundemuseumMainz",                                                                                                              
#   "title": "Naturhistorisches Museum Mainz, Botanical Collection"
# }                                                                                                                                                                                                          
# {
#   "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=NaturkundemuseumMainz4",                                                                                                             
#   "title": "Naturhistorisches Museum Mainz, Schmetterlingssammlung Rodenkirchen"
# }                                                                                                                                                                                                          
# {
#   "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=NaturkundemuseumMainz3",                                                                                                             
#   "title": "Naturhistorisches Museum Mainz, Herbarium von Ruprecht Düll"
# }                                                                                                                                                                                                          
# {
#   "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=NaturkundemuseumMainz2",                                                                                                             
#   "title": "Naturhistorisches Museum Mainz, Herbarium Oesau"
# }                                                                                                                                                                                                          
# {
#   "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=NaturkundemuseumMainz",                                                                                                              
#   "title": "Naturhistorisches Museum Mainz, Zoological Collection"
# }                                                                                                                                                                                                          
# {
#   "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=NaturkundemuseumMainz2",                                                                                                             
#   "title": "Naturhistorisches Museum Mainz, Feldbeobachtungsdaten Pflanzen"
# }                                                                                                                                                                                                          
# {
#   "biocaseDatasetUrl": "http://biocase.naturkundemuseum-berlin.de/current/pywrapper.cgi?dsa=Mainz_pal",                                                                                                    
#   "title": "Naturhistorisches Museum Mainz, Paleontological Collection"
# } 
