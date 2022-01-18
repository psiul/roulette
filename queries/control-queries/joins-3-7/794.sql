select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 273 and ss.ss_hash <= 606 and hd.hd_hash >= 213 and hd.hd_hash <= 963 and i.i_hash >= 65 and i.i_hash <= 465
;
