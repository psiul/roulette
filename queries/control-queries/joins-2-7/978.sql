select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 180 and ss.ss_hash <= 680 and hd.hd_hash >= 223 and hd.hd_hash <= 423
;
