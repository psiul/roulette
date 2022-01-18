select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 234 and ss.ss_hash <= 984 and hd.hd_hash >= 541 and hd.hd_hash <= 874 and i.i_hash >= 168 and i.i_hash <= 568
;
