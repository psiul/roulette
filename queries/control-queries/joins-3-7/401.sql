select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 462 and ss.ss_hash <= 862 and i.i_hash >= 303 and i.i_hash <= 636 and hd.hd_hash >= 156 and hd.hd_hash <= 906
;
