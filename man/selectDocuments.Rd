% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/selectDocuments.R
\name{selectDocuments}
\alias{selectDocuments}
\title{Runs a SELECT query on a collection and returns its result as data.frame.}
\usage{
selectDocuments(connectionInfo, queryText, enableCrossPartitionQuery = FALSE,
  partitionKey = "", maxItemsPerChunk = 100, consistencyLevel = "",
  sessionToken = "", userAgent = "")
}
\arguments{
\item{connectionInfo}{A DocumentDB connection info object generated with getDocumentDBConnectionInfo().}

\item{queryText}{The SQL query to execute.}

\item{enableCrossPartitionQuery}{Optional. If the collection is partitioned, this must be set to TRUE to allow execution across multiple partitions. Queries that filter against a single partition key, or against single-partitioned collections do not need to set this parameter. Default value is FALSE.}

\item{partitionKey}{Optional. Needs to be set if the collection is partitioned and the cross partition query option is disabled.}

\item{maxItemsPerChunk}{Optional. Use it for performance and cost tuning.}

\item{consistencyLevel}{Optional. The consistency level override. The valid values are: Strong, Bounded, Session, or Eventual (in order of strongest to weakest). The override must be the same or weaker than the account's configured consistency level.}

\item{sessionToken}{Optional. A string token used with session level consistency. For more information, see \href{https://azure.microsoft.com/en-us/documentation/articles/documentdb-consistency-levels}{Using consistency levels in DocumentDB}.}

\item{userAgent}{Optional. A string that specifies the client user agent performing the request. The recommended format is {user agent name}/{version}. For example, the official DocumentDB .NET SDK sets the User-Agent string to Microsoft.Document.Client/1.0.0.0. A custom user-agent could be something like ContosoMarketingApp/1.0.0.}
}
\value{
The result of the query as data.frame object and some information extracted from the REST API response such as request charge and session token.
}
\description{
Runs a SELECT query on a collection and returns its result as data.frame.
}
\examples{
# load the documentdbr package
library(documentdbr)

# get a DocumentDBConnectionInfo object
myCollection <- getDocumentDBConnectionInfo(
  accountUrl = "https://somedocumentdbaccount.documents.azure.com",
  primaryOrSecondaryKey = "t0C36UstTJ4c6vdkFyImkaoB6L1yeQidadg6wasSwmaK2s8JxFbEXQ0e3AW9KE1xQqmOn0WtOi3lxloStmSeeg==",
  databaseId = "MyDatabaseId",
  collectionId = "MyCollectionId"
)

# run a SQL query, get its result as as data.frame and print some infos
queryResult <- selectDocuments(myCollection, "SELECT Items.name, Items.description, Items.isComplete FROM Items WHERE Items.isComplete = true")
str(queryResult$documents)
print(queryResult$documents)
print(queryResult$requestCharge)

# run another SQL query, this time getting the sum of all value1 fields
anotherQueryResult <- selectDocuments(myCollection, "SELECT sum(c.value1) AS TotalSumValue1 FROM c")
print(paste("The total sum over all value1 fields is:", as.numeric(anotherQueryResult$documents)))
}
