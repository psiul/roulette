select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 151 and ss.ss_hash <= 901 and i.i_hash >= 20 and i.i_hash <= 353 and hd.hd_hash >= 472 and hd.hd_hash <= 872
;
