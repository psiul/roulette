select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 68 and ss.ss_hash <= 818 and c.c_hash >= 310 and c.c_hash <= 710 and hd.hd_hash >= 529 and hd.hd_hash <= 862
;
