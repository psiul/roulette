select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 114 and ss.ss_hash <= 864 and c.c_hash >= 87 and c.c_hash <= 487 and hd.hd_hash >= 190 and hd.hd_hash <= 523
;
