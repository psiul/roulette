select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 199 and d.d_hash <= 949 and c.c_hash >= 569 and c.c_hash <= 902 and i.i_hash >= 544 and i.i_hash <= 944
;
