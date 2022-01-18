select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 177 and ss.ss_hash <= 927 and i.i_hash >= 8 and i.i_hash <= 408 and hd.hd_hash >= 120 and hd.hd_hash <= 453
;
