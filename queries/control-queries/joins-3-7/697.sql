select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 211 and ss.ss_hash <= 544 and hd.hd_hash >= 136 and hd.hd_hash <= 886 and i.i_hash >= 347 and i.i_hash <= 747
;
