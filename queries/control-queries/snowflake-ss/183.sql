select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 550 and c.c_hash <= 883 and i.i_hash >= 522 and i.i_hash <= 922 and cd.cd_hash >= 13 and cd.cd_hash <= 763
;
