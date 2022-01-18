select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 355 and ss.ss_hash <= 755 and i.i_hash >= 105 and i.i_hash <= 438 and hd.hd_hash >= 79 and hd.hd_hash <= 829
;
