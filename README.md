# biocase-provider-search

Simple search for BioCASE providers via the GBIF API

Currently there is one search script: `biocase-accesspoint-search.sh`

## biocase-accesspoint-search.sh

### Installation

The sript required *HTTPie* and *jq*. These tols can be installed on debian systems by

~~~
apt-get install httpie jq
~~~

### Usage

~~~
biocase-accesspoint-search.sh QUERY_STRING
~~~

The script will return json objects with `title` and `accesspointURL`

### Example

~~~
./biocase-accesspoint-search.sh Berolin  
~~~

~~~json
{
  "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=Herbar",
  "title": "Herbarium Berolinense, Berlin (B)"
}
{
  "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=WillingHellas",
  "title": "Herbarium Willing at Herbarium Berolinense, Berlin (B)"
}
{
  "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=lichen",
  "title": "Lichens at Herbarium Berolinense, Berlin (B)"
}
{
  "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=Schweinfurth",
  "title": "Collection of botanical drawings by Georg Schweinfurth at Herbarium Berolinense, Berlin (B)"
}
{
  "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=Planktonproben",
  "title": "Collections of Phytoplankton at Herbarium Berolinense, Berlin (B)"
}
{
  "biocaseDatasetUrl": "http://ww3.bgbm.org/biocase/pywrapper.cgi?dsa=Bridel",
  "title": "Herbarium Bridel at Herbarium Berolinense, Berlin (B)"
}
~~~


