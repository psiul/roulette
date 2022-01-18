select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 353 and ss.ss_hash <= 686 and d.d_hash >= 76 and d.d_hash <= 826 and c.c_hash >= 340 and c.c_hash <= 740
;
