select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 556 and ss.ss_hash <= 656 and cd.cd_hash >= 900 and cd.cd_hash <= 950 and d.d_hash >= 597 and d.d_hash <= 797
;
