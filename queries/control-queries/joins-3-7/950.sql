select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 39 and ss.ss_hash <= 789 and i.i_hash >= 57 and i.i_hash <= 457 and hd.hd_hash >= 314 and hd.hd_hash <= 647
;
