select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 402 and d.d_hash <= 735 and c.c_hash >= 48 and c.c_hash <= 448 and cd.cd_hash >= 186 and cd.cd_hash <= 936
;
