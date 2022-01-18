select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 293 and ss.ss_hash <= 493 and c.c_hash >= 182 and c.c_hash <= 682 and cd.cd_hash >= 70 and cd.cd_hash <= 170
;
