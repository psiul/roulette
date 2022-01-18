select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 10 and ss.ss_hash <= 410 and hd.hd_hash >= 178 and hd.hd_hash <= 928 and i.i_hash >= 541 and i.i_hash <= 874
;
