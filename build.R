library(rix)
rix(
  r_ver = "latest",
  r_pkgs = c("shiny", "shinylive", "httr2", "countdown"),
  system_pkgs = c("quarto", "vscodium"),
  git_pkgs = NULL,
  ide = "radian",
  project_path = ".",
  overwrite = TRUE
)
