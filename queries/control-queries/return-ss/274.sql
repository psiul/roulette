select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 171 and d.d_hash <= 571 and i.i_hash >= 88 and i.i_hash <= 838 and cd.cd_hash >= 479 and cd.cd_hash <= 812
;
