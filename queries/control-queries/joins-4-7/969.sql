select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 646 and ss.ss_hash <= 979 and i.i_hash >= 91 and i.i_hash <= 841 and d.d_hash >= 530 and d.d_hash <= 930
;
