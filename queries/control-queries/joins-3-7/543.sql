select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 20 and ss.ss_hash <= 770 and hd.hd_hash >= 545 and hd.hd_hash <= 878 and c.c_hash >= 362 and c.c_hash <= 762
;
