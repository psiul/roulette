select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 435 and ss.ss_hash <= 835 and d.d_hash >= 447 and d.d_hash <= 780 and c.c_hash >= 174 and c.c_hash <= 924
;
