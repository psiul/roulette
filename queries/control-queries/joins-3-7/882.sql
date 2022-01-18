select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 82 and ss.ss_hash <= 832 and hd.hd_hash >= 412 and hd.hd_hash <= 812 and i.i_hash >= 144 and i.i_hash <= 477
;
