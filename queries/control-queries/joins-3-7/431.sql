select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 202 and ss.ss_hash <= 602 and i.i_hash >= 93 and i.i_hash <= 843 and hd.hd_hash >= 405 and hd.hd_hash <= 738
;
