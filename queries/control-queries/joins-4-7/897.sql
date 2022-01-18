select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 431 and ss.ss_hash <= 831 and cd.cd_hash >= 365 and cd.cd_hash <= 698 and c.c_hash >= 203 and c.c_hash <= 953
;
