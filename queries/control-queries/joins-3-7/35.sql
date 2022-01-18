select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 462 and ss.ss_hash <= 862 and hd.hd_hash >= 134 and hd.hd_hash <= 467 and i.i_hash >= 135 and i.i_hash <= 885
;
