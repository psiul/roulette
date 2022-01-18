select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 276 and c.c_hash <= 326 and d.d_hash >= 318 and d.d_hash <= 418 and i.i_hash >= 295 and i.i_hash <= 495
;
