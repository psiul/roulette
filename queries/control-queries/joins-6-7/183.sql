select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,customer_address a,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 177 and cd.cd_hash <= 510 and c.c_hash >= 32 and c.c_hash <= 432 and a.ca_hash >= 195 and a.ca_hash <= 945
;
