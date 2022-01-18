select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 447 and ss.ss_hash <= 497 and cd.cd_hash >= 42 and cd.cd_hash <= 242 and c.c_hash >= 831 and c.c_hash <= 931
;
