select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 407 and ss.ss_hash <= 507 and i.i_hash >= 878 and i.i_hash <= 898 and cd.cd_hash >= 393 and cd.cd_hash <= 443
;
