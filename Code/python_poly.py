import numpy as np
import pandas as pd
from sklearn.kernel_ridge import KernelRidge
from sklearn.grid_search import GridSearchCV

import numpy as np
import matplotlib.pyplot as plt
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LinearRegression
#from sklearn import model_selection
#from sklearn.model_selection import cross_val_score




alpha=[0.00001,0.0001,0.001,0.01,0.1]
degree=[1,2,3,4,5,6]

dataset='/home/kushagra/Desktop/NSE-HDFCBANK_new_without_nifty.csv'
X=pd.read_csv(dataset, sep=",", header=None)

X=np.array(X)
numFeatures=len(X[1])-1    



#degrees = [1,3,4, 5,8,10,15]

for i in range(len(X[1])):
	X[:,i]=(X[:,i]-min(X[:,i]))/(max(X[:,i])-min(X[:,i]))
X_train=X[:2400]
print(X_train)
X_test=X[2400:3000]
Y_train=X[:2400,numFeatures]
Y_test=X[2400:3000,numFeatures]

# param_grid=[{'alpha':[0.00001,0.0001,0.001,0.01,0.1],'degree':[2,3,4,5,6]},]
for a in alpha:
	for b in degree:
		clf=KernelRidge(kernel='polynomial',alpha=a,degree=b)
		clf.fit(X_train, Y_train)
		print("a: ",a,"b: ",b,"error: ",1-clf.score(X_test, Y_test))


# for i in range(len(degrees)):
# 	print("degree: ",degrees[i])
# 	polynomial_features = PolynomialFeatures(degree=degrees[i],include_bias=True)
# 	linear_regression = LinearRegression()
# 	pipeline = Pipeline([("polynomial_features", polynomial_features),
#                          ("linear_regression", linear_regression)])
# 	pipeline.fit(X_train, Y_train)
# 	print("score: ",pipeline.score(X_test,Y_test))
	# print("predicted values: ",pipeline.predict(X_test))
    #print(scores)