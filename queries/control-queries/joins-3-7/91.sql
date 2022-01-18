select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 73 and ss.ss_hash <= 473 and hd.hd_hash >= 49 and hd.hd_hash <= 799 and i.i_hash >= 101 and i.i_hash <= 434
;
