select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 171 and i.i_hash <= 191 and d.d_hash >= 898 and d.d_hash <= 948 and cd.cd_hash >= 503 and cd.cd_hash <= 603
;
