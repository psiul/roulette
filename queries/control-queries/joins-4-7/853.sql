select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 571 and ss.ss_hash <= 971 and c.c_hash >= 128 and c.c_hash <= 878 and cd.cd_hash >= 615 and cd.cd_hash <= 948
;
