select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 19 and i.i_hash <= 419 and hd.hd_hash >= 40 and hd.hd_hash <= 790 and c.c_hash >= 523 and c.c_hash <= 856
;
