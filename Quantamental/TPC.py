#!/usr/bin/env python
# coding: utf-8

# In[41]:


import pandas as pd


# In[42]:


TPC = pd.read_csv('TPC.csv')


# In[43]:


TPC


# In[40]:


import matplotlib.pyplot as plt


# In[39]:


from pandas_datareader import data


# In[44]:


start_date = '2016-3-31'
end_date = '2022-12-31'
TPC_Daily = data.DataReader('tpc', 'yahoo', start_date, end_date)


# In[45]:


TPC_Daily


# In[83]:


TPC_Daily.Close.plot(label='TPC',figsize=(16,8),title='TPC Daily Close')
plt.legend(loc="upper left")
TPC.plot(x='Date', y='ROIC', figsize=(16,8), title='TPC Quarterly ROIC')


# In[86]:


TPC


# In[ ]:




