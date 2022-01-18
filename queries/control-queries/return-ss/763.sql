select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 227 and i.i_hash <= 627 and cd.cd_hash >= 201 and cd.cd_hash <= 951 and hd.hd_hash >= 301 and hd.hd_hash <= 634
;
