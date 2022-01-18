select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 379 and c.c_hash <= 429 and hd.hd_hash >= 382 and hd.hd_hash <= 402 and d.d_hash >= 530 and d.d_hash <= 630
;
