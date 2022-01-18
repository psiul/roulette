select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 192 and ss.ss_hash <= 942 and d.d_hash >= 150 and d.d_hash <= 550 and i.i_hash >= 396 and i.i_hash <= 729
;
