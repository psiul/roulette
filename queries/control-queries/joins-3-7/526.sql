select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 335 and ss.ss_hash <= 735 and i.i_hash >= 60 and i.i_hash <= 810 and hd.hd_hash >= 109 and hd.hd_hash <= 442
;
