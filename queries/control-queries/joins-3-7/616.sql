select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 110 and ss.ss_hash <= 860 and hd.hd_hash >= 296 and hd.hd_hash <= 629 and i.i_hash >= 488 and i.i_hash <= 888
;
