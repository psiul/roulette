select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 319 and c.c_hash <= 719 and i.i_hash >= 134 and i.i_hash <= 884 and d.d_hash >= 451 and d.d_hash <= 784
;
