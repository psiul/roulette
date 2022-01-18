select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 195 and ss.ss_hash <= 595 and cd.cd_hash >= 561 and cd.cd_hash <= 894 and hd.hd_hash >= 227 and hd.hd_hash <= 977
;
