select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 42 and ss.ss_hash <= 792 and d.d_hash >= 165 and d.d_hash <= 498 and c.c_hash >= 116 and c.c_hash <= 516
;
