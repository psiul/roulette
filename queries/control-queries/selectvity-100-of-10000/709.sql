select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 708 and c.c_hash <= 808 and d.d_hash >= 90 and d.d_hash <= 590 and cd.cd_hash >= 765 and cd.cd_hash <= 965
;
