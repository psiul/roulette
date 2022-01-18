select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 381 and ss.ss_hash <= 781 and d.d_hash >= 30 and d.d_hash <= 780 and i.i_hash >= 160 and i.i_hash <= 493
;
