source("func.R")

tab_education <- tabItem(
	tabName = "education",
	h1(),
	fluidRow(
		column(
			width = 12,
			box(title = "University", color = "green", title_side = "top left", width = 12,
				h3("National University of Mongolia - SEAS", tags$small("(2017 - current)")),
				p(
					"Completed 24 credits, GPA - 3.3"
				),
				p("-----------------------------------------------------------------------"),
				h3("University of Finance and Economics", tags$small("(2011 - 2015)")),
				p(
					"Degree of Bachelor of Business Administration in Accounting"
				),
				p(
					"GPA - 3.13"
				)
			),
			box(title = "Course", color = "blue", title_side = "top left", width = 12,
				h3("Power BI - beginner course", tags$small("(2020)")),
				p("Rapid classroom course from CloudBI computer training school"),
				p("-----------------------------------------------------------------------"),
				h3("Data Analysis with R - online course", tags$small("(2020)")),
				p("Self paced online course offered by data-school.xyz.")
			)
		),
		column(
			width = 4,
			contact()
		)
	)
)
