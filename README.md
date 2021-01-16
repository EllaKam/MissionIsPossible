# MissionIsPossible
This is POC version, not for the production system.
ADO.NET is used. Entity Framework is optional.

GET/countries-by-isolation use stored procedures 
 - GetCountryByIsolation
 - GetCountryByIsolationAggrigate
both realise same algorithm in different way.

Environment: 
 - SQL server with installed SQL file "AlignDB.sql"
 - .NET5.0 framework

Find closest mission doesn't return real data - all known Geolocation APIs need a licence. 
A distance is calculated by Lat/Long using GeoCoordinate.NetStandard1 library.
Lat/Long getting is simulated by MOK.

ToDo list:
 - Log generation
 - Abnormals 
 - Unitest
 - Cache
 
