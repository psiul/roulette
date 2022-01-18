select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 240 and i.i_hash <= 440 and d.d_hash >= 259 and d.d_hash <= 309 and cd.cd_hash >= 714 and cd.cd_hash <= 814
;
