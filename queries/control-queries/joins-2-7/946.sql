select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 279 and ss.ss_hash <= 779 and hd.hd_hash >= 477 and hd.hd_hash <= 677
;
