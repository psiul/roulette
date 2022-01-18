select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 225 and ss.ss_hash <= 558 and c.c_hash >= 1 and c.c_hash <= 751 and d.d_hash >= 175 and d.d_hash <= 575
;
