select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,date_dim d,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 177 and cd.cd_hash <= 927 and c.c_hash >= 489 and c.c_hash <= 889 and d.d_hash >= 406 and d.d_hash <= 739
;
