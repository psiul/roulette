select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 131 and i.i_hash <= 881 and cd.cd_hash >= 316 and cd.cd_hash <= 716 and hd.hd_hash >= 211 and hd.hd_hash <= 544
;
