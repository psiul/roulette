select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 444 and ss.ss_hash <= 844 and i.i_hash >= 145 and i.i_hash <= 895 and hd.hd_hash >= 397 and hd.hd_hash <= 730
;
