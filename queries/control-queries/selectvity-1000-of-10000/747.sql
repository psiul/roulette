select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 140 and ss.ss_hash <= 890 and i.i_hash >= 656 and i.i_hash <= 989 and c.c_hash >= 268 and c.c_hash <= 668
;
