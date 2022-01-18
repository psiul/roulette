select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 313 and ss.ss_hash <= 713 and d.d_hash >= 175 and d.d_hash <= 925 and c.c_hash >= 183 and c.c_hash <= 516
;
