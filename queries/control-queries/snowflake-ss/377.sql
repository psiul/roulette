select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 605 and i.i_hash <= 938 and d.d_hash >= 102 and d.d_hash <= 852 and c.c_hash >= 101 and c.c_hash <= 501
;
