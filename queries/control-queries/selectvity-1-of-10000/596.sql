select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 353 and ss.ss_hash <= 403 and hd.hd_hash >= 707 and hd.hd_hash <= 727 and cd.cd_hash >= 57 and cd.cd_hash <= 157
;
