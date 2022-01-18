select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 595 and ss.ss_hash <= 995 and d.d_hash >= 11 and d.d_hash <= 761 and hd.hd_hash >= 280 and hd.hd_hash <= 613
;
