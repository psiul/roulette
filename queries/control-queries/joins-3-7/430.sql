select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 395 and ss.ss_hash <= 728 and i.i_hash >= 23 and i.i_hash <= 773 and hd.hd_hash >= 308 and hd.hd_hash <= 708
;
