select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 127 and ss.ss_hash <= 877 and i.i_hash >= 330 and i.i_hash <= 730 and hd.hd_hash >= 38 and hd.hd_hash <= 371
;
