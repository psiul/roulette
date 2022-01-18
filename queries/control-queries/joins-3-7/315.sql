select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 78 and ss.ss_hash <= 478 and i.i_hash >= 114 and i.i_hash <= 447 and hd.hd_hash >= 116 and hd.hd_hash <= 866
;
