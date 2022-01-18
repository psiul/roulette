select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 573 and d.d_hash <= 673 and i.i_hash >= 724 and i.i_hash <= 924 and cd.cd_hash >= 250 and cd.cd_hash <= 750
;
