ictr2014.pdf: ictr2014.tex Figs/fig1a.png Figs/fig3a.png Figs/fig5a.png TopTenWorstGraphs/broman_fig1.jpg
	pdflatex ictr2014

ictr2014.tex: ictr2014.Rnw
	Rscript -e "library(knitr);knit('ictr2014.Rnw')"

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

web: ictr2014
	scp ictr2014.pdf broman-2:public_html/presentations/IowaState2013/
