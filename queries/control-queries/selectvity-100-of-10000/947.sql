select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 359 and ss.ss_hash <= 859 and i.i_hash >= 229 and i.i_hash <= 429 and c.c_hash >= 814 and c.c_hash <= 914
;
