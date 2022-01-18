select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 378 and ss.ss_hash <= 778 and i.i_hash >= 164 and i.i_hash <= 497 and cd.cd_hash >= 60 and cd.cd_hash <= 810
;
