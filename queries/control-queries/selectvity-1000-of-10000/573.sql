select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 571 and i.i_hash <= 904 and c.c_hash >= 492 and c.c_hash <= 892 and d.d_hash >= 47 and d.d_hash <= 797
;
