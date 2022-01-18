import pandas as pd
import sys
import matplotlib.pyplot as plt

df = pd.read_csv(sys.argv[1], sep="\t", names=["episodeId", "nodeId", "episodeInput", "episodeProbeInput", "episodeProbeOutput", "episodeDivInput", "episodeDivOutput", "estimatedCost"])

relation = int(sys.argv[2])

df = df[df["nodeId"] == relation]


df["cost"] = 43.29*df["episodeProbeOutput"] + 38.57*df["episodeProbeInput"] + 0.923*df["episodeDivOutput"] + 3.597*df["episodeDivInput"]
df["observedCost"] = df["cost"].rolling(100).sum()/100
df["estimatedCost"] = df["estimatedCost"].rolling(100).sum()/100


df["observedCost"] = df["observedCost"]#/1000000
df["estimatedCost"] = df["estimatedCost"]#/1000000

del df["nodeId"]
del df["episodeInput"]
del df["episodeProbeInput"]
del df["episodeProbeOutput"]
del df["episodeDivInput"]
del df["episodeDivOutput"]


#plt.figure()
fig,ax=plt.subplots(figsize=[14.0,2.5])
plt.rcParams.update({'font.size': 36})
#plt.yscale("log")
ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)
plt.locator_params(axis='y', nbins=5)
plt.tick_params(axis='x',which='both',bottom=False,top=False)
plt.tick_params(axis='y',which='both',left=False,right=False)
plt.plot(df['episodeId'], df['observedCost'], label="Actual Cost", linewidth=3, color="darkblue")
plt.plot(df['episodeId'], df['estimatedCost'], label="Predicted Cost", linewidth=3, color="darkgreen")
#plt.legend(loc="upper right")
plt.xlim(0, df["episodeId"].max()*1.0)
plt.ylim(0, df["observedCost"].max()*1.1)
plt.ticklabel_format(axis="y", style="sci", scilimits=(0,0))
plt.xlabel("Episode Sequence Number")
plt.ylabel("Episode Cost")
#ax = df.plot.line(x='episodeId', y=['observedCost', 'estimatedCost'])
#ax.set_ylim(0, df["observedCost"].max()*1.1)
#ax.set_xlim(0, df["episodeId"].max()*1.1)
plt.savefig("/home/sioulas/sigmod/sybil/prototype/" + sys.argv[1] + ".png", transparent=True, bbox_inches="tight", pad_inches=1)
#plt.show(block=True)


#mincost = df["observedCost"].quantile(q=0.001)
#df["overhead"] = df["observedCost"]-mincost
#print(df["overhead"].sum()/df["observedCost"].sum())