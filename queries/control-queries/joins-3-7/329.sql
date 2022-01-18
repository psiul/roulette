select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 135 and ss.ss_hash <= 468 and i.i_hash >= 55 and i.i_hash <= 805 and hd.hd_hash >= 341 and hd.hd_hash <= 741
;
