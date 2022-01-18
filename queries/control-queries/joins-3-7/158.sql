select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 56 and ss.ss_hash <= 456 and hd.hd_hash >= 108 and hd.hd_hash <= 441 and i.i_hash >= 218 and i.i_hash <= 968
;
