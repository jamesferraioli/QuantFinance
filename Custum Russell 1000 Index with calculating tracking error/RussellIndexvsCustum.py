
# coding: utf-8

# In[1]:


import pandas as pd


# In[2]:


from pandas import DataFrame as df


# In[3]:


import matplotlib.pyplot as plt


# In[4]:


rui_underlying = pd.read_csv("RUI.csv")

rui_underlyingrui_underlying
# In[5]:


new_index = rui_underlying.nlargest(25,'Mkt_Cap')


# In[6]:


new_index


# In[7]:


len(new_index)


# In[8]:


new_index['weight_pct'] = new_index.Mkt_Cap / new_index.Mkt_Cap.sum()


# In[9]:


start_date = '2019-4-1'
end_date = '2019-4-30'


# In[10]:


from pandas_datareader import data


# In[11]:



rui_daily = data.DataReader('^rui', 'yahoo', start_date, end_date)


# In[12]:


rui_daily


# In[13]:


rui_daily['pct_change'] = rui_daily.Close.pct_change()


# In[14]:


rui_daily


# In[15]:


msft_daily = data.DataReader('msft', 'yahoo', start_date, end_date)


# In[16]:


amzn_daily = data.DataReader('amzn', 'yahoo', start_date, end_date)


# In[17]:


aapl_daily = data.DataReader('aapl', 'yahoo', start_date, end_date)


# In[18]:


googl_daily = data.DataReader('googl', 'yahoo', start_date, end_date)


# In[19]:


fb_daily = data.DataReader('fb', 'yahoo', start_date, end_date)


# In[20]:


jnj_daily = data.DataReader('jnj', 'yahoo', start_date, end_date)


# In[21]:


xom_daily = data.DataReader('xom', 'yahoo', start_date, end_date)


# In[22]:


v_daily = data.DataReader('v', 'yahoo', start_date, end_date)


# In[23]:


jpm_daily = data.DataReader('jpm', 'yahoo', start_date, end_date)


# In[24]:


wmt_daily = data.DataReader('wmt', 'yahoo', start_date, end_date)


# In[25]:


bac_daily = data.DataReader('bac', 'yahoo', start_date, end_date)


# In[26]:


pg_daily = data.DataReader('pg', 'yahoo', start_date, end_date)


# In[27]:


vz_daily = data.DataReader('vz', 'yahoo', start_date, end_date)


# In[28]:


ma_daily = data.DataReader('ma', 'yahoo', start_date, end_date)


# In[29]:


intc_daily = data.DataReader('intc', 'yahoo', start_date, end_date)


# In[30]:


pfe_daily = data.DataReader('pfe', 'yahoo', start_date, end_date)


# In[31]:


unh_daily = data.DataReader('unh', 'yahoo', start_date, end_date)


# In[32]:


cvx_daily = data.DataReader('cvx', 'yahoo', start_date, end_date)


# In[33]:


t_daily = data.DataReader('t', 'yahoo', start_date, end_date)


# In[34]:


wfc_daily = data.DataReader('wfc', 'yahoo', start_date, end_date)


# In[35]:


ba_daily = data.DataReader('ba', 'yahoo', start_date, end_date)


# In[36]:


mrk_daily = data.DataReader('mrk', 'yahoo', start_date, end_date)


# In[37]:


csco_daily = data.DataReader('csco', 'yahoo', start_date, end_date)


# In[38]:


hd_daily = data.DataReader('hd', 'yahoo', start_date, end_date)


# In[39]:


brka_daily = data.DataReader('brk-a', 'yahoo', start_date, end_date)


# In[40]:


msft_daily['pct_change'] = msft_daily.Close.pct_change()

amzn_daily['pct_change'] = amzn_daily.Close.pct_change()
# In[41]:


aapl_daily['pct_change'] = aapl_daily.Close.pct_change()


# In[42]:


googl_daily['pct_change'] = googl_daily.Close.pct_change()


# In[43]:


fb_daily['pct_change'] = fb_daily.Close.pct_change()


# In[44]:


jnj_daily['pct_change'] = jnj_daily.Close.pct_change()


# In[45]:


xom_daily['pct_change'] = xom_daily.Close.pct_change()


# In[46]:


v_daily['pct_change'] = v_daily.Close.pct_change()


# In[47]:


jpm_daily['pct_change'] = jpm_daily.Close.pct_change()


# In[48]:


wmt_daily['pct_change'] = wmt_daily.Close.pct_change()


# In[49]:


bac_daily['pct_change'] = bac_daily.Close.pct_change()


# In[50]:


pg_daily['pct_change'] = pg_daily.Close.pct_change()


# In[51]:


vz_daily['pct_change'] = vz_daily.Close.pct_change()


# In[52]:


ma_daily['pct_change'] = ma_daily.Close.pct_change()


# In[53]:


intc_daily['pct_change'] = intc_daily.Close.pct_change()


# In[54]:


pfe_daily['pct_change'] = pfe_daily.Close.pct_change()


# In[55]:


unh_daily['pct_change'] = unh_daily.Close.pct_change()


# In[56]:


cvx_daily['pct_change'] = cvx_daily.Close.pct_change()


# In[57]:


t_daily['pct_change'] = t_daily.Close.pct_change()


# In[58]:


wfc_daily['pct_change'] = wfc_daily.Close.pct_change()


# In[59]:


ba_daily['pct_change'] = ba_daily.Close.pct_change()


# In[60]:


mrk_daily['pct_change'] = mrk_daily.Close.pct_change()


# In[61]:


csco_daily['pct_change'] = csco_daily.Close.pct_change()


# In[62]:


hd_daily['pct_change'] = hd_daily.Close.pct_change()


# In[63]:


brka_daily['pct_change'] = brka_daily.Close.pct_change()


# In[64]:


amzn_daily['pct_change'] = amzn_daily.Close.pct_change()


# In[65]:


new_index.rename(columns={'Russell 1000':'russell1000'})


# In[66]:


new_index.iloc[0].weight_pct


# In[67]:


msft_daily['weighted_close'] = msft_daily.Close * new_index.iloc[0].weight_pct


# In[68]:


amzn_daily['weighted_close'] = amzn_daily.Close * new_index.iloc[1].weight_pct


# In[69]:


aapl_daily['weighted_close'] = aapl_daily.Close * new_index.iloc[2].weight_pct


# In[70]:


googl_daily['weighted_close'] = googl_daily.Close * new_index.iloc[3].weight_pct


# In[71]:


brka_daily['weighted_close'] = brka_daily.Close * new_index.iloc[4].weight_pct


# In[72]:


fb_daily['weighted_close'] = fb_daily.Close * new_index.iloc[5].weight_pct


# In[73]:


jnj_daily['weighted_close'] = jnj_daily.Close * new_index.iloc[6].weight_pct


# In[74]:


xom_daily['weighted_close'] = xom_daily.Close * new_index.iloc[7].weight_pct


# In[75]:


v_daily['weighted_close'] = v_daily.Close * new_index.iloc[8].weight_pct


# In[76]:


jpm_daily['weighted_close'] = jpm_daily.Close * new_index.iloc[9].weight_pct


# In[77]:


wmt_daily['weighted_close'] = wmt_daily.Close * new_index.iloc[10].weight_pct


# In[78]:


bac_daily['weighted_close'] = bac_daily.Close * new_index.iloc[11].weight_pct


# In[79]:


pg_daily['weighted_close'] = pg_daily.Close * new_index.iloc[12].weight_pct


# In[80]:


vz_daily['weighted_close'] = vz_daily.Close * new_index.iloc[13].weight_pct


# In[81]:


ma_daily['weighted_close'] = ma_daily.Close * new_index.iloc[14].weight_pct


# In[82]:


intc_daily['weighted_close'] = intc_daily.Close * new_index.iloc[15].weight_pct


# In[83]:


pfe_daily['weighted_close'] = pfe_daily.Close * new_index.iloc[16].weight_pct


# In[84]:


unh_daily['weighted_close'] = unh_daily.Close * new_index.iloc[17].weight_pct


# In[85]:


cvx_daily['weighted_close'] = cvx_daily.Close * new_index.iloc[18].weight_pct


# In[86]:


t_daily['weighted_close'] = t_daily.Close * new_index.iloc[19].weight_pct


# In[87]:


wfc_daily['weighted_close'] = wfc_daily.Close * new_index.iloc[20].weight_pct


# In[88]:


ba_daily['weighted_close'] = ba_daily.Close * new_index.iloc[21].weight_pct


# In[89]:


mrk_daily['weighted_close'] = mrk_daily.Close * new_index.iloc[22].weight_pct


# In[90]:


csco_daily['weighted_close'] = csco_daily.Close * new_index.iloc[23].weight_pct


# In[91]:


hd_daily['weighted_close'] = hd_daily.Close * new_index.iloc[24].weight_pct


# In[92]:


new_index


# In[93]:


new_index_return = []


# In[232]:


for i in range(0,len(new_index)):
    new_index_return.append(msft_daily.weighted_close.iloc[i]+amzn_daily.weighted_close.iloc[i]+aapl_daily.weighted_close.iloc[i]+googl_daily.weighted_close.iloc[i]+brka_daily.weighted_close.iloc[i]+fb_daily.weighted_close.iloc[i]+jnj_daily.weighted_close.iloc[i]+xom_daily.weighted_close.iloc[i]+v_daily.weighted_close.iloc[i]+jpm_daily.weighted_close.iloc[i]+wmt_daily.weighted_close.iloc[i]+bac_daily.weighted_close.iloc[i]+pg_daily.weighted_close.iloc[i]+vz_daily.weighted_close.iloc[i]+ma_daily.weighted_close.iloc[i]+intc_daily.weighted_close.iloc[i]+pfe_daily.weighted_close.iloc[i]+unh_daily.weighted_close.iloc[i]+cvx_daily.weighted_close.iloc[i]+t_daily.weighted_close.iloc[i]+wfc_daily.weighted_close.iloc[i]+ba_daily.weighted_close.iloc[i]+mrk_daily.weighted_close.iloc[i]+csco_daily.weighted_close.iloc[i]+hd_daily.weighted_close.iloc[i])


# In[ ]:


len(rui_daily)


# In[98]:


rui_daily['new_index_close'] = new_index_return


# In[99]:


rui_daily


# In[100]:


rui_daily['new_index_pct_change'] = rui_daily.new_index_close.pct_change()


# In[101]:


rui_daily


# In[102]:


tracking_error = 0


# In[129]:


rui_daily.iloc[1].new_index_pct_change - rui_daily.iloc[1].pcnt_change


# In[125]:


rui_daily.rename(columns = {'pct_change':'pcnt_change'}, inplace = True)


# In[127]:





# In[136]:


rui_daily['daily_tracking_error'] = rui_daily.new_index_pct_change - rui_daily.pcnt_change


# In[137]:


rui_daily


# In[140]:


tracking_error = rui_daily.daily_tracking_error.std(axis = 0, skipna = True) 


# In[141]:


tracking_error


# In[142]:


import matplotlib.pyplot as plt


# In[145]:


rui_daily


# In[230]:


rui_daily.pcnt_change.plot(label='^RUI',figsize=(16,8),title='Tracking Error of a custom Russell 1000 index vs ^RUI')
rui_daily.new_index_pct_change.plot(label='custum_russell_index')
plt.legend(loc="upper left")


# In[231]:


fig, ax1 = plt.subplots()
ax1.plot(rui_daily["Close"], "ro-", label="^RUI Daily Close")
ax2 = ax1.twinx()
ax2.plot(rui_daily["new_index_close"], "bo-", label="Custom Russell 1000 index Daily Close")
lines, labels = ax1.get_legend_handles_labels()
lines2, labels2 = ax2.get_legend_handles_labels()
ax2.legend(lines + lines2, labels + labels2, loc=0)
fig.suptitle('Daily price change of ^RUI and a custom Russell 1000 index', fontsize=16)
ax1.set_ylabel('^RUI Close')
ax2.set_ylabel('Custom Index Close')

