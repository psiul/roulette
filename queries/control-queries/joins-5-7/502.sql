select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 37 and ss.ss_hash <= 370 and cd.cd_hash >= 171 and cd.cd_hash <= 921 and hd.hd_hash >= 148 and hd.hd_hash <= 548
;
