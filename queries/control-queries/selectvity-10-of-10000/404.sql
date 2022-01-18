select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 513 and ss.ss_hash <= 613 and i.i_hash >= 669 and i.i_hash <= 719 and d.d_hash >= 768 and d.d_hash <= 968
;
