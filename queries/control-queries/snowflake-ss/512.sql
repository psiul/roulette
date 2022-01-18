select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 47 and ss.ss_hash <= 447 and c.c_hash >= 110 and c.c_hash <= 860 and cd.cd_hash >= 586 and cd.cd_hash <= 919
;
