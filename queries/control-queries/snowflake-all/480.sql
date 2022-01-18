select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 153 and ss.ss_hash <= 903 and i.i_hash >= 530 and i.i_hash <= 930 and c.c_hash >= 88 and c.c_hash <= 421
;
