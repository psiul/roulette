select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 160 and ss.ss_hash <= 493 and d.d_hash >= 244 and d.d_hash <= 994 and cd.cd_hash >= 430 and cd.cd_hash <= 830
;
