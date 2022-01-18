select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 104 and cd.cd_hash <= 854 and d.d_hash >= 426 and d.d_hash <= 759 and i.i_hash >= 564 and i.i_hash <= 964
;
