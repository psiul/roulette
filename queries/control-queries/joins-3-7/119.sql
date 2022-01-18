select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 351 and ss.ss_hash <= 751 and hd.hd_hash >= 230 and hd.hd_hash <= 980 and c.c_hash >= 492 and c.c_hash <= 825
;
