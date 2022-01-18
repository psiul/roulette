select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 196 and ss.ss_hash <= 696 and hd.hd_hash >= 476 and hd.hd_hash <= 676
;
