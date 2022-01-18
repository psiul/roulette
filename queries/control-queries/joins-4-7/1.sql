select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 101 and ss.ss_hash <= 501 and c.c_hash >= 378 and c.c_hash <= 711 and cd.cd_hash >= 109 and cd.cd_hash <= 859
;
