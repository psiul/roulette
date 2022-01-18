select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 417 and ss.ss_hash <= 917 and i.i_hash >= 293 and i.i_hash <= 493 and d.d_hash >= 675 and d.d_hash <= 775
;
