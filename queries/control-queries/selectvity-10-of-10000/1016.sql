select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 242 and ss.ss_hash <= 442 and hd.hd_hash >= 113 and hd.hd_hash <= 163 and cd.cd_hash >= 605 and cd.cd_hash <= 705
;
