select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 145 and hd.hd_hash <= 478 and d.d_hash >= 96 and d.d_hash <= 846 and cd.cd_hash >= 136 and cd.cd_hash <= 536
;
