select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_address a,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 267 and hd.hd_hash <= 667 and a.ca_hash >= 52 and a.ca_hash <= 802 and cd.cd_hash >= 46 and cd.cd_hash <= 379
;
