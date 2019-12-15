# Stock-Price-Prediction

### Introduction
In this project, we used machine learning algorithms to predict the closing price of stocks of companies across various sectors like IT, Pharmaceutical, and Banking industry. We used three datasets taken from [Quandl.com](https://www.quandl.com/): Tata Consultancy Services (IT industry), HDFC Bank (Banking Industry) and CIPLA Pharmaceuticals Private Limited (Pharmaceutical Industry). 


### Techniques Applied
The techniques explored were simple and regularized linear regression (LASSO and RIDGE), polynomial and gaussian kernel regression, and support vector regression (linear, polynomial and gaussian kernels). We used gridsearch and cross validation to tune the hyper-parameters, and MSE was the loss function used. Both Stochastic and Batch Gradient Descent were tried. A subset of the features considered were momentum over varying intervals, moving averages over varying intervals, volatality, average turnover for the previous 10 days, NIFTY (National Stock Exchange of India's benchmark broad based stock market index for the Indian equity market) closing price, previous day stock closing price etc. 


### Conclusions
* The same model does not give best results across different stocks. Stocks from different sectors perform best with different set of features and amount of historical data.
* The choice of good features is the most important determinant for obtaining superior performance from machine learning models.
* The closing price of HDFC Bank is the most predictable among the 3 stocks.
