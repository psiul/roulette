select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 214 and ss.ss_hash <= 614 and i.i_hash >= 189 and i.i_hash <= 939 and hd.hd_hash >= 103 and hd.hd_hash <= 436
;
