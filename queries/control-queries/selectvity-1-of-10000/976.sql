select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 706 and i.i_hash <= 756 and cd.cd_hash >= 18 and cd.cd_hash <= 118 and c.c_hash >= 692 and c.c_hash <= 712
;
