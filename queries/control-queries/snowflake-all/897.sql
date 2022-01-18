select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 197 and ss.ss_hash <= 947 and cd.cd_hash >= 449 and cd.cd_hash <= 849 and hd.hd_hash >= 227 and hd.hd_hash <= 560
;
