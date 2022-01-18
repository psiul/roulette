select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 365 and ss.ss_hash <= 765 and c.c_hash >= 13 and c.c_hash <= 763 and hd.hd_hash >= 263 and hd.hd_hash <= 596
;
