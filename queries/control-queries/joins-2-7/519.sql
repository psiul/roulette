select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 790 and ss.ss_hash <= 990 and hd.hd_hash >= 383 and hd.hd_hash <= 883
;
