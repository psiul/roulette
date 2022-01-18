select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 85 and ss.ss_hash <= 418 and hd.hd_hash >= 151 and hd.hd_hash <= 901 and cd.cd_hash >= 15 and cd.cd_hash <= 415
;
