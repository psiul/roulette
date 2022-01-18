select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 244 and hd.hd_hash <= 994 and c.c_hash >= 573 and c.c_hash <= 906 and cd.cd_hash >= 285 and cd.cd_hash <= 685
;
