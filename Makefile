devel:
	quarto preview ./content

deploy:
	quarto publish gh-pages 

pdf: 
	quarto render ./content/index.md --to pdf

renv-init:
	cd content && Rscript -e 'install.packages("renv", repos = "https://cloud.r-project.org"); renv::init()'
