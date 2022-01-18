select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 162 and ss.ss_hash <= 562 and d.d_hash >= 236 and d.d_hash <= 569 and cd.cd_hash >= 169 and cd.cd_hash <= 919
;
