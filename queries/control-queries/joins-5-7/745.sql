select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 530 and c.c_hash <= 930 and i.i_hash >= 196 and i.i_hash <= 946 and d.d_hash >= 269 and d.d_hash <= 602
;
