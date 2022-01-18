select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 28 and ss.ss_hash <= 778 and hd.hd_hash >= 508 and hd.hd_hash <= 841 and i.i_hash >= 68 and i.i_hash <= 468
;
