select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 78 and ss.ss_hash <= 828 and hd.hd_hash >= 249 and hd.hd_hash <= 582 and cd.cd_hash >= 109 and cd.cd_hash <= 509
;
