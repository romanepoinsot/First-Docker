
FROM davidgohel/r4-baseapp

RUN R -e 'install.packages("shiny")'