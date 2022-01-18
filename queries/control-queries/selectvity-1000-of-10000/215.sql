select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 539 and ss.ss_hash <= 872 and c.c_hash >= 2 and c.c_hash <= 752 and i.i_hash >= 564 and i.i_hash <= 964
;
