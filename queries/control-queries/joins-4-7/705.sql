select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 6 and ss.ss_hash <= 339 and d.d_hash >= 107 and d.d_hash <= 507 and i.i_hash >= 120 and i.i_hash <= 870
;
