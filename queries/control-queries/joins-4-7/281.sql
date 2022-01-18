select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 109 and ss.ss_hash <= 859 and cd.cd_hash >= 382 and cd.cd_hash <= 715 and c.c_hash >= 529 and c.c_hash <= 929
;
