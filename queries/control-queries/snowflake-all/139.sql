select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 339 and d.d_hash <= 739 and i.i_hash >= 579 and i.i_hash <= 912 and cd.cd_hash >= 11 and cd.cd_hash <= 761
;
