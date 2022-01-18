select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 449 and ss.ss_hash <= 782 and hd.hd_hash >= 157 and hd.hd_hash <= 557 and i.i_hash >= 111 and i.i_hash <= 861
;
