select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 480 and ss.ss_hash <= 880 and i.i_hash >= 653 and i.i_hash <= 986 and d.d_hash >= 208 and d.d_hash <= 958
;
