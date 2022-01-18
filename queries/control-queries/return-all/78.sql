select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 224 and c.c_hash <= 974 and hd.hd_hash >= 289 and hd.hd_hash <= 622 and d.d_hash >= 505 and d.d_hash <= 905
;
