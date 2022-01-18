select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 647 and ss.ss_hash <= 980 and c.c_hash >= 91 and c.c_hash <= 841 and hd.hd_hash >= 125 and hd.hd_hash <= 525
;
