% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tfidf.R
\name{tfidf}
\alias{tfidf}
\title{Calculate TF-IDF using a input matrix with terms in rows and documents in columns}
\usage{
tfidf(
  tdMat,
  tfVariant = c("raw", "binary", "frequency", "log", "doubleNorm0.5"),
  idfVariant = c("raw", "smooth", "probabilistic"),
  idfAddOne = TRUE
)
}
\arguments{
\item{tdMat}{A term-document matrix, terms in rows, documents in columns, and counts as integers (or logical values) in cells}

\item{tfVariant}{Variant of term frequency. See details below.}

\item{idfVariant}{Variant of inverse document frequency. See details below.}

\item{idfAddOne}{Logical, whether one should be added to both numerator and denominator to calculate IDF. See details below.}
}
\description{
Calculate TF-IDF using a input matrix with terms in rows and documents in columns
}
\details{
\code{tfVariant} accepts following options:
\describe{
  \item{raw}{The input matrix is used as it is.}
  \item{binary}{The input matrix is transformed into logical values.}
  \item{frequency}{Term frequency per document is calculated from the input matrix.}
  \item{log}{Transformation \code{log(1+tfMat)} }
  \item{doubleNorm0.5}{Double normalisation 0.5}
}

\code{idfVariant} accepts following options:
\describe{
  \item{raw}{\code{log(N/Nt)}}
  \item{smooth}{\code{log(1+N/Nt)}}
  \item{probabilistic}{\code{log((N-nt)/nt)}}
}
, where \code{N} represents the total number of documents in the corpus, and \code{nt} is the number of documents where the term \code{t} appears. If \code{idfAddOne} is set \code{TRUE}, both numbers with addition of 1 to prevent division-by-zero.
}
\examples{
tiExample <- matrix(c(1,1,1,1,1,
1,1,0,0,0,
1,0,0,0,0,
0,1,0,0,0,
0,0,0,1,0,
1,0,1,0,1,
0,0,0,0,1), ncol=5, byrow=TRUE)
colnames(tiExample) <- sprintf("D\%d", 1:ncol(tiExample))
rownames(tiExample) <- sprintf("t\%d", 1:nrow(tiExample))
tiRes <- tfidf(tiExample)

}
\references{
The Wikipedia item on TF-IDF: \url{https://en.wikipedia.org/wiki/Tf\%E2\%80\%93idf}.
}
