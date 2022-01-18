select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 335 and c.c_hash <= 735 and cd.cd_hash >= 188 and cd.cd_hash <= 938 and d.d_hash >= 430 and d.d_hash <= 763
;
