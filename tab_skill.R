source("func.R")

tab_skill <- tabItem(
	tabName = "skill",
	h1(),
	fluidRow(
		box(title = "Soft skills", color = "blue", title_side = "top left", width = 8,
			column(
				width = 8, align = "center",
				plotOutput(outputId = "radar", width = "100%", height = "450px"),
			)
		),
		box(title = "Technical skills", color = "blue", title_side = "top left", width = 8,
			column(
				width = 8, align = "center",
				plotOutput(outputId = "radar_bar", width = "85%", height = "450px")
			)
		)
	),
	fluidRow(
		box(title = "Analysing skills", color = "green", title_side = "top left", width = 8,
			column(
				width = 8, align = "center",
				plotOutput(outputId = "analyse", width = "90%", height = "300px")
			)
		),
		box(title = "Business skills", color = "green", title_side = "top left", width = 8,
			column(
				width = 8, align = "center",
				plotOutput(outputId = "business", width = "90%", height = "300px")
			)
		)
	)
)