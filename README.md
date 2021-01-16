# MissionIsPossible
This is POC version, not for the production system.
ADO.NET is used. Entity Framework is optional.

GET/countries-by-isolation use stored procedures 
 - GetCountryByIsolation
 - GetCountryByIsolationAggrigate
both realise same algorithm in different way.

Environment: 
 - SQL server with installed SQL file "AlignDB.sql"
 - Create directory "c:\Temp\" or change mdf and log path files in "AlignDB.sql"
 - .NET5.0 framework
 - Change connection string in the file appsettings.json

Data structure see in the file DBDiagram.PNG

Find closest mission doesn't return real data - all known Geolocation APIs need a licence. 
A distance is calculated by Latitude/Longitude using GeoCoordinate.NetStandard1 library.
Lat/Long getting is simulated by MOCK.

ToDo list:
 - Log generation
 - Abnormals 
 - Unitest
 - Cache
 
