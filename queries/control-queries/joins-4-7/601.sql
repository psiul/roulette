select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 450 and ss.ss_hash <= 850 and d.d_hash >= 81 and d.d_hash <= 831 and c.c_hash >= 404 and c.c_hash <= 737
;
