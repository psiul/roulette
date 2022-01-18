select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 191 and cd.cd_hash <= 941 and a.ca_hash >= 466 and a.ca_hash <= 799 and d.d_hash >= 208 and d.d_hash <= 608
;
