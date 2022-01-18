select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 342 and ss.ss_hash <= 542 and hd.hd_hash >= 2 and hd.hd_hash <= 502
;
