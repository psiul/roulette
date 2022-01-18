select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 149 and ss.ss_hash <= 899 and i.i_hash >= 226 and i.i_hash <= 559 and hd.hd_hash >= 327 and hd.hd_hash <= 727
;
