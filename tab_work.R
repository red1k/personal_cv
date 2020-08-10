source("func.R")

tab_work <- tabItem(
	tabName = "work",
	h1(),
	fluidRow(
		column(
			width = 12,
			tabBox(title = 'Some works', color = "blue", width = 8, title_side = "top left",
				tabs = list(
					list(menu = div("monthly dashboard"), content = img(src = '1.png', width = "100%")),
					list(menu = div("weekly trip report"), content = img(src = '2.png', width = "100%")),
					list(menu = div("monthly budget report"), content = img(src = '3.png', width = "100%")),
					list(menu = div("annual HSE report"), content = img(src = '4.png', width = "100%")),
					list(menu = div("annual HR report"), content = img(src = '5.png', width = "100%"))
				  )
			)
		),
		column(
			width = 4,
			contact()
		)
	)
)
