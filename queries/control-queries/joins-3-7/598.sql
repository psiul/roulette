select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 62 and ss.ss_hash <= 395 and c.c_hash >= 182 and c.c_hash <= 932 and hd.hd_hash >= 569 and hd.hd_hash <= 969
;
