# experiment with airsonic api on local network server
library(httr2)

# info
# salt: a2flqXmMBbyunA==
# token: bccb467fdd917f30241eebbc1202bacc
# api version: 1.15.0
#curl 'http://your-server/rest/ping.view?u=<username>&t=<token>&s=<salt>&v=1.15.0&c=<your-app>'

# define server URL
base_url <- "http://192.168.1.146:4040/rest"

# test ping
req <- request(base_url) |>
  req_url_path_append("ping") |>
  req_url_query(
    u = "admin",
    p = "admin",
    v = "1.15.0",
    c = "R App"
  )

resp <- req_perform(req)
resp |>
  resp_body_xml()

# test now playing
req <- request(base_url) |>
  req_url_path_append("getNowPlaying") |>
  req_url_query(
    u = "admin",
    p = "admin",
    v = "1.15.0",
    c = "R App"
  )


resp <- req_perform(req)
resp_xml <- resp_body_xml(resp)

xml2::xml_structure(resp_xml)
xml2::xml_name(resp_xml)
xml2::xml_children(resp_xml)

xml2::xml_parent(resp_xml)

resp_xml |> xml2::xml_find_all( '//*')

resp_xml |> xml2::xml_children()


resp_list <- xml2::as_list(resp_xml)

item_tmp <- resp_list[["subsonic-response"]][["nowPlaying"]][[1]]

attributes(item_tmp)

purrr::map(resp_list[["subsonic-response"]][["nowPlaying"]], ~attributes(.x))
