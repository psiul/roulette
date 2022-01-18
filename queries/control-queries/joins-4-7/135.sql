select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 96 and ss.ss_hash <= 496 and hd.hd_hash >= 151 and hd.hd_hash <= 901 and c.c_hash >= 401 and c.c_hash <= 734
;
