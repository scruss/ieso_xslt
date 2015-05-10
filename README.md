## ieso_xslt ##

The Ontario
[Independent Electricity System Operator](http://www.ieso.ca/
"Independent Electricity System Operator") (IESO) publishes hourly
generation and system data. A typical report is the
[Generators Output and Capability Report](http://reports.ieso.ca/public/GenOutputCapability/PUB_GenOutputCapability.xml#
"Generators Output and Capability Report"). This is rendered as an
HTML table, but is actually quite an intricate XML format.

The intention of this project is to produce a number of XSLT scripts
to transform a variety of IESO public
[reports](http://reports.ieso.ca/public/) to simpler formats. This
will help interested amateurs analyze power system data in the province.

### Generators Output and Capability Report ###

As a start, the **GenOutputCapability_CSV.xsl** script outputs simple
CSV for the hourly generation, capacity, and capability (in MWh) of
each plant listed in the report. You can run it like this:

    xsltproc GenOutputCapability_CSV.xsl PUB_GenOutputCapability.xml > data.csv

It is XSLT 1.0, so should run on almost any processor.

#### Notes

1. The timestamp appears to be EST, and refers to the *end* of the
   period. Use of a time duration might be a more modern way of doing
   it.

2. This code has not been extensively tested. I'm particularly dubious
   of the capacity and capability selection code.

## Author ##

Stewart C. Russell - scruss.com

## Licence ##

WTFPL. (Srsly)

## Todo ##

* [Variable Generation Forecast Summary Report](http://reports.ieso.ca/public/VGForecastSummary/PUB_VGForecastSummary.xml): convert this to CSV, as it has useful forecast analysis for wind power.

## Caution ##

Code may contain swearies. I despair of what the corporate world has
done to the elegant concept that is XML.
