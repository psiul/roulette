select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 837 and ss.ss_hash <= 857 and i.i_hash >= 76 and i.i_hash <= 126 and cd.cd_hash >= 702 and cd.cd_hash <= 802
;
