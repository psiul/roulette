select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 313 and ss.ss_hash <= 646 and c.c_hash >= 67 and c.c_hash <= 817 and hd.hd_hash >= 321 and hd.hd_hash <= 721
;
