select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 117 and ss.ss_hash <= 867 and hd.hd_hash >= 555 and hd.hd_hash <= 888 and i.i_hash >= 109 and i.i_hash <= 509
;
