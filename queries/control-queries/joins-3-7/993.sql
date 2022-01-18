select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 215 and ss.ss_hash <= 965 and i.i_hash >= 88 and i.i_hash <= 488 and hd.hd_hash >= 427 and hd.hd_hash <= 760
;
