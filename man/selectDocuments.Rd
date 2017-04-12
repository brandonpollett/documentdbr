% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/selectDocuments.R
\name{selectDocuments}
\alias{selectDocuments}
\title{Queries a collection for documents.}
\usage{
selectDocuments(accountUrl, primaryOrSecondaryKey, databaseId, collectionId,
  queryText, enableCrossPartitionQuery = FALSE, partitionKey = "",
  maxItemsPerChunk = 100)
}
\arguments{
\item{accountUrl}{The URI of the DocumentDB account.}

\item{primaryOrSecondaryKey}{The master key to authenticate.}

\item{databaseId}{The ID of the database to query.}

\item{collectionId}{The ID of the collection to query.}

\item{queryText}{The SQL query to execute.}

\item{enableCrossPartitionQuery}{Optional. If the collection is partitioned, this must be set to TRUE to allow execution across multiple partitions. Queries that filter against a single partition key, or against single-partitioned collections do not need to set this parameter. Default value is FALSE.}

\item{partitionKey}{Optional. Needs to be set if the collection is partitioned and the cross partition query option is disabled.}

\item{maxItemsPerChunk}{Optional. Use it for performance and cost tuning.}
}
\value{
The result of the query as data.frame object and some information extracted from the REST API response such as request charge and session token.
}
\description{
Queries a collection for documents.
}
\examples{
# returns the result of a SQL query as data.frame
library(documentdbr)
queryResult <-
  selectDocuments(
    accountUrl = "https://somedocumentdbaccount.documents.azure.com",
    primaryOrSecondaryKey = "t0C36UstTJ4c6vdkFyImkaoB6L1yeQidadg6wasSwmaK2s8JxFbEXQ0e3AW9KE1xQqmOn0WtOi3lxloStmSeeg==",
    databaseId = "ToDoList",
    collectionId = "Items",
    queryText = "SELECT Items.name, Items.description, Items.isComplete FROM Items WHERE Items.isComplete = true",
    maxItemsPerChunk = 100
  )
str(queryResult$documents)
print(queryResult$documents)
print(queryResult$requestCharge)
}