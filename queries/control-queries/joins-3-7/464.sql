select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 373 and ss.ss_hash <= 706 and hd.hd_hash >= 345 and hd.hd_hash <= 745 and i.i_hash >= 98 and i.i_hash <= 848
;
