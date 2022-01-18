select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 205 and ss.ss_hash <= 955 and i.i_hash >= 96 and i.i_hash <= 429 and hd.hd_hash >= 460 and hd.hd_hash <= 860
;
