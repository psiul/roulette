select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 149 and ss.ss_hash <= 899 and hd.hd_hash >= 451 and hd.hd_hash <= 784 and i.i_hash >= 17 and i.i_hash <= 417
;
