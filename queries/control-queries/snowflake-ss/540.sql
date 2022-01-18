select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 213 and ss.ss_hash <= 546 and c.c_hash >= 167 and c.c_hash <= 917 and cd.cd_hash >= 233 and cd.cd_hash <= 633
;
