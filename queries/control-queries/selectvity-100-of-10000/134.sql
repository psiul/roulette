select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 389 and ss.ss_hash <= 589 and cd.cd_hash >= 798 and cd.cd_hash <= 898 and d.d_hash >= 310 and d.d_hash <= 810
;
