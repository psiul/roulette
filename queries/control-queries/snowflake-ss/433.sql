select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 171 and ss.ss_hash <= 571 and c.c_hash >= 200 and c.c_hash <= 533 and cd.cd_hash >= 193 and cd.cd_hash <= 943
;
