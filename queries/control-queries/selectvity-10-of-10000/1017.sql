select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 622 and ss.ss_hash <= 672 and d.d_hash >= 91 and d.d_hash <= 191 and c.c_hash >= 83 and c.c_hash <= 283
;
