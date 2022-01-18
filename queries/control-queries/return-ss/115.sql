select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 446 and ss.ss_hash <= 846 and c.c_hash >= 55 and c.c_hash <= 805 and d.d_hash >= 148 and d.d_hash <= 481
;
