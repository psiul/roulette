select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 308 and ss.ss_hash <= 508 and hd.hd_hash >= 31 and hd.hd_hash <= 531
;
