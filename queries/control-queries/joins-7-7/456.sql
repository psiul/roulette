select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,customer_demographics cd,customer_address a,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 32 and ss.ss_hash <= 782 and d.d_hash >= 458 and d.d_hash <= 858 and a.ca_hash >= 557 and a.ca_hash <= 890
;
