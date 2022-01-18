select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 391 and ss.ss_hash <= 724 and c.c_hash >= 135 and c.c_hash <= 885 and cd.cd_hash >= 474 and cd.cd_hash <= 874
;
