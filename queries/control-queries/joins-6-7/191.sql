select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 301 and cd.cd_hash <= 701 and i.i_hash >= 200 and i.i_hash <= 950 and d.d_hash >= 575 and d.d_hash <= 908
;
