select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 111 and ss.ss_hash <= 511 and i.i_hash >= 104 and i.i_hash <= 854 and d.d_hash >= 207 and d.d_hash <= 540
;
