import pandas as pd
import sys
import matplotlib.pyplot as plt

df = pd.read_csv(sys.argv[1], sep="\t", names=["episodeId", "nodeId", "episodeInput", "episodeProbeInput", "episodeProbeOutput", "episodeDivInput", "episodeDivOutput", "estimatedCost"])

episodeProbeInputSum = df["episodeProbeInput"].sum()
episodeProbeOutputSum = df["episodeProbeOutput"].sum()
episodeDivInputSum = df["episodeDivInput"].sum()
episodeDivOutputSum = df["episodeDivOutput"].sum()

print(str(episodeProbeInputSum) + " " + str(episodeProbeOutputSum) + " " + str(episodeDivInputSum) + " " + str(episodeDivOutputSum) + " ")