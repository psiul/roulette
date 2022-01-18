select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 12 and c.c_hash <= 345 and cd.cd_hash >= 402 and cd.cd_hash <= 802 and i.i_hash >= 68 and i.i_hash <= 818
;
