select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 709 and ss.ss_hash <= 909 and cd.cd_hash >= 274 and cd.cd_hash <= 774 and c.c_hash >= 186 and c.c_hash <= 286
;
