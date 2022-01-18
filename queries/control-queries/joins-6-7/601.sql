select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 195 and ss.ss_hash <= 945 and a.ca_hash >= 185 and a.ca_hash <= 518 and hd.hd_hash >= 94 and hd.hd_hash <= 494
;
