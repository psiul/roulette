select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 228 and ss.ss_hash <= 978 and i.i_hash >= 41 and i.i_hash <= 374 and hd.hd_hash >= 103 and hd.hd_hash <= 503
;
