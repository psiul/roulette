select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 165 and ss.ss_hash <= 498 and d.d_hash >= 229 and d.d_hash <= 629 and cd.cd_hash >= 195 and cd.cd_hash <= 945
;
