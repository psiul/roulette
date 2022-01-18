select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 346 and ss.ss_hash <= 546 and hd.hd_hash >= 78 and hd.hd_hash <= 578
;
