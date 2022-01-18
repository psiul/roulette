select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 684 and d.d_hash <= 784 and i.i_hash >= 570 and i.i_hash <= 770 and c.c_hash >= 117 and c.c_hash <= 167
;
