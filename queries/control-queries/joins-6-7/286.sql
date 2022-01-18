select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 147 and cd.cd_hash <= 547 and c.c_hash >= 163 and c.c_hash <= 913 and a.ca_hash >= 621 and a.ca_hash <= 954
;
