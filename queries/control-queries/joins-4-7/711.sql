select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 574 and ss.ss_hash <= 907 and c.c_hash >= 584 and c.c_hash <= 984 and d.d_hash >= 212 and d.d_hash <= 962
;
