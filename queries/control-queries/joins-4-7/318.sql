select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 516 and ss.ss_hash <= 916 and cd.cd_hash >= 206 and cd.cd_hash <= 956 and c.c_hash >= 402 and c.c_hash <= 735
;
