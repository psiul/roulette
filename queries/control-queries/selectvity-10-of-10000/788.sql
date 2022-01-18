select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 152 and cd.cd_hash <= 352 and hd.hd_hash >= 817 and hd.hd_hash <= 867 and d.d_hash >= 386 and d.d_hash <= 486
;
