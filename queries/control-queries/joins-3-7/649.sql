select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 590 and ss.ss_hash <= 923 and hd.hd_hash >= 89 and hd.hd_hash <= 489 and i.i_hash >= 14 and i.i_hash <= 764
;
