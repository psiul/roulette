select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 348 and ss.ss_hash <= 848 and i.i_hash >= 500 and i.i_hash <= 700 and cd.cd_hash >= 849 and cd.cd_hash <= 949
;
