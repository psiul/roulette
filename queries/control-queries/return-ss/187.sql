select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 337 and d.d_hash <= 670 and i.i_hash >= 492 and i.i_hash <= 892 and cd.cd_hash >= 174 and cd.cd_hash <= 924
;
