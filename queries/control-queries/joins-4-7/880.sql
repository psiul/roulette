select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 384 and ss.ss_hash <= 784 and d.d_hash >= 480 and d.d_hash <= 813 and c.c_hash >= 80 and c.c_hash <= 830
;
