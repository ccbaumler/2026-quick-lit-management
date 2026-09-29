devel:
	quarto preview ./content

deploy:
	quarto publish gh-pages 

pdf: 
	quarto render ./content/index.qmd --to pdf

renv-init:
	cd content && Rscript \
		-e 'if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv", repos = "https://cloud.r-project.org")' \
		-e 'if (!requireNamespace("yaml", quietly = TRUE)) install.packages("yaml", repos = "https://cloud.r-project.org")' \
		-e 'renv::init(bare = TRUE)' \
		-e 'renv::install(c("yaml", "knitr", "rmarkdown"))' \
		-e 'renv::hydrate()' \
		-e 'renv::snapshot(prompt = FALSE)'

renv-restore:
	cd content && Rscript -e 'renv::restore()'
