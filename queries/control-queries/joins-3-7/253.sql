select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 107 and ss.ss_hash <= 857 and i.i_hash >= 509 and i.i_hash <= 842 and hd.hd_hash >= 378 and hd.hd_hash <= 778
;
