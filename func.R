
contact <- function() {
    box(
        title = "Contact", color = "red", ribbon = TRUE, title_side = "top right", width = 4, align = "center",
        a(img(src = "linkedin.svg", width = 40), href = "https://www.linkedin.com/in/erdenei", target = "_blank"),
        a(img(src = "github.svg",   width = 40), href = "https://github.com/red1k", target = "_blank"),
        a(img(src = "facebook.svg", width = 40), href = "https://www.facebook.com/erdenei", target = "_blank"),
        h3("Phone: 9966 2398"),
        tags$small("erdenebayar.kreation@gmail.com")
    )
}
