select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 73 and ss.ss_hash <= 406 and c.c_hash >= 193 and c.c_hash <= 943 and cd.cd_hash >= 460 and cd.cd_hash <= 860
;
