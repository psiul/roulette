select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 238 and cd.cd_hash <= 638 and i.i_hash >= 505 and i.i_hash <= 838 and d.d_hash >= 80 and d.d_hash <= 830
;
