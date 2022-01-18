select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_address a,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 61 and d.d_hash <= 461 and c.c_hash >= 33 and c.c_hash <= 783 and cd.cd_hash >= 533 and cd.cd_hash <= 866
;
