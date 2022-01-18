select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 919 and ss.ss_hash <= 939 and d.d_hash >= 474 and d.d_hash <= 524 and c.c_hash >= 754 and c.c_hash <= 854
;
