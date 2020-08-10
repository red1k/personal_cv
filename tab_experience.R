source("func.R")

tab_experience <- tabItem(
	tabName = "experience",
	h1(),
	fluidRow(
		column(
			width = 12,
			box(title = "Information Officer", color = "green", title_side = "top left", width = 12,
				h3("SGC LLC", tags$small("(2019/10 - current)")),
				tags$ul(style = "font-size: 18px;",
					tags$li("Analyse and manipulate data in MS Excel, prepare weekly, monthly, annual reports"),
					tags$li("Develop new reports for management team in R-shiny, R markdown and MS Excel"),
					tags$li("Provide administrative support for the operations team"),
					tags$li("Provide technical support for both hardware and software issues")
				)
			),
			box(title = "Shipping administrator", color = "blue", title_side = "top left", width = 12,
				h3("KS LLC", tags$small("(2018/01 - 2019/10)")),
				tags$ul(style = "font-size: 18px;",
					tags$li("Analyse and manipulate data in MS Excel and PowerBI, prepare weekly, monthly, annual reports"),
					tags$li("Develop new reports for management team"),
					tags$li("Provide administrative support for the operations team"),
					tags$li("Provide technical support for both hardware and software issues")
				)
			),
			box(title = "Asset Accountant", color = "green", title_side = "top left", width = 12,
				h3("Golomt Bank", tags$small("(2017/01 - 2017/06)")),
				tags$ul(style = "font-size: 18px;",
					tags$li("Exporting data from Oracle BI to MS excel for periodic reporting"),
					tags$li("Preparation and input of month end journal vouchers"),
					tags$li("Inputting, matching, batching excel files"),
					tags$li("Preparing asset reports and accounting information")
				)
			),
			box(title = "General Accountant", color = "blue", title_side = "top left", width = 12,
				h3("UB.LIFE site", tags$small("(2016/03 - 2017/12)")),
				tags$ul(style = "font-size: 18px;",
					tags$li("Prepare balance sheet, profit and loss statement, and other reports"),
					tags$li("Liaising with customers, suppliers and tax examiner"),
					tags$li("Documents financial transactions by entering account information")
				)
			)
		),
		column(
			width = 4,
			contact()
		)
	)
)
