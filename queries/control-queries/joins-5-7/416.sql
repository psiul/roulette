select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 226 and i.i_hash <= 976 and d.d_hash >= 72 and d.d_hash <= 405 and cd.cd_hash >= 51 and cd.cd_hash <= 451
;
