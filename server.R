library(tidyverse)
library(plotly)
library(fmsb)

function(input, output, session) {
    
    output$radar <- renderPlot({
        data <- as.data.frame(
            matrix(
                c(5, 9, 7, 8, 3, 6, 7, 2),
                ncol = 8
            )
        )
        
        colnames(data) <- c(
            "public speaking", "writing skill", 
            "creativity", "problem-solving",
            "leadership", "decision making", 
            "collaboration", "social skills"
        )
        
        data <- rbind(rep(10, 10), rep(0, 10), data)
        
        colors_border <- c("red")
        colors_in <- c(rgb(1, 0, 0, alpha = 0.4))
        
        radarchart(
            data,
            pcol = colors_border, pfcol = colors_in,
            cglcol = "grey", cglty = 1, axislabcol = "grey", caxislabels = seq(0,20,5), cglwd = 1.8,
            vlcex = 1.1
        ) 
    })
    
    output$radar_bar <- renderPlot({
        skills <- c(
            "tidyverse", "readxl", "purrr", "rmarkdown", "rshiny", "shinydashboard", "RSQLite", "rvest", 
            "git", "vim", "linux", "sql queries", "rstudio",
            "pandas", "numpy", "flask", "django", 
            "power query", "power pivot", "pivot table"
        )

        data <- data.frame(
            individual = skills,
            group = c(rep('r', 8), rep('other', 5), rep('py', 4), rep('excel', 3)),
            value = c(
				80, 75, 58, 87, 100, 70, 50, 60, 	# r
				93, 100, 75, 68, 98,				# other
				30, 34, 20, 24, 					# python
				100, 80, 100 						# excel
			)
        )
        
        data <- data %>% arrange(group, value)
        
        # Set a number of 'empty bar' to add at the end of each group
        empty_bar <- 2
        to_add <- data.frame(matrix(NA, empty_bar * nlevels(data$group), ncol(data)))
        colnames(to_add) <- colnames(data)
        to_add$group <- rep(levels(data$group), each=empty_bar)
        data <- rbind(data, to_add)
        data <- data %>% arrange(group)
        data$id <- seq(1, nrow(data))
        
        # Get the name and the y position of each label
        label_data <- data
        number_of_bar <- nrow(label_data)
        
        angle <- 90 - 360 * (label_data$id-0.5) /number_of_bar     
        label_data$hjust <- ifelse( angle < -90, 1, 0)
        label_data$angle <- ifelse(angle < -90, angle + 180, angle)
        
        # prepare a data frame for base lines
        base_data <- data %>% 
            group_by(group) %>% 
            summarize(start = min(id), end = max(id) - empty_bar) %>% 
            rowwise() %>% 
            mutate(title = mean(c(start, end)))
        
        # prepare a data frame for grid (scales)
        grid_data <- base_data
        grid_data$end <- grid_data$end[c( nrow(grid_data), 1:nrow(grid_data) - 1)] + 1
        grid_data$start <- grid_data$start - 1
        grid_data <- grid_data[-1, ]
        
        p <- ggplot(data, aes(x = as.factor(id), y = value, fill = group)) +
            geom_bar(
				aes(x = as.factor(id), y = value, fill = group), 
				stat = "identity", alpha = 0.5
			) +
            geom_segment(
				data = grid_data, 
				aes(x = end, y = 80, xend = start, yend = 80),
				colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE
			) +
            geom_segment(
				data = grid_data, 
				aes(x = end, y = 60, xend = start, yend = 60),
				colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE
			) +
            geom_segment(
				data = grid_data,
				aes(x = end, y = 40, xend = start, yend = 40), 
				colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE
			) +
            geom_segment(
				data = grid_data, aes(x = end, y = 20, xend = start, yend = 20), 
				colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE
			) +
            # Add text showing the value of each 100/75/50/25 lines
            annotate(
				"text", 
				x = rep(max(data$id),4), 
				y = c(20, 40, 60, 80), 
				label = c("20", "40", "60", "80"),
				color = "grey", size = 3, angle = 0, 
				fontface = "bold", hjust = 1
			) +
            geom_bar(
				aes(x = as.factor(id), y = value, fill = group),
				stat = "identity", alpha = 0.5
			) +
            ylim(-100,120) +
            theme_minimal() +
            theme(
                legend.position = "none",
                axis.text = element_blank(),
                axis.title = element_blank(),
                panel.grid = element_blank(),
                plot.margin = unit(rep(-0.1, 4), "cm")
            ) +
            coord_polar() + 
            geom_text(
				data = label_data, 
				aes(x = id, y = value + 7, label = individual, hjust = hjust),
				color = "black",
				size = 4, angle = label_data$angle, inherit.aes = FALSE
			) +
            geom_segment(
				data = base_data, 
				aes(x = start, y = -3, xend = end, yend = -3), 
				colour = "grey", alpha = 0.8, size = 0.6 , inherit.aes = FALSE
			) +
            geom_text(
				data = base_data, 
				aes(x = title, y = -18, label = group), 
				hjust = c(1,1,0,0), colour = "black", alpha = 0.8,
				size = 5, fontface = "bold", inherit.aes = FALSE
			)
        p
    })
    
    output$analyse <- renderPlot({
        data <- data.frame(
            x = c(
                "data cleaning", "data transpose", "wrangling", 
                "data aggregation","automating", "visualization", "reporting"
            ),
            y = c(
                9, 7, 8, 6, 7, 8.2, 8.8
            )
        )
        data %>% 
            mutate(x = fct_reorder(x, y)) %>%
            ggplot(aes(x = x, y = y)) +
            geom_segment(aes(x = x, xend = x, y = 0, yend = y)) +
            geom_point(
                size = 4, color = "blue",
                fill = alpha("blue", 0.3),
                shape = 21, stroke = 2
            ) +
            coord_flip() +
            theme_minimal() +
            theme(
                text = element_text(size = 16),
                axis.text.x = element_blank(),
                axis.title.x = element_blank(),
                axis.title.y = element_blank(),
            )
    })
    
    output$business <- renderPlot({
        data <- data.frame(
            x = c(
                "financial statements", "tax accounting", "cost accounting",
                "documenting transactions", "handling social insurance representative"
            ),
            y = c(
                4, 3, 6, 9, 9.4
            )
        )
        data %>% 
            mutate(x = fct_reorder(x, y)) %>%
            ggplot(aes(x = x, y = y)) +
            geom_segment(aes(x = x, xend = x, y = 0, yend = y)) +
            geom_point(
                size = 4, color = "blue",
                fill = alpha("blue", 0.3),
                shape = 21, stroke = 2
            ) +
            coord_flip() +
            theme_minimal() +
            theme(
                text = element_text(size = 16),
                axis.text.x = element_blank(),
                axis.title.x = element_blank(),
                axis.title.y = element_blank(),
            )
    })
        
}
