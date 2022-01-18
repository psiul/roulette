select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 165 and ss.ss_hash <= 498 and hd.hd_hash >= 207 and hd.hd_hash <= 957 and cd.cd_hash >= 111 and cd.cd_hash <= 511
;
