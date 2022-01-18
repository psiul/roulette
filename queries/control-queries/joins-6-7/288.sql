select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 134 and ss.ss_hash <= 884 and hd.hd_hash >= 109 and hd.hd_hash <= 509 and d.d_hash >= 569 and d.d_hash <= 902
;
