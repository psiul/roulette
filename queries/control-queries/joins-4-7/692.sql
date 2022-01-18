select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 190 and ss.ss_hash <= 940 and d.d_hash >= 39 and d.d_hash <= 372 and i.i_hash >= 289 and i.i_hash <= 689
;
