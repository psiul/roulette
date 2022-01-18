select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 106 and ss.ss_hash <= 506 and i.i_hash >= 192 and i.i_hash <= 942 and hd.hd_hash >= 155 and hd.hd_hash <= 488
;
