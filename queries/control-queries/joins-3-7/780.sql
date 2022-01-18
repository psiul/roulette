select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 95 and ss.ss_hash <= 428 and hd.hd_hash >= 26 and hd.hd_hash <= 426 and i.i_hash >= 232 and i.i_hash <= 982
;
