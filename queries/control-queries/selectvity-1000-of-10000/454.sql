select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 291 and ss.ss_hash <= 624 and i.i_hash >= 198 and i.i_hash <= 948 and c.c_hash >= 269 and c.c_hash <= 669
;
