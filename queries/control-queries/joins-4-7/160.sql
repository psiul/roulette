select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 185 and ss.ss_hash <= 518 and d.d_hash >= 172 and d.d_hash <= 572 and i.i_hash >= 200 and i.i_hash <= 950
;
