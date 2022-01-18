select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 7 and ss.ss_hash <= 757 and d.d_hash >= 589 and d.d_hash <= 989 and i.i_hash >= 33 and i.i_hash <= 366
;
