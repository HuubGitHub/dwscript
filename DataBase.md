# Instantiation methods #

  * **constructor** `Create(driver : String; parameters : array of String = nil)`
  * **destructor** `Close`

# Transaction methods #

  * `BeginTransaction`/`StartTransaction`
  * `Commit`
  * `Rollback`
  * `InTransaction : Boolean`

# Query methods #

  * `Exec(sql : String; parameters : array of variant)`
  * `Query(sql : String; parameters : array of variant) :` [DataSet](DataSet.md)