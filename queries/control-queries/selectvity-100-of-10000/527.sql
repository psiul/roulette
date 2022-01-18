select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 406 and i.i_hash <= 906 and d.d_hash >= 638 and d.d_hash <= 838 and c.c_hash >= 662 and c.c_hash <= 762
;
