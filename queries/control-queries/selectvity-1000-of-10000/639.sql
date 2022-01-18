select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 376 and ss.ss_hash <= 776 and hd.hd_hash >= 565 and hd.hd_hash <= 898 and cd.cd_hash >= 231 and cd.cd_hash <= 981
;
