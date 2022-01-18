select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 78 and hd.hd_hash <= 828 and c.c_hash >= 128 and c.c_hash <= 461 and cd.cd_hash >= 321 and cd.cd_hash <= 721
;
