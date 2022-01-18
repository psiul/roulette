select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 55 and c.c_hash <= 805 and hd.hd_hash >= 278 and hd.hd_hash <= 678 and d.d_hash >= 371 and d.d_hash <= 704
;
