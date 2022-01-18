select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 36 and ss.ss_hash <= 786 and i.i_hash >= 158 and i.i_hash <= 491 and hd.hd_hash >= 413 and hd.hd_hash <= 813
;
