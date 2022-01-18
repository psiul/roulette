select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 179 and ss.ss_hash <= 512 and i.i_hash >= 71 and i.i_hash <= 821 and hd.hd_hash >= 297 and hd.hd_hash <= 697
;
