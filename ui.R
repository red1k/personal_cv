library(shiny)
library(semantic.dashboard)
library(shiny.semantic)

source("tab_info.R")
source("tab_education.R")
source("tab_experience.R")
source("tab_skill.R")
source("tab_work.R")

dashboardPage(
    dashboardHeader(disable = TRUE),
    dashboardSidebar(size = "thin", color = '', center = T, inverted = F,
        sidebarMenu(
            menuItem("Information", tabName = "information", icon = icon("user")),
            menuItem("Skills",      tabName = "skill",       icon = icon("tree")),
            menuItem("Experience",  tabName = "experience",  icon = icon("briefcase")),
            menuItem("Portfolio",   tabName = "work",        icon = icon("car")),
            menuItem("Education",   tabName = "education",   icon = icon("university"))
        )
    ),
    dashboardBody(
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
        ),
        tabItems(
			tab_info,
			tab_skill,
			tab_experience,
			tab_work,
			tab_education
        )
    )
)