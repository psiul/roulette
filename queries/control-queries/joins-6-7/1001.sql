select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 91 and ss.ss_hash <= 841 and c.c_hash >= 426 and c.c_hash <= 826 and cd.cd_hash >= 407 and cd.cd_hash <= 740
;
