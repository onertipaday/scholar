##' Search author by name and return proper Google Scholar IDs
##'
##' @author Paolo Sonego
##'
##' @param name author name
##' @return a character vector with Google Scholar IDs for the given author name
##' @export
##' @importFrom xml2 read_html
##' @importFrom rvest html_nodes html_text
##' @importFrom dplyr "%>%"
##' @examples {
##'    ## Gets profiles of some famous scientist
##'    get_citation_history(get_author_ids("Roberto Burioni"))
##' }
get_author_ids <- function(name = "Roberto Burioni")
{
  auths <- xml2::read_html(utils::URLencode(paste0("https://scholar.google.it/citations?view_op=search_authors&mauthors=", name)))
  text <- rvest::html_nodes(auths, ".gsc_oai_name")
  # auths %>% rvest::html_nodes(".gsc_oai_name") -> text
  return(sub(".*user=([A-Za-z_0-9]+)&.*", "\\1", text))
}
