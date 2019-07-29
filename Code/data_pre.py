import numpy as np
import pandas as pd
import os,csv

filename='ml_orig_data/NSE-CIPLA.csv'
filename_rev='ml_orig_data/NSE-CIPLA_new.csv'
file_nifty='ml_orig_data/NSE-NIFTY_50.csv'

X=pd.read_csv(filename, sep=",", header=None)
tot_len=len(X[0])-2
st_index=1
end_index=len(X[0])-2

X=np.array(X)

openpr=X[st_index:end_index+1,1]
highpr=X[st_index:end_index+1,2]
lowpr=X[st_index:end_index+1,3]
lastpr=X[st_index:end_index+1,4]
closepr=X[st_index:end_index+1,5]
turnover=X[st_index:end_index+1,7]


openpr = [ float(x) for x in openpr ]
highpr = [ float(x) for x in highpr ]
lowpr = [ float(x) for x in lowpr ]
lastpr = [ float(x) for x in lastpr ]
closepr = [ float(x) for x in closepr ]
turnover = [ float(x) for x in turnover ]

movingavg10=[]
movingavg15=[]
movingavg20=[]
movingavg40=[]

prevclose=[]
samedayopen=[]
prevnifty=[]
diffhighlow=[]
avgdiffhighlow=[]
turnover10=[]
mom10=[]

#### moving avg 10 days
for i in range(len(openpr)):
	if(i<10):
		movingavg10.append(sum(closepr[0:i+1])/(i+1))
	else:
		movingavg10.append(sum(closepr[i-10:i])/10)


#### moving avg 15 days
for i in range(len(openpr)):
	if(i<15):
		movingavg15.append(sum(closepr[0:i+1])/(i+1))
	else:
		movingavg15.append(sum(closepr[i-15:i])/15)

#### moving avg 20 days
for i in range(len(openpr)):
	if(i<20):
		movingavg20.append(sum(closepr[0:i+1])/(i+1))
	else:
		movingavg20.append(sum(closepr[i-20:i])/20)

#### moving avg 40 days
for i in range(len(openpr)):
	if(i<40):
		movingavg40.append(sum(closepr[0:i+1])/(i+1))
	else:
		movingavg40.append(sum(closepr[i-40:i])/40)


###prev day closign price
for i in range(len(openpr)):
	if(i==0):
		prevclose.append(closepr[i])
	else:
		prevclose.append(closepr[i-1])


###same day opening price
for i in range(len(openpr)):
	samedayopen.append(openpr[i])



###prev day nifty close
Y=pd.read_csv(file_nifty, sep=",", header=None)
tot_len_nifty=len(Y[0])-2
st_index_nifty=len(Y[0])-2-3000+1
end_index_nifty=len(Y[0])-2

Y=np.array(Y)

closepr_nifty=Y[st_index:end_index+1,4]
closepr_nifty = [ float(x) for x in closepr_nifty ]

for i in range(len(openpr)):
	if(i==0):
		prevnifty.append(float(Y[st_index_nifty-1][4]))
	else:
		prevnifty.append(closepr_nifty[i-1])




### momentum for past 10 days
for i in range(len(openpr)):
	if(i==0):
		mom10.append(closepr[i+1]-closepr[i])
	elif(i<10):
		mom10.append(closepr[i-1]-closepr[0])
	else:
		mom10.append(closepr[i-1]-closepr[i-10])



####diff between high low previous day
for i in range(len(openpr)):
	if(i==0):
		#diffhighlow[i]=X[st_index_nifty-1][2]-X[st_index_nifty-1][3]
		diffhighlow.append(highpr[i]-lowpr[i])
	
	else:
		diffhighlow.append(highpr[i-1]-lowpr[i-1])


####Avg diff between high low past 10 days
for i in range(len(openpr)):
	if(i<10):
		avgdiffhighlow.append(sum(np.array(highpr[0:i+1])-np.array(lowpr[0:i+1]))/(i+1))
	else:
		avgdiffhighlow.append(sum(np.array(highpr[i-10:i])-np.array(lowpr[i-10:i]))/10)




#### avg turnover for past 10 days
for i in range(len(openpr)):
	if(i<10):
		turnover10.append(sum(turnover[0:i+1])/(i+1))
	else:
		turnover10.append(sum(turnover[i-10:i])/10)



# with open(filename_rev, 'a') as csvoutput:
#     for i in range(len(openpr)):
# 	    writer = csv.writer(csvoutput, lineterminator='\n')
# 	    #reader = csv.reader(csvinput)
# 	    all = []
# 	    #row = next(reader)
# 	    #row.append('Berry')
# 	    all.append(movingavg10[i])
# 	    all.append(movingavg15[i])
# 	    all.append(movingavg20[i])
# 	    all.append(movingavg40[i])
# 	    all.append(prevclose[i])
# 	    all.append(samedayopen[i])
# 	    all.append(prevnifty[i])
# 	    all.append(mom10[i])
# 	    all.append(diffhighlow[i])
# 	    all.append(avgdiffhighlow[i])
# 	    all.append(turnover10[i])
# 	    i+=1
# 	    # for row in reader:
# 	    #     row.append(row[0])
# 	    #     all.append(row)
# 	    writer.writerow(all)

