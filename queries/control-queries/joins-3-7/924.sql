select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 167 and ss.ss_hash <= 917 and hd.hd_hash >= 49 and hd.hd_hash <= 449 and i.i_hash >= 131 and i.i_hash <= 464
;
