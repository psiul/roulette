select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 241 and i.i_hash <= 991 and c.c_hash >= 417 and c.c_hash <= 750 and cd.cd_hash >= 146 and cd.cd_hash <= 546
;
