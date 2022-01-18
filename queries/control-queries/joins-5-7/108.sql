select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 58 and hd.hd_hash <= 391 and d.d_hash >= 229 and d.d_hash <= 979 and cd.cd_hash >= 114 and cd.cd_hash <= 514
;
