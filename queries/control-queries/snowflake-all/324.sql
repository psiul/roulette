select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 635 and hd.hd_hash <= 968 and c.c_hash >= 256 and c.c_hash <= 656 and cd.cd_hash >= 130 and cd.cd_hash <= 880
;
