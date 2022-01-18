select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 239 and ss.ss_hash <= 439 and hd.hd_hash >= 288 and hd.hd_hash <= 788
;
