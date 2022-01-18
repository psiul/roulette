select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 12 and ss.ss_hash <= 762 and d.d_hash >= 466 and d.d_hash <= 866 and c.c_hash >= 512 and c.c_hash <= 845
;
