# Introduction #

This module exposes simple classes that allow to connect and run query against various databases.

  * [DataBase](DataBase.md)
  * [DataSet](DataSet.md)
  * [DataField](DataField.md)

# Sample #

Connect to a local SQLite database and print two fields from a table

```
var db := DataBase.Create('SQLite', ['d:\db\base.sql3']);
var query := db.Query('select field1, field2 from mytable where field3=?', ['filter']);

while query.Step do
   PrintLn(query.AsString(0)+', '+query.AsString(1));
query.Close; // optional, only if you need it closed ASAP
```

Delete everything from mytable and insert in a transaction

```
db.BeginTransaction;
db.Exec('delete from mytable');
db.Exec('insert into mytable (field1, field3) values (?, ?)', ['hello', 'world']);
db.Commit;
```

Datasets and databases are automatically closed, but you can use the **Close** destructor to force-close at any time.

Transactions that not manually committed are automatically rollbacked.

# Usage #

In order to use the DataBase object in a script, an TdwsDatabaseLib component must be linked to the TDelphiWebScript, and appropriate driver units (dwsUIBDatabase for the "UIB" driver, dwsSynSQLiteDatabase for the "SQLLite" driver etc) must be used by the host program.

# Details #

Currently supported database drivers:

  * [Synopse](http://synopse.info/) / [mORMot](http://synopse.info/fossil/wiki?name=SQLite3+Framework)
    * [SQLite](http://www.sqlite.org/) (native)
    * [ODBC](http://en.wikipedia.org/wiki/ODBC) (native)
    * Oracle (native)
    * [OleDB](http://en.wikipedia.org/wiki/OLE_DB)
      * Oracle (via OleDB)
      * MSOracle
      * MSSQL
      * MySQL
      * Jet (Access)
      * AS400
      * ODBC (via OleDB)
  * [Unified Interbase](http://sourceforge.net/projects/uib/) / [progdigy](http://www.progdigy.com/)
    * UIB (native [FireBird](http://www.firebirdsql.org/) and [Interbase](http://www.embarcadero.com/products/interbase))
  * GUID (pseudo-database that generates GUIDs)