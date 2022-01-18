select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 352 and ss.ss_hash <= 685 and i.i_hash >= 237 and i.i_hash <= 987 and hd.hd_hash >= 273 and hd.hd_hash <= 673
;
