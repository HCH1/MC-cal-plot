## 1111
## https://www.analyticsvidhya.com/blog/2014/05/build-word-cloud-text-mining-tools/
dtm <- DocumentTermMatrix(docs)
library(wordcloud)
m <- as.matrix(dtm)
v <- sort(colSums(m),decreasing=TRUE)
head(v,14)
words <- names(v)
d <- data.frame(word=words, freq=v)
wordcloud(d$word,d$freq,min.freq=50)
##
## 1028
## http://stackoverflow.com/questions/25198442/how-to-calculate-mean-median-per-group-in-a-dataframe-in-r
library(doBy)
summaryBy(value ~ custid, data = mydf, 
          FUN = list(mean, max, min, median, sd))
#   custid value.mean value.max value.min value.median value.sd
# 1      1   2.666667         5         1          2.5 1.632993
# 2      2   5.500000        10         1          5.5 6.363961
# 3      3   2.666667         5         1          2.0 2.081666

## https://qualityandinnovation.files.wordpress.com/2015/11/xbar-r-75-925_9.pdf
diameters <- as.data.frame(replicate(4, rnorm(10,mean=1.31,sd=0.05)))
q <- qcc(diameters, type="R", nsigmas=3)
q <- qcc(diameters, type="xbar", nsigmas=3)
process.capability(q, spec.limits=c(1.31,1.32))

## 1027 
## https://plot.ly/python/getting-started/
## https://plot.ly/alpha/workspace/
## https://plot.ly/python/distplot/
pip install plotly 
pip install plotly --upgrade
import plotly
from plotly.graph_objs import Histogram, Layout

plotly.offline.plot({
    "data": [Histogram(x=[1, 2, 3, 4, 5, 6, 6, 6, 6, 6])],
})
##
## http://stackoverflow.com/questions/5328556/histogram-matplotlib
import matplotlib.pyplot as plt
import numpy as np

mu, sigma = 100, 15
x = mu + sigma * np.random.randn(10000)
hist, bins = np.histogram(x, bins=50)
width = 0.7 * (bins[1] - bins[0])
center = (bins[:-1] + bins[1:]) / 2
plt.bar(center, hist, align='center', width=width)
plt.show()
##
import matplotlib.pyplot as plt
import numpy as np

mu, sigma = 100, 15
x = mu + sigma * np.random.randn(10000)
bins = [0, 40, 60, 75, 90, 110, 125, 140, 160, 200]
hist, bins = np.histogram(x, bins=bins)
width = np.diff(bins)
center = (bins[:-1] + bins[1:]) / 2

fig, ax = plt.subplots(figsize=(8,3))
ax.bar(center, hist, align='center', width=width)
ax.set_xticks(bins)
fig.savefig("/tmp/out.png")

plt.show()
## http://matplotlib.org/users/pyplot_tutorial.html
import numpy as np
import matplotlib.pyplot as plt

mu, sigma = 100, 15
x = mu + sigma * np.random.randn(10000)

# the histogram of the data
n, bins, patches = plt.hist(x, 50, normed=1, facecolor='g', alpha=0.75)

plt.xlabel('Smarts')
plt.ylabel('Probability')
plt.title('Histogram of IQ')
plt.text(60, .025, r'$\mu=100,\ \sigma=15$')
plt.axis([40, 160, 0, 0.03])
plt.grid(True)
plt.show()
