select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 430 and d.d_hash <= 763 and cd.cd_hash >= 233 and cd.cd_hash <= 983 and i.i_hash >= 427 and i.i_hash <= 827
;
