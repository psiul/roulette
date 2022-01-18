select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 296 and i.i_hash <= 696 and cd.cd_hash >= 219 and cd.cd_hash <= 552 and d.d_hash >= 74 and d.d_hash <= 824
;
