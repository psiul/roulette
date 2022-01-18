select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 158 and c.c_hash <= 908 and i.i_hash >= 348 and i.i_hash <= 748 and d.d_hash >= 302 and d.d_hash <= 635
;
