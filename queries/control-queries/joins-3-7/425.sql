select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 180 and ss.ss_hash <= 930 and i.i_hash >= 598 and i.i_hash <= 998 and hd.hd_hash >= 70 and hd.hd_hash <= 403
;
