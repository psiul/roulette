select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 793 and i.i_hash <= 993 and d.d_hash >= 602 and d.d_hash <= 702 and cd.cd_hash >= 185 and cd.cd_hash <= 235
;
