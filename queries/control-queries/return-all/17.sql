select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 456 and ss.ss_hash <= 856 and cd.cd_hash >= 223 and cd.cd_hash <= 973 and i.i_hash >= 32 and i.i_hash <= 365
;
