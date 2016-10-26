graphs.pdf: graphs.tex Figs/fig1a.png Figs/fig3a.png Figs/fig5a.png Figs/fig2a_rev.png TopTenWorstGraphs/broman_fig1.jpg Crashes/crashes.pdf Crashes/crashes_scatter.pdf Crashes/Figs/chalabi-dearmona-distracted.png Crashes/Figs/chalabi-dearmona-speeding.png Crashes/Figs/chalabi-dearmona-drinking.png Crashes/crashes_errors.pdf
	pdflatex graphs

graphs.tex: graphs.Rnw
	Rscript -e "library(knitr);knit('graphs.Rnw')"

TopTenWorstGraphs/broman_fig1.jpg: TopTenWorstGraphs.zip
	unzip TopTenWorstGraphs.zip

TopTenWorstGraphs.zip:
	wget http://www.biostat.wisc.edu/~kbroman/topten_worstgraphs/TopTenWorstGraphs.zip

Figs/fig1a.png: R/fig1.R
	cd R;R CMD BATCH fig1.R fig1.Rout

Figs/fig3a.png: R/fig3.R
	cd R;R CMD BATCH fig3.R fig3.Rout

Figs/fig5a.png: R/fig5.R
	cd R;R CMD BATCH fig5.R fig5.Rout

Figs/fig2a_rev.png: R/fig2.R
	cd R;R CMD BATCH fig2.R fig2.Rout

Crashes/crashes.pdf: Crashes/plot.R Crashes/proper_data.R
	cd $(<D);R CMD BATCH $(<F)

Crashes/crashes_scatter.pdf: Crashes/scatterplots.R Crashes/proper_data.R
	cd $(<D);R CMD BATCH $(<F)

Crashes/crashes_errors.pdf: Crashes/compare_measurements.R Crashes/data.R Crashes/proper_data.R
	cd $(<D);R CMD BATCH $(<F)

web: graphs.pdf
	scp graphs.pdf broman-10.biostat.wisc.edu:Website/presentations/graphs_MDPhD2016.pdf

Crashes/Figs/%.png:
	cd $(@D);wget 'https://espnfivethirtyeight.files.wordpress.com/2014/10/$(@F)'
	touch $@
