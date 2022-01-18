select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,customer_address a,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 131 and hd.hd_hash <= 464 and c.c_hash >= 46 and c.c_hash <= 796 and cd.cd_hash >= 307 and cd.cd_hash <= 707
;
