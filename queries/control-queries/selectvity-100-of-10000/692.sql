select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 192 and ss.ss_hash <= 692 and cd.cd_hash >= 245 and cd.cd_hash <= 445 and hd.hd_hash >= 663 and hd.hd_hash <= 763
;
