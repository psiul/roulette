select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 151 and ss.ss_hash <= 251 and cd.cd_hash >= 91 and cd.cd_hash <= 111 and hd.hd_hash >= 111 and hd.hd_hash <= 161
;