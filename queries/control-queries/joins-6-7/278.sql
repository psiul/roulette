select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,customer_address a,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 240 and cd.cd_hash <= 990 and hd.hd_hash >= 431 and hd.hd_hash <= 764 and a.ca_hash >= 462 and a.ca_hash <= 862
;
