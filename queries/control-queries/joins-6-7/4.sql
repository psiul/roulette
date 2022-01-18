select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 523 and c.c_hash <= 923 and d.d_hash >= 109 and d.d_hash <= 859 and hd.hd_hash >= 72 and hd.hd_hash <= 405
;
