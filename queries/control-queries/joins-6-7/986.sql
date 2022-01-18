select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 518 and c.c_hash <= 851 and a.ca_hash >= 190 and a.ca_hash <= 940 and cd.cd_hash >= 363 and cd.cd_hash <= 763
;
