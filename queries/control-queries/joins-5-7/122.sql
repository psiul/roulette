select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 371 and ss.ss_hash <= 704 and i.i_hash >= 176 and i.i_hash <= 926 and c.c_hash >= 569 and c.c_hash <= 969
;
