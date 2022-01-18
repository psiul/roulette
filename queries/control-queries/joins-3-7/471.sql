select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 13 and ss.ss_hash <= 346 and hd.hd_hash >= 211 and hd.hd_hash <= 961 and i.i_hash >= 411 and i.i_hash <= 811
;
