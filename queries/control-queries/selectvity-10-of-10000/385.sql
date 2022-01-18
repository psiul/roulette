select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 407 and c.c_hash <= 457 and d.d_hash >= 44 and d.d_hash <= 144 and i.i_hash >= 719 and i.i_hash <= 919
;
