select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 802 and hd.hd_hash <= 852 and c.c_hash >= 557 and c.c_hash <= 757 and cd.cd_hash >= 407 and cd.cd_hash <= 507
;