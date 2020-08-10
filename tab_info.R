library(shiny)
library(semantic.dashboard)
library(shiny.semantic)
source("func.R")

tab_info <- tabItem(
	tabName = "information",
	h1(),
	fluidRow(
		column(
			width = 12,
			box(title = "Introduction", color = "green", title_side = "top left", width = 12,
				p(
					"Hey there!, Welcome to my personal site. I am Erdenebayar"
				),
				p(
					"I have keen interest in Microsoft Excel, statistical
					programming language “R” and Data analysing tools
					(Power BI, Tableau). Self-learner at EDX and Coursera,
					and Kaggle"
				)
			),
			h2(),
			box(title = "Interest", color = "blue", title_side = "top left", width = 12,
				p(
				    "Despite my bachelor degree was accounting, I have worked in a
				    number of fields and have achieved numerous experience and valuable knowledge regarding
				    data entry, manipulation, and data reporting and visualization techniques."
				),
				p(
				    "About two years ago, I have enrolled at the School of Engineering and Applied Science at NUM and
				    have gained academic knowledge of programming languages, database administration,
				    query processing, and data science."
				),
				p(
				    "I have always been a number person and keen interest in finding patterns, automating
				    repetitive and tedious tasks. In fact, there are numerous excel sheets that I have created
				    for our daily basis which avoid mechanic errors and save times."
				)
			),
			h2(),
		),
		column(
			width = 4,
			box(title = "this is me", color = "grey", title_side = "top right", width = 4, align = "center",
				img(src = "portrait.jpg", width = 200)
			),
			h2(),
			contact()
		)
	)
)
